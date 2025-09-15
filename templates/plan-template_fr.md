# Plan d'Implémentation Matérielle : [FONCTIONNALITÉ]

**Branche** : `[###-nom-fonctionnalité]` | **Date** : [DATE] | **Spéc** : [lien]
**Entrée** : Spécification de fonctionnalité matérielle de `/specs/[###-nom-fonctionnalité]/spec.md`

## Flux d'Exécution (portée commande /plan)
```
1. Charger spéc fonctionnalité matérielle depuis chemin Entrée
   → Si pas trouvé : ERROR "Aucune spéc fonctionnalité à {chemin}"
2. Remplir Contexte Technique (scanner pour NEEDS CLARIFICATION)
   → Détecter Type Matériel depuis contexte (iot=mcu+capteurs, robotique=actionneurs+contrôle, mesure=capteurs+affichage)
   → Définir Décision Structure Conception basée sur type matériel
3. Évaluer section Vérification Constitution ci-dessous
   → Si violations existent : Documenter dans Suivi Complexité
   → Si aucune justification possible : ERROR "Simplifier approche d'abord"
   → Mettre à jour Suivi Progrès : Vérification Constitution Initiale
4. Exécuter Phase 0 → research.md
   → Si NEEDS CLARIFICATION restent : ERROR "Résoudre inconnues"
5. Exécuter Phase 1 → spécs matérielles, conceptions mécaniques/électriques/embarquées, quickstart.md, fichier modèle spécifique agent
6. Réévaluer section Vérification Constitution
   → Si nouvelles violations : Refactoriser conception, retourner à Phase 1
   → Mettre à jour Suivi Progrès : Vérification Constitution Post-Conception
7. Planifier Phase 2 → Décrire approche génération tâches (NE PAS créer tasks.md)
8. ARRÊT - Prêt pour commande /tasks
```

**IMPORTANT** : La commande /plan S'ARRÊTE à l'étape 7. Phases 2-4 sont exécutées par d'autres commandes :
- Phase 2 : Commande /tasks crée tasks.md
- Phase 3-4 : Exécution implémentation matérielle (outils conception, prototypage, tests)

## Résumé
[Extraire de spéc fonctionnalité matérielle : exigence principale + approche technique de recherche]

## Contexte Technique
**Plateforme Matérielle** : [ex., ESP32-S3, Raspberry Pi 4, STM32F4 ou NEEDS CLARIFICATION]  
**Composants Principaux** : [ex., capteurs DHT22, écran OLED, module LoRa ou NEEDS CLARIFICATION]  
**Système d'Alimentation** : [ex., 18650 Li-ion avec solaire, USB-C PD, pile bouton ou NEEDS CLARIFICATION]  
**Conception Mécanique** : [ex., boîtier PETG imprimé 3D, extrusion aluminium, ABS moulé injection ou NEEDS CLARIFICATION]  
**Communication** : [ex., WiFi, LoRaWAN, Bluetooth LE, bus CAN ou NEEDS CLARIFICATION]
**Processus de Fabrication** : [ex., prototype/petit lot, moulage injection, maison assemblage PCB ou NEEDS CLARIFICATION]  
**Type Matériel** : [iot/robotique/mesure/contrôle - détermine structure conception]  
**Objectifs Performance** : [spécifiques domaine, ex., durée vie batterie 1 an, réponse <100ms, précision ±0.1% ou NEEDS CLARIFICATION]  
**Exigences Environnementales** : [ex., IP65, -20°C à +60°C, EMC automobile ou NEEDS CLARIFICATION]  
**Conformité Réglementaire** : [ex., FCC Part 15, marquage CE, listé UL ou NEEDS CLARIFICATION]

## Vérification Constitution
*PORTE : Doit passer avant recherche Phase 0. Revérifier après conception Phase 1.*

**Modularité Conception** :
- Sous-systèmes : [#] (max 3 - ex., mécanique, électrique, embarqué)
- Utiliser interfaces standard ? (pas connecteurs personnalisés sans justification)
- Conception mécanique modulaire ? (montage standardisé, assemblages séparables)
- Conception électrique modulaire ? (connecteurs standard, points test, PCBs modulaires)

**Architecture Matérielle** :
- CHAQUE sous-système comme module ? (pas conceptions monolithiques)
- Modules listés : [nom + fonction pour chaque]
- Interfaces test par module : [spécifications connecteur/port]
- Format documentation : fiches techniques standardisées planifiées ?

**Conception-pour-Test (NON-NÉGOCIABLE)** :
- Conception-Test-d'Abord appliquée ? (procédures test DOIVENT être définies avant implémentation)
- Plan validation conception existe ? (stress mécanique, validation électrique, tests embarqués)
- Ordre : Exigences→Plan Test→Conception→Validation strictement suivi ?
- Tests environnement réel ? (capteurs réels, charges, communication)
- Tests intégration pour : interfaces mécaniques, connexions électriques, communication embarquée ?
- INTERDIT : Implémentation avant plan test, sauter phase validation

**Documentation Conception** :
- Fichiers conception sous contrôle version ?
- Documentation fabrication incluse ?
- Procédures assemblage documentées ?
- Justification conception capturée ?

**Contraintes Conception** :
- Exigences fabrication spécifiées ?
- Plan approvisionnement composants existe ?
- Objectifs coût établis ?
- Conformité réglementaire adressée ?

## Structure Conception Matérielle

### Documentation (cette fonctionnalité)
```
specs/[###-fonctionnalité]/
├── plan.md                    # Ce fichier (sortie commande /plan)
├── research.md                # Sortie Phase 0 (commande /plan)
├── data-model.md              # Sortie Phase 1 (commande /plan) - données capteur, protocoles communication
├── quickstart.md              # Sortie Phase 1 (commande /plan)
├── hardware/                  # Sortie Phase 1 (commande /plan)
│   ├── mechanical-spec.md     # Boîtier, montage, matériaux
│   ├── electrical-spec.md     # Schéma, PCB, conception alimentation
│   └── embedded-spec.md       # Firmware, communication, interfaces
└── tasks.md                   # Sortie Phase 2 (commande /tasks - PAS créé par /plan)
```

### Fichiers Conception (racine dépôt)
```
# Option 1 : Dispositif IoT (DÉFAUT)
hardware/
├── mechanical/
│   ├── enclosures/           # Fichiers Fusion360 (.f3d)
│   ├── assemblies/           # Dessins assemblage
│   └── manufacturing/        # Fichiers STL, STEP pour production
├── electrical/
│   ├── schematics/          # Fichiers projet KiCAD (.kicad_pro, .kicad_sch)
│   ├── pcb/                 # Layouts PCB (.kicad_pcb)
│   └── gerbers/             # Fichiers fabrication
└── embedded/
    ├── firmware/            # Code MCU/SBC (Arduino, ESP-IDF, etc.)
    ├── libraries/           # Couches abstraction matérielle
    └── tests/               # Tests unitaires et intégration

docs/
├── datasheets/              # Spécifications composants
├── assembly/                # Instructions assemblage
└── testing/                 # Procédures test et résultats

# Option 2 : Système Robotique (quand "actionneurs" + "contrôle" détecté)
hardware/
├── mechanical/
│   ├── chassis/             # Conception structure principale
│   ├── joints/              # Montures actionneur et joints
│   └── end-effectors/       # Outils, préhenseurs, capteurs
├── electrical/
│   ├── power/               # Distribution alimentation, gestion batterie
│   ├── control/             # Pilotes moteur, interfaces capteur
│   └── communication/       # Bus CAN, protocoles industriels
└── embedded/
    ├── control-system/      # Firmware contrôle temps réel
    ├── safety/              # Verrouillages sécurité et surveillance
    └── interface/           # Interface homme-machine

# Option 3 : Système Mesure (quand "capteurs" + "journalisation données" détecté)
hardware/
├── mechanical/
│   ├── sensor-mounts/       # Systèmes montage précision
│   ├── calibration/         # Fixations calibration
│   └── shielding/           # Protection EMI/RFI
├── electrical/
│   ├── analog-frontend/     # Conditionnement signal
│   ├── data-acquisition/    # ADC, timing, synchronisation
│   └── interfaces/          # Communication, affichage
└── embedded/
    ├── acquisition/         # Firmware collecte données
    ├── processing/          # Algorithmes traitement signal
    └── calibration/         # Routines calibration
```

**Décision Structure Conception** : [DÉFAUT Option 1 sauf si Contexte Technique indique système robotique/mesure]

## Phase 0 : Recherche *(commande /plan exécute)*

### Architecture Système
[Architecture niveau système basée sur Type Matériel détecté]

### Considérations Conception
- **Contraintes Physiques** : [taille, poids, montage, environnement]
- **Alimentation** : [consommation, type batterie, gestion énergie]
- **Refroidissement** : [dissipation thermique, ventilation]
- **EMI/EMC** : [blindage, filtrage, conformité réglementaire]

### Sélection Composants
[Recherche composants avec justifications basées sur exigences]

## Phase 1 : Conception Détaillée *(commande /plan exécute)*

### Spécifications Matérielles
*Auto-générées dans hardware/ selon Type Matériel*

### Modèle Données & Communication
*Auto-généré dans data-model.md*

### Guide Démarrage Rapide
*Auto-généré dans quickstart.md*

### Validation Conception
[Tests et procédures validation basés sur constitution]

## Phase 2 : Génération Tâches *(commande /tasks)*

### Approche Génération Tâches
[Plan comment créer tasks.md - PAS création réelle]

### Ordre Dépendances
[Ordre exécution tâches basé sur dépendances matérielles]

### Tests Parallèles
[Stratégie tests parallèles pour sous-systèmes]

## Suivi Complexité
*Violations constitution avec justifications*

[Documentation exceptions constitution si nécessaires]

## Suivi Progrès
*Mis à jour pendant exécution*

- [ ] Spéc fonctionnalité matérielle chargée
- [ ] Contexte technique rempli
- [ ] Type matériel détecté
- [ ] Vérification constitution initiale passée
- [ ] Phase 0 recherche terminée
- [ ] Phase 1 conception détaillée terminée
- [ ] Vérification constitution post-conception passée
- [ ] Phase 2 planifiée
- [ ] Prêt pour commande /tasks

---

**IMPORTANT** : Ce plan d'implémentation doit rester haut niveau et lisible. Toutes spécifications composants détaillées, modèles CAO, ou spécifications techniques extensives doivent être placées dans les sous-répertoires `hardware/` appropriés.