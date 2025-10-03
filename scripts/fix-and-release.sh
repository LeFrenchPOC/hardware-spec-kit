#!/bin/bash
# Quick script to fix and trigger new release

set -e

REPO_DIR="/home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit"

echo "═══════════════════════════════════════════════════"
echo "  Hardware Spec Kit - Release Fix Script"
echo "═══════════════════════════════════════════════════"
echo

cd "$REPO_DIR"

# Check git status
if [[ -n $(git status -s) ]]; then
    echo "✓ Changes detected in working directory"
    echo
    git status -s
    echo
else
    echo "⚠ No changes detected"
    echo "  The fix may already be committed."
    echo
fi

# Show current branch
BRANCH=$(git branch --show-current)
echo "Current branch: $BRANCH"
echo

# Offer to commit and push
read -p "Do you want to commit and push the fix to trigger release? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
    echo "→ Adding changes..."
    git add src/specify_cli/__init__.py RELEASE_FIX_GUIDE.md
    
    echo "→ Committing..."
    git commit -m "fix: correct template asset naming pattern to match workflow

- Changed pattern from 'hardware-spec-kit-template-' to 'spec-kit-template-'
- This matches the actual asset names created by release.yml workflow
- Fixes 'no release asset' error when initializing projects
- Added RELEASE_FIX_GUIDE.md for troubleshooting

Closes issue with missing agent commands (/constitution, /plan, /tasks)"
    
    echo "→ Pushing to $BRANCH..."
    git push origin "$BRANCH"
    
    echo
    echo "═══════════════════════════════════════════════════"
    echo "  ✓ Fix pushed successfully!"
    echo "═══════════════════════════════════════════════════"
    echo
    echo "Next steps:"
    echo "1. Watch workflow progress:"
    echo "   https://github.com/LeFrenchPOC/hardware-spec-kit/actions"
    echo
    echo "2. After ~2-3 minutes, verify new release:"
    echo "   https://github.com/LeFrenchPOC/hardware-spec-kit/releases/latest"
    echo
    echo "3. Test the CLI:"
    echo "   cd /tmp && uvx --from git+https://github.com/LeFrenchPOC/hardware-spec-kit.git specify init test-hw --ai copilot"
    echo
else
    echo
    echo "Skipped. You can manually commit and push when ready:"
    echo
    echo "  cd $REPO_DIR"
    echo "  git add src/specify_cli/__init__.py"
    echo "  git commit -m 'fix: correct template asset naming pattern'"
    echo "  git push origin $BRANCH"
    echo
fi
