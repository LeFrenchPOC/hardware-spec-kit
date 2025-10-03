#!/bin/bash
# Build release packages locally and create GitHub release

set -e

REPO_DIR="/home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit"
BUILD_DIR="/tmp/hardware-spec-kit-release-build"

echo "════════════════════════════════════════════════════════"
echo "  Local Release Builder"
echo "════════════════════════════════════════════════════════"
echo

cd "$REPO_DIR"

# Get current version
LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo "Latest tag: $LATEST_TAG"

# Extract version and increment patch
VERSION=$(echo $LATEST_TAG | sed 's/v//')
IFS='.' read -ra VERSION_PARTS <<< "$VERSION"
MAJOR=${VERSION_PARTS[0]:-0}
MINOR=${VERSION_PARTS[1]:-0}
PATCH=${VERSION_PARTS[2]:-0}
PATCH=$((PATCH + 1))
NEW_VERSION="v$MAJOR.$MINOR.$PATCH"

echo "New version: $NEW_VERSION"
echo

# Clean and create build directory
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

echo "→ Creating base package..."
mkdir -p "$BUILD_DIR/sdd-package-base"

# Copy common folders
if [ -d "memory" ]; then
  cp -r memory "$BUILD_DIR/sdd-package-base/"
  echo "  ✓ Copied memory/"
fi

if [ -d "scripts" ]; then
  cp -r scripts "$BUILD_DIR/sdd-package-base/"
  echo "  ✓ Copied scripts/"
fi

if [ -d "templates" ]; then
  mkdir -p "$BUILD_DIR/sdd-package-base/templates"
  find templates -type f -not -path "templates/commands/*" -exec cp --parents {} "$BUILD_DIR/sdd-package-base/" \;
  echo "  ✓ Copied templates/ (excluding commands)"
fi

# Function to generate commands
generate_commands() {
  local agent=$1
  local ext=$2
  local arg_format=$3
  local output_dir=$4
  
  mkdir -p "$output_dir"
  
  for template in templates/commands/*.md; do
    if [[ -f "$template" ]]; then
      name=$(basename "$template" .md)
      description=$(awk '/^description:/ {gsub(/^description: *"?/, ""); gsub(/"$/, ""); print; exit}' "$template" | tr -d '\r')
      content=$(awk '/^---$/{if(++count==2) start=1; next} start' "$template" | sed "s/{ARGS}/$arg_format/g")
      
      case $ext in
        "toml")
          {
            echo "description = \"$description\""
            echo ""
            echo "prompt = \"\"\""
            echo "$content"
            echo "\"\"\""
          } > "$output_dir/$name.$ext"
          ;;
        "md")
          echo "$content" > "$output_dir/$name.$ext"
          ;;
        "prompt.md")
          {
            echo "# $(echo "$description" | sed 's/\. .*//')"
            echo ""
            echo "$content"
          } > "$output_dir/$name.$ext"
          ;;
      esac
    fi
  done
}

echo
echo "→ Creating Claude Code package..."
mkdir -p "$BUILD_DIR/sdd-claude-package"
cp -r "$BUILD_DIR/sdd-package-base"/* "$BUILD_DIR/sdd-claude-package/"
mkdir -p "$BUILD_DIR/sdd-claude-package/.claude/commands"
generate_commands "claude" "md" "\$ARGUMENTS" "$BUILD_DIR/sdd-claude-package/.claude/commands"
echo "  ✓ Generated .claude/commands/"

echo
echo "→ Creating Gemini CLI package..."
mkdir -p "$BUILD_DIR/sdd-gemini-package"
cp -r "$BUILD_DIR/sdd-package-base"/* "$BUILD_DIR/sdd-gemini-package/"
mkdir -p "$BUILD_DIR/sdd-gemini-package/.gemini/commands"
generate_commands "gemini" "toml" "{{args}}" "$BUILD_DIR/sdd-gemini-package/.gemini/commands"
echo "  ✓ Generated .gemini/commands/"

echo
echo "→ Creating GitHub Copilot package..."
mkdir -p "$BUILD_DIR/sdd-copilot-package"
cp -r "$BUILD_DIR/sdd-package-base"/* "$BUILD_DIR/sdd-copilot-package/"
mkdir -p "$BUILD_DIR/sdd-copilot-package/.github/prompts"
generate_commands "copilot" "prompt.md" "\$ARGUMENTS" "$BUILD_DIR/sdd-copilot-package/.github/prompts"
echo "  ✓ Generated .github/prompts/"

echo
echo "→ Creating ZIP archives..."
cd "$BUILD_DIR"

cd sdd-claude-package && zip -r -q "../spec-kit-template-claude-$NEW_VERSION.zip" . && cd ..
echo "  ✓ spec-kit-template-claude-$NEW_VERSION.zip"

cd sdd-gemini-package && zip -r -q "../spec-kit-template-gemini-$NEW_VERSION.zip" . && cd ..
echo "  ✓ spec-kit-template-gemini-$NEW_VERSION.zip"

cd sdd-copilot-package && zip -r -q "../spec-kit-template-copilot-$NEW_VERSION.zip" . && cd ..
echo "  ✓ spec-kit-template-copilot-$NEW_VERSION.zip"

echo
echo "→ Verifying archives..."
for zip in spec-kit-template-*.zip; do
  size=$(stat -f%z "$zip" 2>/dev/null || stat -c%s "$zip" 2>/dev/null)
  echo "  $zip: $size bytes"
done

echo
echo "════════════════════════════════════════════════════════"
echo "  Archives ready!"
echo "════════════════════════════════════════════════════════"
echo
echo "Next: Create GitHub release and upload assets"
echo

read -p "Create release $NEW_VERSION on GitHub? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
    echo "→ Creating release notes..."
    
    cat > "$BUILD_DIR/release_notes.md" << EOF
Template release $NEW_VERSION

Updated specification-driven development templates for GitHub Copilot, Claude Code, and Gemini CLI.

Download the template for your preferred AI assistant:
- spec-kit-template-copilot-$NEW_VERSION.zip
- spec-kit-template-claude-$NEW_VERSION.zip
- spec-kit-template-gemini-$NEW_VERSION.zip

**Changes:**
- Fixed template asset naming pattern in CLI
- Updated to match workflow-generated asset names
EOF

    echo "→ Creating GitHub release..."
    cd "$REPO_DIR"
    
    # Remove 'v' prefix for title
    VERSION_NO_V=${NEW_VERSION#v}
    
    gh release create "$NEW_VERSION" \
      "$BUILD_DIR/spec-kit-template-copilot-$NEW_VERSION.zip" \
      "$BUILD_DIR/spec-kit-template-claude-$NEW_VERSION.zip" \
      "$BUILD_DIR/spec-kit-template-gemini-$NEW_VERSION.zip" \
      --title "Spec Kit Templates - $VERSION_NO_V" \
      --notes-file "$BUILD_DIR/release_notes.md"
    
    echo
    echo "════════════════════════════════════════════════════════"
    echo "  ✓ Release created successfully!"
    echo "════════════════════════════════════════════════════════"
    echo
    echo "View release:"
    echo "  https://github.com/LeFrenchPOC/hardware-spec-kit/releases/tag/$NEW_VERSION"
    echo
    echo "Verify assets:"
    echo "  ./scripts/verify-release.sh"
    echo
    echo "Test CLI:"
    echo "  cd /tmp"
    echo "  uvx --from git+https://github.com/LeFrenchPOC/hardware-spec-kit.git specify init test-hw --ai copilot"
    echo
else
    echo
    echo "Skipped. Archives are in: $BUILD_DIR"
    echo
    echo "To create release manually:"
    echo "  cd $REPO_DIR"
    echo "  gh release create $NEW_VERSION \\"
    echo "    $BUILD_DIR/spec-kit-template-copilot-$NEW_VERSION.zip \\"
    echo "    $BUILD_DIR/spec-kit-template-claude-$NEW_VERSION.zip \\"
    echo "    $BUILD_DIR/spec-kit-template-gemini-$NEW_VERSION.zip \\"
    echo "    --title 'Spec Kit Templates - ${NEW_VERSION#v}'"
    echo
fi
