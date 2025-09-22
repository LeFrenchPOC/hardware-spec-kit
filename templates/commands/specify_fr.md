---
name: specify
description: "Commencer une nouvelle fonctionnalité en créant une spécification et une branche de fonctionnalité. C'est la première étape du cycle de vie de Développement Dirigé par les Spécifications."
---

Commencer une nouvelle fonctionnalité en créant une spécification et une branche de fonctionnalité.

C'est la première étape du cycle de vie de Développement Dirigé par les Spécifications.

Étant donné la description de fonctionnalité fournie comme argument, faire ceci :

1. Exécuter le script `scripts/create-new-feature.sh --json "{ARGS}"` depuis la racine du dépôt et analyser sa sortie JSON pour BRANCH_NAME et SPEC_FILE. Tous les chemins de fichiers doivent être absolus.
2. Charger `templates/spec-template.md` pour comprendre les sections requises.
3. Écrire la spécification vers SPEC_FILE en utilisant la structure de modèle, remplaçant les placeholders avec des détails concrets dérivés de la description de fonctionnalité (arguments) tout en préservant l'ordre des sections et les en-têtes.
4. Rapporter l'achèvement avec le nom de branche, le chemin du fichier de spécification, et la préparation pour la phase suivante.

Note : Le script crée et bascule vers la nouvelle branche et initialise le fichier de spécification avant écriture.