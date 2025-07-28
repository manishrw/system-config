#!/bin/bash

# Cursor Settings Sync Script
# Usage: ./sync_cursor.sh [to-app|from-app]
# Syncs settings.json and keybindings.json between local User/ directory and Cursor app

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/User"
DEST_DIR="$HOME/Library/Application Support/Cursor/User"

# Function to display usage
usage() {
    echo "Usage: $0 [to-app|from-app]"
    echo ""
    echo "Options:"
    echo "  to-app    - Sync from local User/ directory to Cursor app"
    echo "  from-app  - Sync from Cursor app to local User/ directory"
    echo ""
    echo "Files synced: settings.json, keybindings.json"
    exit 1
}

# Function to sync files in specified direction
sync_files() {
    local source_dir="$1"
    local target_dir="$2"
    local direction="$3"
    
    echo "Syncing $direction..."
    echo "From: $source_dir"
    echo "To: $target_dir"
    echo ""
    
    # Sync settings.json
    if [ -f "$source_dir/settings.json" ]; then
        cp "$source_dir/settings.json" "$target_dir/settings.json"
        echo "✓ Synced settings.json"
    else
        echo "⚠ settings.json not found in source directory"
    fi
    
    # Sync keybindings.json
    if [ -f "$source_dir/keybindings.json" ]; then
        cp "$source_dir/keybindings.json" "$target_dir/keybindings.json"
        echo "✓ Synced keybindings.json"
    else
        echo "⚠ keybindings.json not found in source directory"
    fi
}

# Check if direction argument is provided
if [ $# -eq 0 ]; then
    usage
fi

# Validate directories exist
if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Local User directory not found at $SRC_DIR"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    echo "Error: Cursor app directory not found at $DEST_DIR"
    echo "Make sure Cursor is installed and has been run at least once."
    exit 1
fi

# Process command
case "$1" in
    "to-app")
        sync_files "$SRC_DIR" "$DEST_DIR" "local → Cursor app"
        ;;
    "from-app")
        sync_files "$DEST_DIR" "$SRC_DIR" "Cursor app → local"
        ;;
    *)
        echo "Error: Invalid option '$1'"
        usage
        ;;
esac

echo ""
echo "Sync completed successfully!"
