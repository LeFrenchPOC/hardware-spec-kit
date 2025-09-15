<div align="center">
    <img src="./media/FrenchPOC-LOGOS-General-EXE-1_FP-Picto Fd Bleu.png"/>
    <h1>🔧 Kit de Spécifications Matérielles</h1>
    <h3><em>Créer des produits matériels de haute qualité plus rapidement.</em></h3>
</div>

<p align="center">
    <strong>Un effort pour permettre aux équipes matérielles de se concentrer sur les scénarios de produits plutôt que sur le travail de conception non différencié avec l'aide du Développement Dirigé par les Spécifications pour les produits et prototypes matériels.</strong>
</p>

[![Release](https://github.com/github/spec-kit/actions/workflows/release.yml/badge.svg)](https://github.com/github/spec-kit/actions/workflows/release.yml)

---

## Table des Matières

- [🤔 Qu'est-ce que le Développement Dirigé par les Spécifications ?](#-quest-ce-que-le-développement-dirigé-par-les-spécifications)
- [⚡ Commencer](#-commencer)
- [📚 Philosophie de base](#-philosophie-de-base)
- [🌟 Phases de développement](#-phases-de-développement)
- [🎯 Objectifs expérimentaux](#-objectifs-expérimentaux)
- [🔧 Prérequis](#-prérequis)
- [📖 En savoir plus](#-en-savoir-plus)
- [📋 Processus détaillé](#-processus-détaillé)
- [🔍 Dépannage](#-dépannage)
- [👥 Mainteneurs](#-mainteneurs)
- [💬 Support](#-support)
- [🙏 Remerciements](#-remerciements)
- [📄 Licence](#-licence)

## 🤔 Qu'est-ce que le Développement Matériel Dirigé par les Spécifications ?

Le Développement Dirigé par les Spécifications **renverse la situation** du développement matériel traditionnel. Pendant des décennies, les fichiers CAO et les schémas ont été rois — les spécifications n'étaient que des échafaudages que nous construisions et jetions une fois que le "vrai travail" de conception commençait. Le Développement Matériel Dirigé par les Spécifications change cela : **les spécifications deviennent exécutables**, générant directement des conceptions matérielles fonctionnelles, du code embarqué, et de la documentation de fabrication plutôt que de simplement les guider.

## ⚡ Commencer

### 1. Installer Specify

Initialisez votre projet matériel en fonction de l'agent IA que vous utilisez :

```bash
uvx --from git+https://github.com/LeFrenchPOC/hardware-spec-kit.git specify init <NOM_PROJET>
```

### 2. Créer la spécification matérielle

Utilisez la commande `/specify` pour décrire ce que vous voulez construire. Concentrez-vous sur le **quoi** et le **pourquoi**, pas sur les détails d'implémentation.

```bash
/specify Construire un dispositif intelligent de surveillance de température qui peut suivre les conditions environnementales dans plusieurs pièces. Le dispositif doit afficher la température et l'humidité en temps réel sur un écran local, enregistrer les données au fil du temps, et envoyer des alertes lorsque les conditions dépassent les seuils de sécurité. Le système doit être alimenté par batterie et communiquer sans fil avec un hub central.
```

### 3. Créer un plan d'implémentation technique

Utilisez la commande `/plan` pour fournir votre plateforme matérielle et vos choix de conception.

```bash
/plan Le dispositif utilise un microcontrôleur ESP32 avec des capteurs DHT22 pour la surveillance température/humidité. Boîtier mécanique conçu dans Fusion360 pour l'impression 3D. Layout PCB dans KiCAD avec gestion de batterie et communication sans fil. Le hub central fonctionne sur Raspberry Pi avec communication LoRa.
```

### 4. Décomposer et implémenter

Utilisez `/tasks` pour créer une liste de tâches exploitables, puis demandez à votre agent d'implémenter la fonctionnalité.

Pour des instructions détaillées étape par étape, consultez notre [guide complet](./spec-driven_fr.md).

## 📚 Philosophie de base

Le Développement Matériel Dirigé par les Spécifications est un processus structuré qui met l'accent sur :

- **Développement dirigé par l'intention** où les spécifications définissent le "_quoi_" avant le "_comment_"
- **Création de spécifications riches** utilisant des garde-fous et des principes de conception matérielle
- **Coordination multidisciplinaire** entre les équipes de systèmes mécaniques, électriques et embarqués
- **Raffinement en plusieurs étapes** plutôt qu'une génération de conception en une seule fois à partir de prompts
- **Forte dépendance** aux capacités avancées des modèles IA pour l'interprétation des spécifications matérielles

## 🌟 Phases de développement

| Phase | Focus | Activités Clés |
|-------|-------|----------------|
| **Développement 0-à-1** ("Nouveau Produit") | Générer à partir de zéro | <ul><li>Commencer avec des exigences de haut niveau</li><li>Générer des spécifications matérielles</li><li>Planifier l'implémentation mécanique, électrique et embarquée</li><li>Construire des prototypes fonctionnels</li></ul> |
| **Exploration de Conception** | Implémentations parallèles | <ul><li>Explorer diverses solutions matérielles</li><li>Supporter plusieurs plateformes et architectures (MCUs, SBCs)</li><li>Expérimenter avec des conceptions mécaniques et des boîtiers</li></ul> |
| **Amélioration Itérative** ("Évolution Produit") | Itération produit | <ul><li>Ajouter des fonctionnalités de manière itérative</li><li>Optimiser les conceptions pour la fabrication</li><li>Adapter les processus pour différentes plateformes matérielles</li></ul> |

## 🎯 Objectifs expérimentaux

Notre recherche et expérimentation se concentrent sur :

### Indépendance de plateforme matérielle

- Créer des produits matériels utilisant diverses plateformes (MCUs, SBCs, FPGA)
- Valider l'hypothèse que le Développement Dirigé par les Spécifications fonctionne à travers les systèmes mécaniques, électriques et embarqués
- Supporter divers processus de fabrication et choix de matériaux

### Contraintes d'ingénierie

- Démontrer le développement matériel prêt pour la production
- Incorporer les contraintes de fabrication (tolérances, matériaux, objectifs de coût)
- Supporter les systèmes de conception matérielle et les exigences de conformité (FCC, CE, normes de sécurité)

### Développement multidisciplinaire

- Construire des produits intégrant des systèmes mécaniques, électriques et embarqués
- Supporter diverses approches de développement et structures d'équipe
- Permettre la collaboration entre ingénieurs mécaniques, ingénieurs électriques et développeurs firmware

### Processus itératifs et de prototypage

- Valider le concept de prototypage rapide et d'itération de conception
- Fournir des workflows robustes pour la validation et les tests de conception
- Étendre les processus pour gérer l'évolution produit et l'optimisation de fabrication

## 🔧 Prérequis

- **Linux/macOS** (ou WSL2 sur Windows)
- Agent de codage IA : [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), ou [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- [uv](https://docs.astral.sh/uv/) pour la gestion de paquets
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- **Outils de Conception Matérielle** :
  - [Fusion360](https://www.autodesk.com/products/fusion-360) pour la conception mécanique
  - [KiCAD](https://www.kicad.org/) pour la conception électrique et le layout PCB
  - Cartes de développement et matériel de prototypage selon les besoins

## 📖 En savoir plus

- **[Méthodologie Complète de Développement Matériel Dirigé par les Spécifications](./spec-driven_fr.md)** - Plongée profonde dans le processus complet
- **[Guide Détaillé](#processus-détaillé)** - Guide d'implémentation étape par étape

---

## 📋 Processus détaillé

<details>
<summary>Cliquer pour développer le guide étape par étape détaillé</summary>

Vous pouvez utiliser la CLI Specify pour amorcer votre projet, ce qui apportera les artefacts requis dans votre environnement. Exécutez :

```bash
specify init <nom_projet>
```

Ou initialisez dans le répertoire courant :

```bash
specify init --here
```

![CLI Specify amorçant un nouveau projet dans le terminal](./media/specify_cli.gif)

Vous serez invité à sélectionner l'agent IA que vous utilisez. Vous pouvez aussi le spécifier directement dans le terminal :

```bash
specify init <nom_projet> --ai claude
specify init <nom_projet> --ai gemini
specify init <nom_projet> --ai copilot
# Ou dans le répertoire courant :
specify init --here --ai claude
```

La CLI vérifiera si vous avez Claude Code ou Gemini CLI installé. Si ce n'est pas le cas, ou si vous préférez obtenir les modèles sans vérifier les bons outils, utilisez `--ignore-agent-tools` avec votre commande :

```bash
specify init <nom_projet> --ai claude --ignore-agent-tools
```

### **ÉTAPE 1 :** Amorcer le projet

Allez dans le dossier du projet et lancez votre agent IA. Dans notre exemple, nous utilisons `claude`.

![Amorçage de l'environnement Claude Code](./media/bootstrap-claude-code.gif)

Vous saurez que les choses sont configurées correctement si vous voyez les commandes `/specify`, `/plan`, et `/tasks` disponibles.

La première étape devrait être la création d'un nouveau squelette de projet. Utilisez la commande `/specify` et puis fournissez les exigences concrètes pour le projet que vous voulez développer.

>[!IMPORTANT]
>Soyez aussi explicite que possible sur _ce que_ vous essayez de construire et _pourquoi_. **Ne vous concentrez pas sur la pile technologique à ce stade**.

Un exemple de prompt :

```text
Développer TempSense, un système de surveillance environnementale sans fil pour les opérations de serre. Il devrait permettre aux agriculteurs de surveiller la température, l'humidité et l'humidité du sol à travers plusieurs zones de serre. Le système devrait afficher des données en temps réel sur un tableau de bord central, envoyer des alertes automatisées lorsque les conditions sortent des plages optimales, et enregistrer des données historiques pour l'analyse. Dans cette phase initiale, appelons-la "Créer TempSense", supportons la surveillance de cinq zones de serre avec trois types de capteurs par zone. Chaque zone devrait avoir des capteurs de température, d'humidité et d'humidité du sol. Le hub central devrait être alimenté par batterie avec capacité de charge solaire. Les nœuds de capteurs individuels devraient être des dispositifs sans fil basse consommation qui peuvent fonctionner pendant des mois sans remplacement de batterie. Le système devrait envoyer des alertes SMS à des numéros de téléphone prédéfinis lorsque les lectures de capteurs dépassent les seuils de sécurité. L'affichage principal devrait montrer les lectures actuelles pour toutes les zones dans un layout en grille, avec des graphiques historiques disponibles pour chaque capteur. Les données devraient être stockées localement et optionnellement téléchargées vers le stockage cloud pour la surveillance à distance.
```

Après que ce prompt soit entré, vous devriez voir Claude Code lancer le processus de planification et de rédaction de spécifications. Claude Code déclenchera aussi certains des scripts intégrés pour configurer le dépôt.

Une fois cette étape terminée, vous devriez avoir une nouvelle branche créée (ex., `001-create-tempsense`), ainsi qu'une nouvelle spécification dans le répertoire `specs/001-create-tempsense`.

La spécification produite devrait contenir un ensemble d'histoires utilisateur, d'exigences fonctionnelles, et de contraintes matérielles, comme défini dans le modèle.

À ce stade, le contenu de votre dossier de projet devrait ressembler à ceci :

```text
├── memory
│	 ├── constitution.md
│	 └── constitution_update_checklist.md
├── scripts
│	 ├── check-task-prerequisites.sh
│	 ├── common.sh
│	 ├── create-new-feature.sh
│	 ├── get-feature-paths.sh
│	 ├── setup-plan.sh
│	 └── update-claude-md.sh
├── specs
│	 └── 001-create-tempsense
│	     └── spec.md
└── templates
    ├── CLAUDE-template.md
    ├── plan-template.md
    ├── spec-template.md
    └── tasks-template.md
```

### **ÉTAPE 2 :** Clarification de spécification fonctionnelle

Avec la spécification de base créée, vous pouvez aller de l'avant et clarifier toutes les exigences qui n'ont pas été capturées correctement dans la première tentative. Par exemple, vous pourriez utiliser un prompt comme celui-ci dans la même session Claude Code :

```text
Pour le système de surveillance environnementale, chaque nœud de capteur devrait avoir un boîtier étanche classé pour utilisation extérieure en serre. La durée de vie de la batterie devrait être d'au moins 6 mois sous fonctionnement normal. La portée de communication sans fil devrait couvrir jusqu'à 500 mètres en ligne de vue entre les nœuds de capteurs et le hub central. Ajouter des seuils d'alerte température entre 15-35°C, humidité entre 40-80%, et humidité du sol en-dessous de 30%.
```

Vous devriez aussi demander à Claude Code de valider la **Liste de Contrôle d'Examen et d'Acceptation**, en cochant les choses qui sont validées/passent les exigences, et laisser celles qui ne le sont pas non cochées. Le prompt suivant peut être utilisé :

```text
Lisez la liste de contrôle d'examen et d'acceptation, et cochez chaque élément dans la liste de contrôle si la spécification de fonctionnalité répond aux critères. Laissez-le vide si ce n'est pas le cas.
```

Il est important d'utiliser l'interaction avec Claude Code comme une opportunité de clarifier et poser des questions autour de la spécification - **ne traitez pas sa première tentative comme finale**.

### **ÉTAPE 3 :** Générer un plan

Vous pouvez maintenant être spécifique sur la plateforme matérielle et autres exigences techniques. Vous pouvez utiliser la commande `/plan` qui est intégrée dans le modèle de projet avec un prompt comme celui-ci :

```text
Nous allons implémenter ceci en utilisant des microcontrôleurs ESP32-S3 pour les nœuds de capteurs avec communication LoRaWAN. Les boîtiers mécaniques seront conçus dans Fusion360 pour l'impression 3D en PETG. La conception PCB utilisera KiCAD avec gestion de batterie intégrée et conception basse consommation. Le hub central utilise Raspberry Pi 4 avec module de passerelle LoRaWAN. La gestion d'alimentation inclut des batteries lithium 18650 avec contrôleurs de charge solaire. Les interfaces de capteurs incluent des capteurs I2C température/humidité et des sondes d'humidité du sol analogiques.
```

La sortie de cette étape inclura un nombre de documents de détails d'implémentation, avec votre arbre de répertoires ressemblant à ceci :

```text
.
├── CLAUDE.md
├── memory
│	 ├── constitution.md
│	 └── constitution_update_checklist.md
├── scripts
│	 ├── check-task-prerequisites.sh
│	 ├── common.sh
│	 ├── create-new-feature.sh
│	 ├── get-feature-paths.sh
│	 ├── setup-plan.sh
│	 └── update-claude-md.sh
├── specs
│	 └── 001-create-tempsense
│	     ├── hardware
│	     │	 ├── mechanical-spec.md
│	     │	 ├── electrical-spec.md
│	     │	 └── embedded-spec.md
│	     ├── data-model.md
│	     ├── plan.md
│	     ├── quickstart.md
│	     ├── research.md
│	     └── spec.md
└── templates
    ├── CLAUDE-template.md
    ├── plan-template.md
    ├── spec-template.md
    └── tasks-template.md
```

Vérifiez le document `research.md` pour vous assurer que la bonne plateforme matérielle et les bons outils de conception sont utilisés, basés sur vos instructions. Vous pouvez demander à Claude Code de l'affiner si certains composants se démarquent, ou même lui faire vérifier la compatibilité entre différents composants matériels et contraintes de conception.

Additionnellement, vous pourriez vouloir demander à Claude Code de rechercher des détails sur la plateforme matérielle choisie si c'est quelque chose qui nécessite des considérations spécifiques (ex., consommation d'énergie, réglementations sans fil, contraintes de fabrication), avec un prompt comme celui-ci :

```text
Je veux que vous parcouriez le plan d'implémentation et les détails d'implémentation, en cherchant des zones qui pourraient
bénéficier de recherche supplémentaire car les conceptions sans fil basse consommation et la gestion de batterie nécessitent une considération attentive des budgets d'alimentation, de la conception d'antenne, et de la conformité réglementaire. Pour ces zones que vous identifiez qui nécessitent une recherche plus poussée, je veux que vous mettiez à jour le document de recherche avec des détails spécifiques sur les objectifs de consommation d'énergie, les protocoles de communication, et les contraintes de conception mécanique pour ce système TempSense.
```

Pendant ce processus, vous pourriez trouver que Claude Code se bloque en recherchant la mauvaise chose - vous pouvez l'aider à aller dans la bonne direction avec un prompt comme celui-ci :

```text
Je pense que nous devons décomposer ceci en une série d'étapes. D'abord, identifiez une liste de tâches de conception matérielle
que vous auriez besoin de faire pendant l'implémentation dont vous n'êtes pas sûr ou qui bénéficieraient
de recherche supplémentaire. Écrivez une liste de ces tâches. Et puis pour chacune de ces tâches,
je veux que vous lanciez une tâche de recherche séparée pour que le résultat net soit que nous recherchons
toutes ces tâches très spécifiques en parallèle. Ce que j'ai vu que vous faisiez, c'est qu'il semblait que vous
recherchiez les microcontrôleurs ESP32 en général et je ne pense pas que cela va nous aider beaucoup dans ce cas.
C'est beaucoup trop de recherche non ciblée. La recherche doit vous aider à résoudre une question ciblée spécifique
comme les calculs de consommation d'énergie, les exigences de conception d'antenne, ou l'analyse de contrainte mécanique.
```

>[!NOTE]
>Claude Code pourrait être trop enthousiaste et ajouter des composants que vous n'avez pas demandés. Demandez-lui de clarifier la justification et la source du changement.

### **ÉTAPE 4 :** Avoir Claude Code valider le plan

Avec le plan en place, vous devriez avoir Claude Code le parcourir pour vous assurer qu'il n'y a pas de pièces manquantes. Vous pouvez utiliser un prompt comme celui-ci :

```text
Maintenant je veux que vous alliez et auditer le plan d'implémentation et les fichiers de détails d'implémentation.
Lisez-le avec un œil sur la détermination s'il y a ou non une séquence de tâches que vous devez
faire qui sont évidentes en lisant ceci. Parce que je ne sais pas s'il y a assez ici. Par exemple,
quand je regarde l'implémentation principale, il serait utile de référencer les endroits appropriés dans les détails d'implémentation où il peut trouver l'information pendant qu'il parcourt chaque étape dans l'implémentation principale ou dans le raffinement.
```

Cela aide à affiner le plan d'implémentation et vous aide à éviter les angles morts potentiels que Claude Code a manqués dans son cycle de planification. Une fois le premier passage de raffinement terminé, demandez à Claude Code de passer par la liste de contrôle une fois de plus avant que vous puissiez arriver à l'implémentation.

Vous pouvez aussi demander à Claude Code (si vous avez la [CLI GitHub](https://docs.github.com/en/github-cli/github-cli) installée) d'aller de l'avant et créer une pull request de votre branche actuelle vers `main` avec une description détaillée, pour vous assurer que l'effort est correctement suivi.

>[!NOTE]
>Avant que vous ayez l'agent l'implémenter, il vaut aussi la peine de demander à Claude Code de vérifier les détails pour voir s'il y a des pièces sur-ingénieurées (rappelez-vous - il peut être trop enthousiaste). Si des composants ou décisions sur-ingénieurés existent, vous pouvez demander à Claude Code de les résoudre. Assurez-vous que Claude Code suit la [constitution](base/memory/constitution.md) comme la pièce fondamentale à laquelle il doit adhérer lors de l'établissement du plan.

### ÉTAPE 5 : Implémentation

Une fois prêt, instruisez Claude Code d'implémenter votre conception matérielle (chemin d'exemple inclus) :

```text
implémenter specs/001-create-tempsense/plan.md
```

Claude Code va se mettre en action et commencera à créer l'implémentation incluant :
- Fichiers de conception mécanique Fusion360 pour les boîtiers
- Fichiers de schéma et layout PCB KiCAD
- Code firmware embarqué pour les microcontrôleurs ESP32
- Scripts de configuration et de déploiement

>[!IMPORTANT]
>Claude Code exécutera des commandes CLI locales pour l'automatisation des outils de conception et la compilation firmware - assurez-vous d'avoir les outils nécessaires installés sur votre machine.

Une fois l'étape d'implémentation terminée, demandez à Claude Code d'essayer de valider la conception et résoudre tous les problèmes émergents. Cela inclut vérifier les ajustements mécaniques, la compatibilité électrique, et la compilation firmware. S'il y a des erreurs de vérification de règles de conception (DRC) dans KiCAD ou des conflits d'assemblage dans Fusion360, copiez et collez les messages d'erreur dans Claude Code et demandez-lui de tenter de les résoudre.

</details>

---

## 🔍 Dépannage

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

## 👥 Mainteneurs

- Den Delimarsky ([@localden](https://github.com/localden))
- John Lam ([@jflam](https://github.com/jflam))

## 💬 Support

Pour le support, veuillez ouvrir un [GitHub issue](https://github.com/github/spec-kit/issues/new). Nous accueillons les rapports de bogues, les demandes de fonctionnalités, et les questions sur l'utilisation du Développement Dirigé par les Spécifications.

## 🙏 Remerciements

Ce projet est fortement influencé par et basé sur le travail et la recherche de [John Lam](https://github.com/jflam).

## 📄 Licence

Ce projet est sous licence selon les termes de la licence open source MIT. Veuillez vous référer au fichier [LICENSE](./LICENSE) pour les termes complets.