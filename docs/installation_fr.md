# Guide d'Installation

## Prérequis

- **Linux/macOS** (ou WSL2 sur Windows)
- Agent de codage IA : [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), ou [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- [uv](https://docs.astral.sh/uv/) pour la gestion de paquets
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)

## Installation

### Initialiser un Nouveau Projet

La façon la plus facile de commencer est d'initialiser un nouveau projet :

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <NOM_PROJET>
```

Ou initialiser dans le répertoire courant :

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init --here
```

### Spécifier l'Agent IA

Vous pouvez spécifier de manière proactive votre agent IA pendant l'initialisation :

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <nom_projet> --ai claude
uvx --from git+https://github.com/github/spec-kit.git specify init <nom_projet> --ai gemini
uvx --from git+https://github.com/github/spec-kit.git specify init <nom_projet> --ai copilot
```

### Ignorer la Vérification des Outils d'Agent

Si vous préférez obtenir les modèles sans vérifier les bons outils :

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <nom_projet> --ai claude --ignore-agent-tools
```

## Vérification

Après l'initialisation, vous devriez voir les commandes suivantes disponibles dans votre agent IA :
- `/specify` - Créer des spécifications
- `/plan` - Générer des plans d'implémentation  
- `/tasks` - Décomposer en tâches exploitables

## Dépannage

### Git Credential Manager sur Linux

Si vous avez des problèmes avec l'authentification Git sur Linux, vous pouvez installer Git Credential Manager :

```bash
#!/usr/bin/env bash
set -e
echo "Téléchargement de Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installation de Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuration de Git pour utiliser GCM..."
git config --global credential.helper manager
echo "Nettoyage..."
rm gcm-linux_amd64.2.6.1.deb
```