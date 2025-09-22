# Spécification de Fonctionnalité Matérielle : [NOM FONCTIONNALITÉ]

**Branche de Fonctionnalité** : `[###-nom-fonctionnalité]`  
**Créée** : [DATE]  
**Statut** : Brouillon  
**Entrée** : Description utilisateur : "$ARGUMENTS"

## Flux d'Exécution (principal)
```
1. Analyser la description utilisateur depuis l'Entrée
   → Si vide : ERROR "Aucune description de fonctionnalité fournie"
2. Extraire les concepts clés de la description
   → Identifier : besoins utilisateur, contraintes physiques, exigences environnementales, interfaces
3. Pour chaque aspect peu clair :
   → Marquer avec [NEEDS CLARIFICATION: question spécifique]
4. Remplir la section Scénarios Utilisateur & Tests
   → Si pas de cas d'usage clair : ERROR "Impossible de déterminer les scénarios utilisateur"
5. Générer les Exigences Fonctionnelles
   → Chaque exigence doit être testable et mesurable
   → Marquer les exigences ambiguës
6. Identifier les Composants Matériels (si produit physique impliqué)
7. Définir les Exigences Environnementales & Réglementaires
8. Exécuter la Liste de Contrôle d'Examen
   → Si des [NEEDS CLARIFICATION] : WARN "Spec a des incertitudes"
   → Si détails d'implémentation trouvés : ERROR "Supprimer détails techniques"
9. Retourner : SUCCESS (spec prête pour planification matérielle)
```

---

## ⚡ Directives Rapides
- ✅ Se concentrer sur CE QUE les utilisateurs ont besoin et POURQUOI, et CE QUE le matériel doit faire
- ❌ Éviter COMMENT implémenter (pas de modèles MCU/SBC spécifiques, outils CAO, layouts PCB)
- 🔧 Écrit pour chefs de produit et ingénieurs systèmes, pas concepteurs matériels
- 🌍 Considérer les contraintes du monde réel (alimentation, taille, environnement, réglementations)

### Exigences de Section
- **Sections obligatoires** : Doivent être complétées pour chaque fonctionnalité
- **Sections optionnelles** : Inclure seulement quand pertinent pour la fonctionnalité
- Quand une section ne s'applique pas, la supprimer entièrement (ne pas laisser comme "N/A")

### Pour la Génération IA
Lors de la création de cette spec à partir d'un prompt utilisateur :
1. **Marquer toutes les ambiguïtés** : Utiliser [NEEDS CLARIFICATION: question spécifique] pour toute supposition que vous devriez faire
2. **Ne pas deviner** : Si le prompt ne spécifie pas quelque chose (ex., "capteur sans fil" sans protocole), le marquer
3. **Penser comme un ingénieur de test** : Chaque exigence vague devrait échouer l'élément de liste de contrôle "testable et mesurable"
4. **Zones communes sous-spécifiées pour le matériel** :
   - Environnement d'opération (température, humidité, vibration, classification IP)
   - Exigences d'alimentation et attentes de durée de vie batterie
   - Taille physique, poids, et contraintes de montage
   - Protocoles de communication et exigences de portée
   - Exigences d'interface utilisateur (écrans, boutons, indicateurs)
   - Besoins de conformité réglementaire et sécurité
   - Volume de fabrication et objectifs de coût
   - Exigences de maintenance et service

---

## Scénarios Utilisateur & Tests *(obligatoire)*

### Histoire Utilisateur Principale
[Décrire le parcours utilisateur principal et comment ils interagissent avec le produit matériel]

### Scénarios d'Acceptation
1. **Étant donné** [conditions initiales], **Quand** [action utilisateur], **Alors** [comportement matériel attendu]
2. **Étant donné** [condition environnementale], **Quand** [opération système], **Alors** [performance attendue]
3. **Étant donné** [condition d'alimentation], **Quand** [opération prolongée], **Alors** [comportement batterie/alimentation attendu]

### Cas Limites & Tests Environnementaux
- Que se passe-t-il quand [extrême environnemental - température, humidité, perte d'alimentation] ?
- Comment le système gère-t-il [stress physique - vibration, impact, humidité] ?
- Quels sont les modes de défaillance quand [défaillance de composant ou perte de communication] ?

## Exigences *(obligatoire)*

### Exigences Fonctionnelles
- **FR-001** : Le système DOIT [capacité physique spécifique, ex., "mesurer la température avec précision ±0.5°C"]
- **FR-002** : Le système DOIT [interaction spécifique, ex., "fournir indication visuelle du statut d'opération"]  
- **FR-003** : Les utilisateurs DOIVENT pouvoir [interaction clé, ex., "configurer paramètres système via app mobile"]
- **FR-004** : Le système DOIT [exigence données/communication, ex., "transmettre données capteur toutes les 60 secondes"]
- **FR-005** : Le système DOIT [exigence sécurité/protection, ex., "s'arrêter automatiquement en cas de surchauffe"]

*Exemple de marquage d'exigences peu claires :*
- **FR-006** : Le système DOIT communiquer sans fil via [NEEDS CLARIFICATION: protocole non spécifié - WiFi, LoRa, Bluetooth, Zigbee ?]
- **FR-007** : Le système DOIT fonctionner pendant [NEEDS CLARIFICATION: objectif durée de vie batterie non spécifié - heures, jours, mois ?]

### Exigences Environnementales & d'Opération *(inclure pour produits physiques)*
- **Température d'Opération** : [NEEDS CLARIFICATION: plage non spécifiée, ex., -20°C à +60°C]
- **Plage d'Humidité** : [NEEDS CLARIFICATION: humidité d'opération non spécifiée]
- **Exigences d'Alimentation** : [NEEDS CLARIFICATION: tension, courant, type batterie non spécifiés]
- **Contraintes Physiques** : [NEEDS CLARIFICATION: taille, poids, exigences montage non spécifiés]
- **Protection d'Entrée** : [NEEDS CLARIFICATION: classification IP pour protection poussière/eau non spécifiée]

### Composants Matériels *(inclure si fonctionnalité implique dispositifs physiques)*
- **[Type Composant 1]** : [Ce qu'il fait, spécifications clés sans numéros de pièce spécifiques]
- **[Type Composant 2]** : [Fonction, exigences d'interface, objectifs de performance]
- **[Module Communication]** : [Exigences protocole, portée, objectifs consommation énergie]

### Exigences Réglementaires & Conformité *(inclure si applicable)*
- **Standards de Sécurité** : [Certifications sécurité applicables, ex., UL, IEC]
- **Compatibilité Électromagnétique** : [Exigences EMC, ex., FCC Part 15, CE]
- **Réglementations Sans Fil** : [Si applicable, ex., allocations fréquence, limites puissance]

---

## Liste de Contrôle d'Examen & Acceptation
*PORTE : Vérifications automatisées exécutées pendant l'exécution main()*

### Qualité de Contenu
- [ ] Aucun détail d'implémentation (modèles MCU/SBC spécifiques, outils CAO, layouts PCB)
- [ ] Concentré sur valeur utilisateur et exigences produit
- [ ] Écrit pour chefs de produit et ingénieurs systèmes
- [ ] Toutes les sections obligatoires complétées
- [ ] Exigences environnementales et réglementaires considérées

### Complétude des Exigences
- [ ] Aucun marqueur [NEEDS CLARIFICATION] ne reste
- [ ] Les exigences sont testables et mesurables
- [ ] Les critères de succès incluent des objectifs quantitatifs
- [ ] Contraintes physiques et environnementales définies
- [ ] Exigences d'alimentation et communication spécifiées
- [ ] Considérations sécurité et réglementaires identifiées

---

## Statut d'Exécution
*Mis à jour par main() pendant le traitement*

- [ ] Description utilisateur analysée
- [ ] Concepts clés extraits  
- [ ] Ambiguïtés marquées
- [ ] Scénarios utilisateur définis
- [ ] Exigences générées
- [ ] Composants matériels identifiés
- [ ] Exigences environnementales spécifiées
- [ ] Exigences réglementaires considérées
- [ ] Liste de contrôle d'examen passée

---