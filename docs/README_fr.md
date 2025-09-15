# Documentation

Ce dossier contient les fichiers source de documentation pour Spec Kit, construit en utilisant [DocFX](https://dotnet.github.io/docfx/).

## Construction Locale

Pour construire la documentation localement :

1. Installer DocFX :
   ```bash
   dotnet tool install -g docfx
   ```

2. Construire la documentation :
   ```bash
   cd docs
   docfx docfx.json --serve
   ```

3. Ouvrir votre navigateur à `http://localhost:8080` pour voir la documentation.

## Structure

- `docfx.json` - Fichier de configuration DocFX
- `index.md` - Page d'accueil principale de la documentation
- `toc.yml` - Configuration de la table des matières
- `installation.md` - Guide d'installation
- `quickstart.md` - Guide de démarrage rapide
- `_site/` - Sortie de documentation générée (ignorée par git)

## Déploiement

La documentation est automatiquement construite et déployée sur GitHub Pages quand des changements sont poussés vers la branche `main`. Le workflow est défini dans `.github/workflows/docs.yml`.