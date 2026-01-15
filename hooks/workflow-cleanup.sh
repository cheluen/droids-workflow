#!/bin/bash
# Droids Workflow Cleanup - Clean up workflow state
# Called at the end of /droids:start command

WORKFLOW_STATE_DIR="/tmp/droids-workflow"
ACTIVE_FILE="$WORKFLOW_STATE_DIR/active"
STATE_FILE="$WORKFLOW_STATE_DIR/state"

# Remove active marker
if [ -f "$ACTIVE_FILE" ]; then
    rm -f "$ACTIVE_FILE"
fi

# Optionally keep state file for debugging
# To remove completely, uncomment:
# rm -rf "$WORKFLOW_STATE_DIR"

echo "Droids workflow completed and cleaned up"
exit 0
