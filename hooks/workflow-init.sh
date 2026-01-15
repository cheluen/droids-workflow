#!/bin/bash
# Droids Workflow Init - Initialize workflow state
# Called at the start of /droids:start command

WORKFLOW_STATE_DIR="/tmp/droids-workflow"
ACTIVE_FILE="$WORKFLOW_STATE_DIR/active"
STATE_FILE="$WORKFLOW_STATE_DIR/state"

# Create state directory
mkdir -p "$WORKFLOW_STATE_DIR"

# Create active marker
echo "$(date +%s)" > "$ACTIVE_FILE"

# Initialize empty state file
echo "# Droids Workflow State" > "$STATE_FILE"
echo "# Started at: $(date)" >> "$STATE_FILE"

echo "Droids workflow initialized"
exit 0
