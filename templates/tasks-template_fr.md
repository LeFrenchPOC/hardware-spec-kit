# Tâches : [NOM FONCTIONNALITÉ]

**Entrée** : Documents de conception de `/specs/[###-nom-fonctionnalité]/`
**Prérequis** : plan.md (requis), research.md, data-model.md, contracts/

## Flux d'Exécution (principal)
```
1. Charger plan.md du répertoire de fonctionnalité
   → Si pas trouvé : ERROR "Aucun plan d'implémentation trouvé"
   → Extraire : pile technologique, bibliothèques, structure
2. Charger documents de conception optionnels :
   → data-model.md : Extraire entités → tâches modèle
   → contracts/ : Chaque fichier → tâche test contrat
   → research.md : Extraire décisions → tâches configuration
3. Générer tâches par catégorie :
   → Configuration : init projet, dépendances, linting
   → Tests : tests contrat, tests intégration
   → Principal : modèles, services, commandes CLI
   → Intégration : DB, middleware, logging
   → Finition : tests unitaires, performance, docs
4. Appliquer règles de tâches :
   → Fichiers différents = marquer [P] pour parallèle
   → Même fichier = séquentiel (pas de [P])
   → Tests avant implémentation (TDD)
5. Numéroter tâches séquentiellement (T001, T002...)
6. Générer graphe de dépendances
7. Créer exemples d'exécution parallèle
8. Valider complétude des tâches :
   → Tous les contrats ont des tests ?
   → Toutes les entités ont des modèles ?
   → Tous les points de terminaison implémentés ?
9. Retourner : SUCCESS (tâches prêtes pour exécution)
```

## Format : `[ID] [P?] Description`
- **[P]** : Peut fonctionner en parallèle (fichiers différents, pas de dépendances)
- Inclure chemins de fichiers exacts dans descriptions

## Conventions de Chemin
- **Projet unique** : `src/`, `tests/` à la racine du dépôt
- **App web** : `backend/src/`, `frontend/src/`
- **Mobile** : `api/src/`, `ios/src/` ou `android/src/`
- Chemins montrés ci-dessous supposent projet unique - ajuster basé sur structure plan.md

## Phase 3.1 : Configuration
- [ ] T001 Créer structure de projet selon plan d'implémentation
- [ ] T002 Initialiser projet [langage] avec dépendances [framework]
- [ ] T003 [P] Configurer outils de linting et formatage

## Phase 3.2 : Tests d'Abord (TDD) ⚠️ DOIT ÊTRE COMPLÉTÉ AVANT 3.3
**CRITIQUE : Ces tests DOIVENT être écrits et DOIVENT échouer avant TOUTE implémentation**
- [ ] T004 [P] Test contrat POST /api/users dans tests/contract/test_users_post.py
- [ ] T005 [P] Test contrat GET /api/users/{id} dans tests/contract/test_users_get.py
- [ ] T006 [P] Test intégration inscription utilisateur dans tests/integration/test_registration.py
- [ ] T007 [P] Test intégration flux auth dans tests/integration/test_auth.py

## Phase 3.3 : Implémentation Principale (SEULEMENT après que les tests échouent)
- [ ] T008 [P] Modèle utilisateur dans src/models/user.py
- [ ] T009 [P] UserService CRUD dans src/services/user_service.py
- [ ] T010 [P] CLI --create-user dans src/cli/user_commands.py
- [ ] T011 Point de terminaison POST /api/users
- [ ] T012 Point de terminaison GET /api/users/{id}
- [ ] T013 Validation d'entrée
- [ ] T014 Gestion d'erreur et logging

## Phase 3.4 : Intégration
- [ ] T015 Connecter UserService à DB
- [ ] T016 Middleware auth
- [ ] T017 Logging requête/réponse
- [ ] T018 CORS et headers de sécurité

## Phase 3.5 : Finition
- [ ] T019 [P] Tests unitaires pour validation dans tests/unit/test_validation.py
- [ ] T020 Tests de performance (<200ms)
- [ ] T021 [P] Mettre à jour docs/api.md
- [ ] T022 Supprimer duplication
- [ ] T023 Exécuter manual-testing.md

## Dépendances
- Tests (T004-T007) avant implémentation (T008-T014)
- T008 bloque T009, T015
- T016 bloque T018
- Implémentation avant finition (T019-T023)

## Exemple Parallèle
```
# Lancer T004-T007 ensemble :
Task: "Test contrat POST /api/users dans tests/contract/test_users_post.py"
Task: "Test contrat GET /api/users/{id} dans tests/contract/test_users_get.py"
Task: "Test intégration inscription dans tests/integration/test_registration.py"
Task: "Test intégration auth dans tests/integration/test_auth.py"
```

## Notes
- Tâches [P] = fichiers différents, pas de dépendances
- Vérifier que les tests échouent avant implémentation
- Commiter après chaque tâche
- Éviter : tâches vagues, conflits de même fichier

## Règles de Génération de Tâches
*Appliquées pendant l'exécution main()*

1. **À partir des Contrats** :
   - Chaque fichier contrat → tâche test contrat [P]
   - Chaque point de terminaison → tâche implémentation
   
2. **À partir du Modèle de Données** :
   - Chaque entité → tâche création modèle [P]
   - Relations → tâches couche service
   
3. **À partir des Histoires Utilisateur** :
   - Chaque histoire → test intégration [P]
   - Scénarios quickstart → tâches validation

4. **Ordonnancement** :
   - Configuration → Tests → Modèles → Services → Points de terminaison → Finition
   - Dépendances bloquent exécution parallèle

## Liste de Contrôle de Validation
*PORTE : Vérifiée par main() avant retour*

- [ ] Tous les contrats ont des tests correspondants
- [ ] Toutes les entités ont des tâches modèle
- [ ] Tous les tests viennent avant implémentation
- [ ] Tâches parallèles vraiment indépendantes
- [ ] Chaque tâche spécifie chemin de fichier exact
- [ ] Aucune tâche ne modifie le même fichier qu'une autre tâche [P]