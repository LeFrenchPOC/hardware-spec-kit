# Hardware Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`  
**Created**: [DATE]  
**Status**: Draft  
**Input**: User description: "$ARGUMENTS"

## Execution Flow (main)
```
1. Parse user description from Input
   → If empty: ERROR "No feature description provided"
2. Extract key concepts from description
   → Identify: user needs, physical constraints, environmental requirements, interfaces
3. For each unclear aspect:
   → Mark with [NEEDS CLARIFICATION: specific question]
4. Fill User Scenarios & Testing section
   → If no clear use case: ERROR "Cannot determine user scenarios"
5. Generate Functional Requirements
   → Each requirement must be testable and measurable
   → Mark ambiguous requirements
6. Identify Hardware Components (if physical product involved)
7. Define Environmental & Regulatory Requirements
8. Run Review Checklist
   → If any [NEEDS CLARIFICATION]: WARN "Spec has uncertainties"
   → If implementation details found: ERROR "Remove tech details"
9. Return: SUCCESS (spec ready for hardware planning)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHAT users need and WHY, and WHAT the hardware must do
- ❌ Avoid HOW to implement (no specific MCU/SBC models, CAD tools, PCB layouts)
- 🔧 Written for product managers and systems engineers, not hardware designers
- 🌍 Consider real-world constraints (power, size, environment, regulations)

### Section Requirements
- **Mandatory sections**: Must be completed for every feature
- **Optional sections**: Include only when relevant to the feature
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something (e.g., "wireless sensor" without protocol), mark it
3. **Think like a test engineer**: Every vague requirement should fail the "testable and measurable" checklist item
4. **Common underspecified areas for hardware**:
   - Operating environment (temperature, humidity, vibration, IP rating)
   - Power requirements and battery life expectations
   - Physical size, weight, and mounting constraints
   - Communication protocols and range requirements
   - User interface requirements (displays, buttons, indicators)
   - Regulatory and safety compliance needs
   - Manufacturing volume and cost targets
   - Maintenance and serviceability requirements

---

## User Scenarios & Testing *(mandatory)*

### Primary User Story
[Describe the main user journey and how they interact with the hardware product]

### Acceptance Scenarios
1. **Given** [initial conditions], **When** [user action], **Then** [expected hardware behavior]
2. **Given** [environmental condition], **When** [system operation], **Then** [expected performance]
3. **Given** [power condition], **When** [extended operation], **Then** [expected battery/power behavior]

### Edge Cases & Environmental Testing
- What happens when [environmental extreme - temperature, humidity, power loss]?
- How does system handle [physical stress - vibration, impact, moisture]?
- What are the failure modes when [component failure or communication loss]?

## Requirements *(mandatory)*

### Functional Requirements
- **FR-001**: System MUST [specific physical capability, e.g., "measure temperature within ±0.5°C accuracy"]
- **FR-002**: System MUST [specific interaction, e.g., "provide visual indication of operating status"]  
- **FR-003**: Users MUST be able to [key interaction, e.g., "configure system parameters via mobile app"]
- **FR-004**: System MUST [data/communication requirement, e.g., "transmit sensor data every 60 seconds"]
- **FR-005**: System MUST [safety/protection requirement, e.g., "automatically shut down when overheating"]

*Example of marking unclear requirements:*
- **FR-006**: System MUST communicate wirelessly via [NEEDS CLARIFICATION: protocol not specified - WiFi, LoRa, Bluetooth, Zigbee?]
- **FR-007**: System MUST operate for [NEEDS CLARIFICATION: battery life target not specified - hours, days, months?]

### Environmental & Operating Requirements *(include for physical products)*
- **Operating Temperature**: [NEEDS CLARIFICATION: range not specified, e.g., -20°C to +60°C]
- **Humidity Range**: [NEEDS CLARIFICATION: operating humidity not specified]
- **Power Requirements**: [NEEDS CLARIFICATION: voltage, current, battery type not specified]
- **Physical Constraints**: [NEEDS CLARIFICATION: size, weight, mounting requirements not specified]
- **Ingress Protection**: [NEEDS CLARIFICATION: IP rating for dust/water protection not specified]

### Hardware Components *(include if feature involves physical devices)*
- **[Component Type 1]**: [What it does, key specifications without specific part numbers]
- **[Component Type 2]**: [Function, interface requirements, performance targets]
- **[Communication Module]**: [Protocol requirements, range, power consumption targets]

### Regulatory & Compliance Requirements *(include if applicable)*
- **Safety Standards**: [Applicable safety certifications, e.g., UL, IEC]
- **Electromagnetic Compatibility**: [EMC requirements, e.g., FCC Part 15, CE]
- **Wireless Regulations**: [If applicable, e.g., frequency allocations, power limits]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Content Quality
- [ ] No implementation details (specific MCU/SBC models, CAD tools, PCB layouts)
- [ ] Focused on user value and product requirements
- [ ] Written for product managers and systems engineers
- [ ] All mandatory sections completed
- [ ] Environmental and regulatory requirements considered

### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and measurable
- [ ] Success criteria include quantitative targets
- [ ] Physical and environmental constraints defined
- [ ] Power and communication requirements specified
- [ ] Safety and regulatory considerations identified

---

## Execution Status
*Updated by main() during processing*

- [ ] User description parsed
- [ ] Key concepts extracted  
- [ ] Ambiguities marked
- [ ] User scenarios defined
- [ ] Requirements generated
- [ ] Hardware components identified
- [ ] Environmental requirements specified
- [ ] Regulatory requirements considered
- [ ] Review checklist passed

---
