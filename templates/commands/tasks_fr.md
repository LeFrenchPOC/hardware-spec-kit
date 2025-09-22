---
name: tasks
description: "Décomposer le plan en tâches exécutables. C'est la troisième étape du cycle de vie de Développement Dirigé par les Spécifications."
---

Décomposer le plan en tâches exécutables.

C'est la troisième étape du cycle de vie de Développement Dirigé par les Spécifications.

Étant donné le contexte fourni comme argument, faire ceci :

1. Exécuter `scripts/check-task-prerequisites.sh --json` depuis la racine du dépôt et analyser FEATURE_DIR et la liste AVAILABLE_DOCS. Tous les chemins doivent être absolus.
2. Charger et analyser les documents de conception disponibles :
   - Toujours lire plan.md pour la pile technologique et bibliothèques
   - SI EXISTE : Lire data-model.md pour les entités
   - SI EXISTE : Lire contracts/ pour les points de terminaison API
   - SI EXISTE : Lire research.md pour les décisions techniques
   - SI EXISTE : Lire quickstart.md pour les scénarios de test

   Note : Tous les projets n'ont pas tous les documents. Par exemple :
   - Les outils CLI pourraient ne pas avoir contracts/
   - Les bibliothèques simples pourraient ne pas avoir besoin de data-model.md
   - Générer les tâches basées sur ce qui est disponible

3. Générer les tâches en suivant le modèle :
   - Utiliser `/templates/tasks-template.md` comme base
   - Remplacer les tâches d'exemple avec des tâches réelles basées sur :
     * **Tâches de configuration** : Init projet, dépendances, linting
     * **Tâches de test [P]** : Une par contrat, une par scénario d'intégration
     * **Tâches principales** : Une par entité, service, commande CLI, point de terminaison
     * **Tâches d'intégration** : Connexions DB, middleware, logging
     * **Tâches de finition [P]** : Tests unitaires, performance, docs

4. Règles de génération de tâches :
   - Chaque fichier de contrat → tâche de test de contrat marquée [P]
   - Chaque entité dans data-model → tâche de création de modèle marquée [P]
   - Chaque point de terminaison → tâche d'implémentation (pas parallèle si fichiers partagés)
   - Chaque histoire utilisateur → test d'intégration marqué [P]
   - Fichiers différents = peuvent être parallèles [P]
   - Même fichier = séquentiel (pas de [P])

5. Ordonner les tâches par dépendances :
   - Configuration avant tout
   - Tests avant implémentation (TDD)
   - Modèles avant services
   - Services avant points de terminaison
   - Principal avant intégration
   - Tout avant finition

6. Inclure des exemples d'exécution parallèle :
   - Grouper les tâches [P] qui peuvent fonctionner ensemble
   - Montrer les commandes d'agent Task réelles

7. Créer FEATURE_DIR/tasks.md avec :
   - Nom de fonctionnalité correct du plan d'implémentation
   - Tâches numérotées (T001, T002, etc.)
   - Chemins de fichiers clairs pour chaque tâche
   - Notes de dépendance
   - Conseils d'exécution parallèle

Contexte pour la génération de tâches : {ARGS}

Le tasks.md devrait être immédiatement exécutable - chaque tâche doit être suffisamment spécifique pour qu'un LLM puisse la compléter sans contexte additionnel.