# Guide de Démarrage Rapide

Ce guide vous aidera à commencer avec le Développement Dirigé par les Spécifications en utilisant Spec Kit.

## Le Processus en 4 Étapes

### 1. Installer Specify

Initialisez votre projet en fonction de l'agent de codage que vous utilisez :

```bash
uvx --from git+https://github.com/github/spec-kit.git specify init <NOM_PROJET>
```

### 2. Créer la Spécification

Utilisez la commande `/specify` pour décrire ce que vous voulez construire. Concentrez-vous sur le **quoi** et le **pourquoi**, pas sur la pile technologique.

```bash
/specify Construire une application qui peut m'aider à organiser mes photos dans des albums photo séparés. Les albums sont groupés par date et peuvent être réorganisés en glissant-déposant sur la page principale. Les albums ne sont jamais dans d'autres albums imbriqués. Dans chaque album, les photos sont prévisualisées dans une interface de type tuile.
```

### 3. Créer un Plan d'Implémentation Technique

Utilisez la commande `/plan` pour fournir votre pile technologique et choix d'architecture.

```bash
/plan L'application utilise Vite avec un nombre minimal de bibliothèques. Utiliser HTML, CSS, et JavaScript vanille autant que possible. Les images ne sont téléchargées nulle part et les métadonnées sont stockées dans une base de données SQLite locale.
```

### 4. Décomposer et Implémenter

Utilisez `/tasks` pour créer une liste de tâches exploitables, puis demandez à votre agent d'implémenter la fonctionnalité.

## Exemple Détaillé : Construire Taskify

Voici un exemple complet de construction d'une plateforme de productivité d'équipe :

### Étape 1 : Définir les Exigences avec `/specify`

```text
Développer Taskify, une plateforme de productivité d'équipe. Elle devrait permettre aux utilisateurs de créer des projets, ajouter des membres d'équipe,
assigner des tâches, commenter et déplacer des tâches entre des tableaux en style Kanban. Dans cette phase initiale pour cette fonctionnalité,
appelons-la "Créer Taskify," ayons plusieurs utilisateurs mais les utilisateurs seront déclarés à l'avance, prédéfinis.
Je veux cinq utilisateurs dans deux catégories différentes, un chef de produit et quatre ingénieurs. Créons trois
projets d'exemple différents. Ayons les colonnes Kanban standard pour le statut de chaque tâche, comme "À Faire,"
"En Cours," "En Révision," et "Terminé." Il n'y aura pas de connexion pour cette application car c'est juste la toute
première chose de test pour s'assurer que nos fonctionnalités de base sont configurées. Pour chaque tâche dans l'UI pour une carte de tâche,
vous devriez pouvoir changer le statut actuel de la tâche entre les différentes colonnes dans le tableau de travail Kanban.
Vous devriez pouvoir laisser un nombre illimité de commentaires pour une carte particulière. Vous devriez pouvoir, à partir de cette carte de tâche,
assigner un des utilisateurs valides. Quand vous lancez d'abord Taskify, ça va vous donner une liste des cinq utilisateurs parmi lesquels choisir.
Il n'y aura pas de mot de passe requis. Quand vous cliquez sur un utilisateur, vous allez dans la vue principale, qui affiche la liste des
projets. Quand vous cliquez sur un projet, vous ouvrez le tableau Kanban pour ce projet. Vous allez voir les colonnes.
Vous pourrez glisser-déposer les cartes d'avant en arrière entre différentes colonnes. Vous verrez toutes les cartes qui sont
assignées à vous, l'utilisateur actuellement connecté, dans une couleur différente de toutes les autres, pour que vous puissiez rapidement
voir les vôtres. Vous pouvez éditer tous les commentaires que vous faites, mais vous ne pouvez pas éditer les commentaires que d'autres personnes ont faits. Vous pouvez
supprimer tous les commentaires que vous avez faits, mais vous ne pouvez pas supprimer les commentaires que quelqu'un d'autre a faits.
```

### Étape 2 : Affiner la Spécification

Après que la spécification initiale soit créée, clarifiez toutes les exigences manquantes :

```text
Pour chaque projet d'exemple ou projet que vous créez, il devrait y avoir un nombre variable de tâches entre 5 et 15
tâches pour chacun distribuées aléatoirement dans différents états d'achèvement. Assurez-vous qu'il y a au moins
une tâche dans chaque étape d'achèvement.
```

Validez aussi la liste de contrôle de spécification :

```text
Lisez la liste de contrôle d'examen et d'acceptation, et cochez chaque élément dans la liste de contrôle si la spécification de fonctionnalité répond aux critères. Laissez-le vide si ce n'est pas le cas.
```

### Étape 3 : Générer le Plan Technique avec `/plan`

Soyez spécifique sur votre pile technologique et exigences techniques :

```text
Nous allons générer ceci en utilisant .NET Aspire, en utilisant Postgres comme base de données. Le frontend devrait utiliser
Blazor server avec des tableaux de tâches glisser-déposer, des mises à jour en temps réel. Il devrait y avoir une API REST créée avec une API de projets,
une API de tâches, et une API de notifications.
```

### Étape 4 : Valider et Implémenter

Demandez à votre agent IA d'auditer le plan d'implémentation :

```text
Maintenant je veux que vous alliez et auditiez le plan d'implémentation et les fichiers de détails d'implémentation.
Lisez-le avec un œil sur la détermination s'il y a ou non une séquence de tâches que vous devez
faire qui sont évidentes en lisant ceci. Parce que je ne sais pas s'il y a assez ici.
```

Finalement, implémentez la solution :

```text
implémenter specs/002-create-taskify/plan.md
```

## Principes Clés

- **Être explicite** sur ce que vous construisez et pourquoi
- **Ne pas se concentrer sur la pile technologique** pendant la phase de spécification
- **Itérer et affiner** vos spécifications avant l'implémentation
- **Valider** le plan avant que le codage commence
- **Laisser l'agent IA gérer** les détails d'implémentation

## Prochaines Étapes

- Lire la méthodologie complète pour des conseils approfondis
- Consulter plus d'exemples dans le dépôt
- Explorer le code source sur GitHub