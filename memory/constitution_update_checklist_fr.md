# Liste de Contrôle de Mise à Jour de Constitution

Lors de la modification de la constitution (`/memory/constitution.md`), assurez-vous que tous les documents dépendants sont mis à jour pour maintenir la cohérence.

## Modèles à Mettre à Jour

### Lors de l'ajout/modification de TOUT article :
- [ ] `/templates/plan-template.md` - Mettre à jour la section Vérification Constitution
- [ ] `/templates/spec-template.md` - Mettre à jour si exigences/portée affectées
- [ ] `/templates/tasks-template.md` - Mettre à jour si nouveaux types de tâches nécessaires
- [ ] `/.claude/commands/plan.md` - Mettre à jour si processus de planification change
- [ ] `/.claude/commands/tasks.md` - Mettre à jour si génération de tâches affectée
- [ ] `/CLAUDE.md` - Mettre à jour les directives de développement runtime

### Mises à jour spécifiques aux articles :

#### Article I (Bibliothèque-d'Abord) :
- [ ] S'assurer que les modèles mettent l'accent sur la création de bibliothèque
- [ ] Mettre à jour les exemples de commandes CLI
- [ ] Ajouter les exigences de documentation llms.txt

#### Article II (Interface CLI) :
- [ ] Mettre à jour les exigences de drapeaux CLI dans les modèles
- [ ] Ajouter des rappels de protocole I/O texte

#### Article III (Test-d'Abord) :
- [ ] Mettre à jour l'ordre des tests dans tous les modèles
- [ ] Mettre l'accent sur les exigences TDD
- [ ] Ajouter des portes d'approbation de test

#### Article IV (Tests d'Intégration) :
- [ ] Lister les déclencheurs de tests d'intégration
- [ ] Mettre à jour les priorités de types de test
- [ ] Ajouter les exigences de dépendances réelles

#### Article V (Observabilité) :
- [ ] Ajouter les exigences de journalisation aux modèles
- [ ] Inclure le streaming de logs multi-niveaux
- [ ] Mettre à jour les sections de surveillance de performance

#### Article VI (Versionnage) :
- [ ] Ajouter des rappels d'incrémentation de version
- [ ] Inclure les procédures de changements cassants
- [ ] Mettre à jour les exigences de migration

#### Article VII (Simplicité) :
- [ ] Mettre à jour les limites de compte de projets
- [ ] Ajouter des exemples de prohibition de modèles
- [ ] Inclure des rappels YAGNI

## Étapes de Validation

1. **Avant de commettre les changements de constitution :**
   - [ ] Tous les modèles référencent les nouvelles exigences
   - [ ] Exemples mis à jour pour correspondre aux nouvelles règles
   - [ ] Aucune contradiction entre documents

2. **Après mise à jour des modèles :**
   - [ ] Exécuter un exemple de plan d'implémentation
   - [ ] Vérifier que toutes les exigences de constitution sont adressées
   - [ ] Vérifier que les modèles sont autonomes (lisibles sans constitution)

3. **Suivi de version :**
   - [ ] Mettre à jour le numéro de version de constitution
   - [ ] Noter la version dans les pieds de page de modèles
   - [ ] Ajouter un amendement à l'historique de constitution

## Oublis Courants

Surveillez ces mises à jour souvent oubliées :
- Documentation de commandes (`/commands/*.md`)
- Éléments de liste de contrôle dans les modèles
- Code/commandes d'exemple
- Variations spécifiques au domaine (web vs mobile vs CLI)
- Références croisées entre documents

## Statut de Synchronisation des Modèles

Dernière vérification de synchronisation : 2025-07-16
- Version de constitution : 2.1.1
- Modèles alignés : ❌ (détails de versionnage et observabilité manquants)

---

*Cette liste de contrôle assure que les principes de la constitution sont appliqués de manière cohérente à travers toute la documentation du projet.*