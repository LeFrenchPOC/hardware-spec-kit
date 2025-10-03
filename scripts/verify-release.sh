#!/bin/bash
# Verify release assets after workflow completes

echo "════════════════════════════════════════════════"
echo "  Checking Latest Release Assets"
echo "════════════════════════════════════════════════"
echo

REPO="LeFrenchPOC/hardware-spec-kit"

echo "Fetching release info..."
RELEASE_JSON=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")

TAG=$(echo "$RELEASE_JSON" | jq -r '.tag_name')
NAME=$(echo "$RELEASE_JSON" | jq -r '.name')
PUBLISHED=$(echo "$RELEASE_JSON" | jq -r '.published_at')
ASSET_COUNT=$(echo "$RELEASE_JSON" | jq '.assets | length')

echo "Release: $NAME"
echo "Tag: $TAG"
echo "Published: $PUBLISHED"
echo "Assets: $ASSET_COUNT"
echo

if [ "$ASSET_COUNT" -eq 0 ]; then
    echo "❌ No assets found!"
    echo
    echo "This means:"
    echo "  - The workflow hasn't run yet, OR"
    echo "  - The workflow failed"
    echo
    echo "Check workflow status:"
    echo "  https://github.com/$REPO/actions/workflows/release.yml"
    echo
    exit 1
else
    echo "✓ Assets found:"
    echo
    echo "$RELEASE_JSON" | jq -r '.assets[] | "  • \(.name) (\(.size) bytes)"'
    echo
    
    # Check for expected templates
    EXPECTED=("spec-kit-template-copilot" "spec-kit-template-claude" "spec-kit-template-gemini")
    MISSING=()
    
    for template in "${EXPECTED[@]}"; do
        if ! echo "$RELEASE_JSON" | jq -e ".assets[] | select(.name | contains(\"$template\"))" > /dev/null 2>&1; then
            MISSING+=("$template")
        fi
    done
    
    if [ ${#MISSING[@]} -eq 0 ]; then
        echo "✓ All expected templates present!"
        echo
        echo "You can now test:"
        echo "  cd /tmp"
        echo "  uvx --from git+https://github.com/$REPO.git specify init test-hw --ai copilot"
    else
        echo "⚠ Missing templates:"
        for tmpl in "${MISSING[@]}"; do
            echo "  - $tmpl"
        done
    fi
fi
