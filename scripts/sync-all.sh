#!/bin/bash

# Sync documentation from source repositories
# This script pulls the latest documentation from each source repository

set -e

echo "🔄 Starting documentation sync..."

# Define repositories to sync
REPOS=(
    "wizdam-apis"
    "wizdam-sikola"
    "sdgs-mapper"
    "sdgs-analytics"
    "lumera-edge"
)

# Base directory for documentation
DOC_BASE="data"

for repo in "${REPOS[@]}"; do
    echo "📦 Syncing $repo..."
    
    # Determine the target directory based on repo type
    case $repo in
        wizdam-apis|sdgs-analytics)
            TARGET_DIR="$DOC_BASE/references/$repo"
            ;;
        wizdam-sikola|sdgs-mapper|lumera-edge)
            TARGET_DIR="$DOC_BASE/guides/$repo"
            ;;
        *)
            echo "⚠️  Unknown repo type for $repo, skipping..."
            continue
            ;;
    esac
    
    # Check if directory exists
    if [ -d "$TARGET_DIR" ]; then
        echo "✅ Directory exists: $TARGET_DIR"
        # If it's a git submodule, update it
        if [ -d "$TARGET_DIR/.git" ]; then
            cd "$TARGET_DIR"
            git pull origin main || echo "⚠️  Could not pull from main, trying master..."
            git pull origin master || echo "⚠️  Could not pull updates for $repo"
            cd - > /dev/null
        else
            echo "ℹ️  $TARGET_DIR is not a git repository. Manual update required."
        fi
    else
        echo "⚠️  Directory does not exist: $TARGET_DIR"
        echo "   You may need to add documentation files manually or set up git submodules."
    fi
done

echo "✅ Sync complete!"
echo ""
echo "Next steps:"
echo "1. Review changes in the data/ directory"
echo "2. Run 'npm run dev' to preview locally"
echo "3. Commit and push changes when ready"
