#!/bin/bash
# Manually trigger the release workflow

set -e

REPO_DIR="/home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit"

echo "════════════════════════════════════════════════════"
echo "  Manual Workflow Trigger"
echo "════════════════════════════════════════════════════"
echo
echo "The workflow didn't auto-trigger because the fix was in src/"
echo "but the workflow only monitors: memory/, scripts/, templates/"
echo
echo "Choose a method to trigger the workflow:"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  METHOD 1: Touch a monitored file (Recommended)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "This will make a trivial change to trigger the workflow:"
echo
echo "  cd $REPO_DIR"
echo "  touch memory/constitution.md"
echo "  git add memory/constitution.md"
echo "  git commit -m 'chore: trigger release workflow'"
echo "  git push origin main"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  METHOD 2: Manual dispatch via GitHub UI"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "1. Go to: https://github.com/LeFrenchPOC/hardware-spec-kit/actions/workflows/release.yml"
echo "2. Click 'Run workflow' button (top right)"
echo "3. Click green 'Run workflow' button"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  METHOD 3: Use GitHub CLI (if installed)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "  gh workflow run release.yml"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

read -p "Use METHOD 1 (touch & push)? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd "$REPO_DIR"
    
    echo "→ Touching memory/constitution.md..."
    touch memory/constitution.md
    
    echo "→ Adding and committing..."
    git add memory/constitution.md
    git commit -m "chore: trigger release workflow

The previous fix (e56f874) corrected the template asset naming but didn't
trigger the workflow because src/ is not in the monitored paths.

This commit touches memory/ to trigger the release workflow which will
create v0.1.3 with proper template assets."
    
    echo "→ Pushing..."
    git push origin main
    
    echo
    echo "✓ Pushed! Workflow should start in ~10 seconds."
    echo
    echo "Watch progress:"
    echo "  https://github.com/LeFrenchPOC/hardware-spec-kit/actions"
    echo
    echo "After ~2-3 minutes, verify:"
    echo "  ./scripts/verify-release.sh"
else
    echo
    echo "Skipped. Use one of the other methods shown above."
    echo
fi
