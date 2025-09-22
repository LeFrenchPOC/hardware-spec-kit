## Contribuer au Kit de Spécifications

Salut ! Nous sommes ravis que vous souhaitiez contribuer au Kit de Spécifications. Les contributions à ce projet sont [publiées](https://help.github.com/articles/github-terms-of-service/#6-contributions-under-repository-license) au public sous la [licence open source du projet](LICENSE).

Veuillez noter que ce projet est publié avec un [Code de Conduite des Contributeurs](CODE_OF_CONDUCT_fr.md). En participant à ce projet, vous acceptez de respecter ses termes.

## Prérequis pour exécuter et tester le code

Ce sont des installations uniques requises pour pouvoir tester vos changements localement dans le cadre du processus de soumission de pull request (PR).

1. Installer [Python 3.11+](https://www.python.org/downloads/)
1. Installer [uv](https://docs.astral.sh/uv/) pour la gestion de paquets
1. Installer [Git](https://git-scm.com/downloads)
1. Avoir un agent de codage IA disponible : [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), ou [Gemini CLI](https://github.com/google-gemini/gemini-cli)

## Soumettre une pull request

1. Forker et cloner le dépôt
1. Configurer et installer les dépendances : `uv sync`
1. S'assurer que la CLI fonctionne sur votre machine : `uv run specify --help`
1. Créer une nouvelle branche : `git checkout -b mon-nom-de-branche`
1. Faire votre changement, ajouter des tests, et s'assurer que tout fonctionne encore
1. Tester la fonctionnalité CLI avec un projet exemple si pertinent
1. Pousser vers votre fork et soumettre une pull request
1. Attendre que votre pull request soit examinée et fusionnée.

Voici quelques choses que vous pouvez faire qui augmenteront la probabilité que votre pull request soit acceptée :

- Suivre les conventions de codage du projet.
- Écrire des tests pour les nouvelles fonctionnalités.
- Mettre à jour la documentation (`README.md,` `spec-driven.md`) si vos changements affectent les fonctionnalités utilisateur.
- Garder votre changement aussi ciblé que possible. S'il y a plusieurs changements que vous aimeriez faire qui ne dépendent pas les uns des autres, considérez les soumettre comme des pull requests séparées.
- Écrire un [bon message de commit](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).
- Tester vos changements avec le workflow de Développement Dirigé par les Spécifications pour assurer la compatibilité.

## Workflow de développement

Quand vous travaillez sur spec-kit :

1. Tester les changements avec les commandes CLI `specify` (`/specify`, `/plan`, `/tasks`) dans votre agent de codage de choix
2. Vérifier que les modèles fonctionnent correctement dans le répertoire `templates/`
3. Tester la fonctionnalité des scripts dans le répertoire `scripts/`
4. S'assurer que les fichiers mémoire (`memory/constitution.md`) sont mis à jour si des changements majeurs de processus sont faits

## Ressources

- [Méthodologie de Développement Dirigé par les Spécifications](./spec-driven_fr.md)
- [Comment Contribuer à l'Open Source](https://opensource.guide/how-to-contribute/)
- [Utiliser les Pull Requests](https://help.github.com/articles/about-pull-requests/)
- [Aide GitHub](https://help.github.com)