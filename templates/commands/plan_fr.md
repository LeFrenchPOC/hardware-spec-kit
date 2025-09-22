---
name: plan
description: "Planifier comment implémenter la fonctionnalité spécifiée. C'est la deuxième étape du cycle de vie de Développement Dirigé par les Spécifications."
---

Planifier comment implémenter la fonctionnalité spécifiée.

C'est la deuxième étape du cycle de vie de Développement Dirigé par les Spécifications.

Étant donné les détails d'implémentation fournis comme argument, faire ceci :

1. Exécuter `scripts/setup-plan.sh --json` depuis la racine du dépôt et analyser JSON pour FEATURE_SPEC, IMPL_PLAN, SPECS_DIR, BRANCH. Tous les futurs chemins de fichiers doivent être absolus.
2. Lire et analyser la spécification de fonctionnalité pour comprendre :
   - Les exigences de fonctionnalité et histoires utilisateur
   - Exigences fonctionnelles et non-fonctionnelles
   - Critères de succès et critères d'acceptation
   - Toutes contraintes techniques ou dépendances mentionnées

3. Lire la constitution à `/memory/constitution.md` pour comprendre les exigences constitutionnelles.

4. Exécuter le modèle de plan d'implémentation :
   - Charger `/templates/plan-template.md` (déjà copié vers le chemin IMPL_PLAN)
   - Définir le chemin d'entrée vers FEATURE_SPEC
   - Exécuter les étapes 1-10 de la fonction Flux d'Exécution (principal)
   - Le modèle est autonome et exécutable
   - Suivre la gestion d'erreur et vérifications de porte comme spécifié
   - Laisser le modèle guider la génération d'artefacts dans $SPECS_DIR :
     * Phase 0 génère research.md
     * Phase 1 génère data-model.md, contracts/, quickstart.md
     * Phase 2 génère tasks.md
   - Incorporer les détails fournis par l'utilisateur des arguments dans Contexte Technique : {ARGS}
   - Mettre à jour le Suivi de Progrès en complétant chaque phase

5. Vérifier que l'exécution s'est terminée :
   - Vérifier que le Suivi de Progrès montre toutes les phases complètes
   - S'assurer que tous les artefacts requis ont été générés
   - Confirmer aucun état ERROR dans l'exécution

6. Rapporter les résultats avec nom de branche, chemins de fichiers, et artefacts générés.

Utiliser des chemins absolus avec la racine du dépôt pour toutes les opérations de fichiers pour éviter les problèmes de chemin.