#!/bin/bash
# Droids Workflow Guard - PreToolUse Hook
# Validates workflow order before Task tool execution
# Only activates when droids workflow is active

WORKFLOW_STATE_DIR="/tmp/droids-workflow"
ACTIVE_FILE="$WORKFLOW_STATE_DIR/active"
STATE_FILE="$WORKFLOW_STATE_DIR/state"

# Check if droids workflow is active
if [ ! -f "$ACTIVE_FILE" ]; then
    # Not in droids workflow, allow all
    exit 0
fi

# Read the tool input from stdin (Claude Code passes JSON)
INPUT=$(cat)

# Extract subagent_type from the Task tool input
SUBAGENT=$(echo "$INPUT" | grep -oP '"subagent_type"\s*:\s*"[^"]*"' | grep -oP ':\s*"\K[^"]+' | head -1)

# If not a Task call or no subagent_type, allow
if [ -z "$SUBAGENT" ]; then
    exit 0
fi

# Check if this is a droids agent
DROIDS_AGENTS="backend-engineer frontend-engineer code-reviewer test-engineer doc-writer"
IS_DROIDS_AGENT=false
for agent in $DROIDS_AGENTS; do
    if [ "$SUBAGENT" = "$agent" ]; then
        IS_DROIDS_AGENT=true
        break
    fi
done

# If not a droids agent, allow
if [ "$IS_DROIDS_AGENT" = false ]; then
    exit 0
fi

# Read current workflow state
CURRENT_STATE=""
if [ -f "$STATE_FILE" ]; then
    CURRENT_STATE=$(cat "$STATE_FILE")
fi

# Validate workflow order
validate_order() {
    local agent=$1
    local state=$2

    case $agent in
        "backend-engineer")
            # Backend can always run first
            echo "allow"
            ;;
        "frontend-engineer")
            # Frontend must wait for backend (if backend is in the workflow)
            if echo "$state" | grep -q "backend-engineer:completed"; then
                echo "allow"
            elif echo "$state" | grep -q "backend-engineer"; then
                echo "deny:Frontend engineer must wait for backend engineer to complete"
            else
                # No backend in workflow, frontend can proceed
                echo "allow"
            fi
            ;;
        "code-reviewer")
            # Reviewer must wait for coding phase
            if echo "$state" | grep -q "coding:completed"; then
                echo "allow"
            elif echo "$state" | grep -qE "(backend-engineer|frontend-engineer)"; then
                echo "deny:Code reviewer must wait for coding phase to complete"
            else
                # No coding phase, allow (might be direct invocation)
                echo "allow"
            fi
            ;;
        "test-engineer")
            # Test engineer must wait for review (in full workflow)
            if echo "$state" | grep -q "code-reviewer:completed"; then
                echo "allow"
            elif echo "$state" | grep -q "code-reviewer"; then
                echo "deny:Test engineer must wait for code review to complete"
            else
                # No review phase, allow (might be direct invocation)
                echo "allow"
            fi
            ;;
        "doc-writer")
            # Doc writer can run anytime
            echo "allow"
            ;;
        *)
            echo "allow"
            ;;
    esac
}

RESULT=$(validate_order "$SUBAGENT" "$CURRENT_STATE")

if [[ "$RESULT" == "allow" ]]; then
    # Mark agent as started
    echo "$SUBAGENT:started" >> "$STATE_FILE"
    exit 0
elif [[ "$RESULT" == deny:* ]]; then
    # Extract error message
    ERROR_MSG="${RESULT#deny:}"
    echo "$ERROR_MSG" >&2
    exit 2
else
    exit 0
fi
