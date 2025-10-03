# Release Fix Guide

## Problem Summary

Your release `0.1.2` has **no template assets** attached, causing:
1. CLI shows: "no release asset; using local template"
2. Agent commands (`/constitution`, `/plan`, `/tasks`, etc.) are not available

## Root Cause

**Naming mismatch** between:
- **Workflow** creates: `spec-kit-template-{ai}-{version}.zip`
- **CLI** searched for: `hardware-spec-kit-template-{ai}` ❌

## ✅ Fix Applied

Updated `src/specify_cli/__init__.py` line 453 to match workflow naming:
```python
# BEFORE (wrong):
pattern = f"hardware-spec-kit-template-{ai_assistant}"

# AFTER (correct):
pattern = f"spec-kit-template-{ai_assistant}"
```

## 🚀 Next Steps

### Step 1: Trigger Release Workflow

Choose **ONE** of these methods:

#### Method A: Push to trigger (Recommended)
```bash
cd /home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit
git add src/specify_cli/__init__.py
git commit -m "fix: correct template asset naming pattern"
git push origin main
```

The workflow will automatically:
- Create version `v0.1.3`
- Build 3 template ZIPs:
  - `spec-kit-template-copilot-v0.1.3.zip`
  - `spec-kit-template-claude-v0.1.3.zip`
  - `spec-kit-template-gemini-v0.1.3.zip`
- Attach them to the release

#### Method B: Manual workflow dispatch
```bash
# If you have GitHub CLI installed:
gh workflow run release.yml

# OR via web browser:
# 1. Go to: https://github.com/LeFrenchPOC/hardware-spec-kit/actions/workflows/release.yml
# 2. Click "Run workflow" dropdown
# 3. Click green "Run workflow" button
```

#### Method C: Empty commit to trigger
```bash
cd /home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit
git commit --allow-empty -m "chore: trigger release workflow"
git push origin main
```

### Step 2: Verify Release Assets

After workflow completes (~2-3 minutes):

```bash
# Check via API:
curl -s https://api.github.com/repos/LeFrenchPOC/hardware-spec-kit/releases/latest | jq '.assets[] | .name'

# Expected output:
# "spec-kit-template-copilot-v0.1.3.zip"
# "spec-kit-template-claude-v0.1.3.zip"
# "spec-kit-template-gemini-v0.1.3.zip"
```

Or visit: https://github.com/LeFrenchPOC/hardware-spec-kit/releases/latest

### Step 3: Test CLI

```bash
# Clean test:
cd /tmp
uvx --from git+https://github.com/LeFrenchPOC/hardware-spec-kit.git specify init test-hw --ai copilot --no-git

# Should show:
# ✓ Fetch latest release (release v0.1.3)
# ✓ Download template
# ✓ Extract template
```

### Step 4: Verify Agent Commands

After creating a project, check for command files:

```bash
cd test-hw

# For GitHub Copilot:
ls -la .github/prompts/
# Should see: constitution.prompt.md, plan.prompt.md, tasks.prompt.md, specify.prompt.md

# For Claude Code:
ls -la .claude/commands/
# Should see: constitution.md, plan.md, tasks.md, specify.md

# For Gemini CLI:
ls -la .gemini/commands/
# Should see: constitution.toml, plan.toml, tasks.toml, specify.toml
```

## 🔍 Understanding the Template Structure

The workflow creates these packages:

### copilot package structure:
```
.github/prompts/
  ├── constitution.prompt.md  → /constitution command
  ├── plan.prompt.md          → /plan command
  ├── tasks.prompt.md         → /tasks command
  └── specify.prompt.md       → /specify command
templates/
  ├── spec-template.md
  ├── plan-template.md
  └── tasks-template.md
memory/
scripts/
```

### claude package structure:
```
.claude/commands/
  ├── constitution.md  → /constitution command
  ├── plan.md          → /plan command
  ├── tasks.md         → /tasks command
  └── specify.md       → /specify command
templates/
memory/
scripts/
```

### gemini package structure:
```
.gemini/commands/
  ├── constitution.toml  → /constitution command
  ├── plan.toml          → /plan command
  ├── tasks.toml         → /tasks command
  └── specify.toml       → /specify command
templates/
memory/
scripts/
```

## 📝 Command Template Generation

The workflow generates AI-specific command files from `templates/commands/*.md`:

1. Reads each `.md` file in `templates/commands/`
2. Extracts description and content
3. Converts to AI-specific format:
   - **Copilot**: `.prompt.md` files in `.github/prompts/`
   - **Claude**: `.md` files in `.claude/commands/`
   - **Gemini**: `.toml` files in `.gemini/commands/`

## 🐛 Troubleshooting

### "No template found for AI assistant"

**Cause**: No matching asset in latest release

**Fix**: 
1. Check release has assets: `curl -s https://api.github.com/repos/LeFrenchPOC/hardware-spec-kit/releases/latest | jq '.assets'`
2. If empty, trigger workflow (see Step 1 above)

### "local template used" but commands missing

**Cause**: Local fallback doesn't include command generation

**Solution**: Use proper release templates (trigger workflow)

### Commands not appearing in agent

**Cause**: Wrong command directory for the AI

**Check**:
- Copilot expects: `.github/prompts/*.prompt.md`
- Claude expects: `.claude/commands/*.md`
- Gemini expects: `.gemini/commands/*.toml`

### Workflow fails to create release

**Common causes**:
1. Release already exists → Delete old release first
2. Permission issues → Check `GITHUB_TOKEN` has `contents: write`
3. Missing `templates/commands/` → Ensure templates exist

## 📚 Additional Resources

- Original spec-kit: https://github.com/github/spec-kit
- GitHub Copilot prompts: https://docs.github.com/en/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot
- Claude Code commands: https://docs.anthropic.com/claude/docs/custom-commands
- Workflow logs: https://github.com/LeFrenchPOC/hardware-spec-kit/actions
