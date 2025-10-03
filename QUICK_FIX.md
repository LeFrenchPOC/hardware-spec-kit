# 🔧 Quick Fix Summary

## ✅ What I Fixed

**File**: `src/specify_cli/__init__.py` (line 453)

**Change**:
```python
# BEFORE (wrong):
pattern = f"hardware-spec-kit-template-{ai_assistant}"

# AFTER (correct):  
pattern = f"spec-kit-template-{ai_assistant}"
```

This matches the asset names your GitHub workflow actually creates.

---

## 🚀 What You Need To Do NOW

### Run the automated fix script:

```bash
cd /home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit
./scripts/fix-and-release.sh
```

This will:
1. Show you the changes
2. Ask if you want to commit & push
3. Automatically trigger the release workflow
4. Give you next steps

**OR** do it manually:

```bash
cd /home/axel-fpoc/FrenchPOC/GITHUB/hardware-spec-kit
git add src/specify_cli/__init__.py
git commit -m "fix: correct template asset naming pattern"
git push origin main
```

---

## ⚠️ IMPORTANT: Workflow Won't Auto-Trigger!

The workflow only triggers on changes to:
- `memory/**`
- `scripts/**`  
- `templates/**`

Since we changed `src/specify_cli/__init__.py`, you need to **manually trigger** it:

```bash
./scripts/trigger-workflow.sh
```

This will touch `memory/constitution.md` and push to trigger the workflow.

**OR** manually trigger via GitHub UI:
1. Go to: https://github.com/LeFrenchPOC/hardware-spec-kit/actions/workflows/release.yml
2. Click "Run workflow" button

## 🎯 What Will Happen

1. **Workflow runs** (~2-3 minutes)
   - Creates version `v0.1.3`
   - Builds 3 ZIP files with your templates
   - Attaches them to the release

2. **Assets appear**:
   - `spec-kit-template-copilot-v0.1.3.zip`
   - `spec-kit-template-claude-v0.1.3.zip`
   - `spec-kit-template-gemini-v0.1.3.zip`

3. **Commands work**:
   - `/constitution`
   - `/plan`
   - `/tasks`
   - `/specify`

---

## ✔️ Verify It Worked

After ~3 minutes, run:

```bash
./scripts/verify-release.sh
```

Should show:
```
✓ Assets found:
  • spec-kit-template-copilot-v0.1.3.zip
  • spec-kit-template-claude-v0.1.3.zip
  • spec-kit-template-gemini-v0.1.3.zip

✓ All expected templates present!
```

---

## 🧪 Test Your CLI

```bash
cd /tmp
uvx --from git+https://github.com/LeFrenchPOC/hardware-spec-kit.git specify init demo --ai copilot --no-git
cd demo
ls -la .github/prompts/
```

Should see command files:
- `constitution.prompt.md`
- `plan.prompt.md`
- `tasks.prompt.md`
- `specify.prompt.md`

---

## 📖 Full Documentation

See `RELEASE_FIX_GUIDE.md` for:
- Detailed explanation of the problem
- Understanding template structure
- Troubleshooting common issues
- How the workflow works

---

## 🆘 If Something Goes Wrong

1. **Workflow fails?**
   - Check: https://github.com/LeFrenchPOC/hardware-spec-kit/actions
   - Look for error messages in the workflow logs

2. **Still no assets?**
   - Verify workflow has `contents: write` permission
   - Check if release already exists (delete old one first)

3. **Commands still missing?**
   - Make sure `templates/commands/*.md` exist in your repo
   - Check the workflow logs for template generation step

---

**Questions?** Check the detailed guide: `RELEASE_FIX_GUIDE.md`
