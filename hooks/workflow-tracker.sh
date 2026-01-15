#!/bin/bash
# Droids Workflow Tracker - PostToolUse Hook
# Tracks workflow progress after Task tool completion
# Only activates when droids workflow is active

WORKFLOW_STATE_DIR="/tmp/droids-workflow"
ACTIVE_FILE="$WORKFLOW_STATE_DIR/active"
STATE_FILE="$WORKFLOW_STATE_DIR/state"

# Check if droids workflow is active
if [ ! -f "$ACTIVE_FILE" ]; then
    exit 0
fi

# Read the tool output from stdin
INPUT=$(cat)

# Extract subagent_type from context
SUBAGENT=$(echo "$INPUT" | grep -oP '"subagent_type"\s*:\s*"[^"]*"' | grep -oP ':\s*"\K[^"]+' | head -1)

# If no subagent found, try to get from description
if [ -z "$SUBAGENT" ]; then
    SUBAGENT=$(echo "$INPUT" | grep -oP '"description"\s*:\s*"[^"]*"' | grep -oP ':\s*"\K[^"]+' | head -1)
fi

# Check if this is a droids agent
DROIDS_AGENTS="backend-engineer frontend-engineer code-reviewer test-engineer doc-writer"
IS_DROIDS_AGENT=false
for agent in $DROIDS_AGENTS; do
    if [[ "$SUBAGENT" == *"$agent"* ]]; then
        IS_DROIDS_AGENT=true
        SUBAGENT=$agent
        break
    fi
done

if [ "$IS_DROIDS_AGENT" = false ]; then
    exit 0
fi

# Update state file - mark agent as completed
if [ -f "$STATE_FILE" ]; then
    # Replace started with completed
    sed -i "s/$SUBAGENT:started/$SUBAGENT:completed/g" "$STATE_FILE"

    # Check if coding phase is complete
    BACKEND_DONE=$(grep -c "backend-engineer:completed" "$STATE_FILE" 2>/dev/null || echo "0")
    FRONTEND_DONE=$(grep -c "frontend-engineer:completed" "$STATE_FILE" 2>/dev/null || echo "0")
    CODING_MARKED=$(grep -c "coding:completed" "$STATE_FILE" 2>/dev/null || echo "0")

    # If either backend or frontend completed and coding not marked, mark it
    if [ "$CODING_MARKED" = "0" ]; then
        if [ "$BACKEND_DONE" != "0" ] || [ "$FRONTEND_DONE" != "0" ]; then
            # Check if there's still coding in progress
            BACKEND_STARTED=$(grep -c "backend-engineer:started" "$STATE_FILE" 2>/dev/null || echo "0")
            FRONTEND_STARTED=$(grep -c "frontend-engineer:started" "$STATE_FILE" 2>/dev/null || echo "0")

            if [ "$BACKEND_STARTED" = "0" ] && [ "$FRONTEND_STARTED" = "0" ]; then
                echo "coding:completed" >> "$STATE_FILE"
            fi
        fi
    fi
fi

exit 0
