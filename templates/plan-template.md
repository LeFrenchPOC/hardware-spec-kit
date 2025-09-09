# Hardware Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Hardware feature specification from `/specs/[###-feature-name]/spec.md`

## Execution Flow (/plan command scope)
```
1. Load hardware feature spec from Input path
   → If not found: ERROR "No feature spec at {path}"
2. Fill Technical Context (scan for NEEDS CLARIFICATION)
   → Detect Hardware Type from context (iot=mcu+sensors, robotics=actuators+control, measurement=sensors+display)
   → Set Design Structure Decision based on hardware type
3. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
4. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
5. Execute Phase 1 → hardware specs, mechanical/electrical/embedded designs, quickstart.md, agent-specific template file
6. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
7. Plan Phase 2 → Describe task generation approach (DO NOT create tasks.md)
8. STOP - Ready for /tasks command
```

**IMPORTANT**: The /plan command STOPS at step 7. Phases 2-4 are executed by other commands:
- Phase 2: /tasks command creates tasks.md
- Phase 3-4: Hardware implementation execution (design tools, prototyping, testing)

## Summary
[Extract from hardware feature spec: primary requirement + technical approach from research]

## Technical Context
**Hardware Platform**: [e.g., ESP32-S3, Raspberry Pi 4, STM32F4 or NEEDS CLARIFICATION]  
**Primary Components**: [e.g., DHT22 sensors, OLED display, LoRa module or NEEDS CLARIFICATION]  
**Power System**: [e.g., 18650 Li-ion with solar, USB-C PD, coin cell or NEEDS CLARIFICATION]  
**Mechanical Design**: [e.g., 3D printed PETG enclosure, aluminum extrusion, injection molded ABS or NEEDS CLARIFICATION]  
**Communication**: [e.g., WiFi, LoRaWAN, Bluetooth LE, CAN bus or NEEDS CLARIFICATION]
**Manufacturing Process**: [e.g., prototype/small batch, injection molding, PCB assembly house or NEEDS CLARIFICATION]  
**Hardware Type**: [iot/robotics/measurement/control - determines design structure]  
**Performance Goals**: [domain-specific, e.g., 1-year battery life, <100ms response, ±0.1% accuracy or NEEDS CLARIFICATION]  
**Environmental Requirements**: [e.g., IP65, -20°C to +60°C, automotive EMC or NEEDS CLARIFICATION]  
**Regulatory Compliance**: [e.g., FCC Part 15, CE marking, UL listed or NEEDS CLARIFICATION]

## Constitution Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

**Design Modularity**:
- Subsystems: [#] (max 3 - e.g., mechanical, electrical, embedded)
- Using standard interfaces? (no custom connectors without justification)
- Modular mechanical design? (standardized mounting, separable assemblies)
- Modular electrical design? (standard connectors, test points, modular PCBs)

**Hardware Architecture**:
- EVERY subsystem as module? (no monolithic designs)
- Modules listed: [name + function for each]
- Test interfaces per module: [connector/port specifications]
- Documentation format: standardized datasheets planned?

**Design-for-Test (NON-NEGOTIABLE)**:
- Test-First-Design enforced? (test procedures MUST be defined before implementation)
- Design validation plan exists? (mechanical stress, electrical validation, embedded testing)
- Order: Requirements→Test Plan→Design→Validation strictly followed?
- Real environment testing? (actual sensors, loads, communication)
- Integration tests for: mechanical interfaces, electrical connections, embedded communication?
- FORBIDDEN: Implementation before test plan, skipping validation phase

**Design Documentation**:
- Design files version controlled?
- Manufacturing documentation included?
- Assembly procedures documented?
- Design rationale captured?

**Design Constraints**:
- Manufacturing requirements specified?
- Component sourcing plan exists?
- Cost targets established?
- Regulatory compliance addressed?

## Hardware Design Structure

### Documentation (this feature)
```
specs/[###-feature]/
├── plan.md                    # This file (/plan command output)
├── research.md                # Phase 0 output (/plan command)
├── data-model.md              # Phase 1 output (/plan command) - sensor data, communication protocols
├── quickstart.md              # Phase 1 output (/plan command)
├── hardware/                  # Phase 1 output (/plan command)
│   ├── mechanical-spec.md     # Enclosure, mounting, materials
│   ├── electrical-spec.md     # Schematic, PCB, power design
│   └── embedded-spec.md       # Firmware, communication, interfaces
└── tasks.md                   # Phase 2 output (/tasks command - NOT created by /plan)
```

### Design Files (repository root)
```
# Option 1: IoT Device (DEFAULT)
hardware/
├── mechanical/
│   ├── enclosures/           # Fusion360 files (.f3d)
│   ├── assemblies/           # Assembly drawings
│   └── manufacturing/        # STL, STEP files for production
├── electrical/
│   ├── schematics/          # KiCAD project files (.kicad_pro, .kicad_sch)
│   ├── pcb/                 # PCB layouts (.kicad_pcb)
│   └── gerbers/             # Manufacturing files
└── embedded/
    ├── firmware/            # MCU/SBC code (Arduino, ESP-IDF, etc.)
    ├── libraries/           # Hardware abstraction layers
    └── tests/               # Unit and integration tests

docs/
├── datasheets/              # Component specifications
├── assembly/                # Assembly instructions
└── testing/                 # Test procedures and results

# Option 2: Robotics System (when "actuators" + "control" detected)
hardware/
├── mechanical/
│   ├── chassis/             # Main structure design
│   ├── joints/              # Actuator mounts and joints
│   └── end-effectors/       # Tools, grippers, sensors
├── electrical/
│   ├── power/               # Power distribution, battery management
│   ├── control/             # Motor drivers, sensor interfaces
│   └── communication/       # CAN bus, industrial protocols
└── embedded/
    ├── control-system/      # Real-time control firmware
    ├── safety/              # Safety interlocks and monitoring
    └── interface/           # Human-machine interface

# Option 3: Measurement System (when "sensors" + "data logging" detected)
hardware/
├── mechanical/
│   ├── sensor-mounts/       # Precision mounting systems
│   ├── calibration/         # Calibration fixtures
│   └── shielding/           # EMI/RFI protection
├── electrical/
│   ├── analog-frontend/     # Signal conditioning
│   ├── data-acquisition/    # ADC, timing, synchronization
│   └── interfaces/          # Communication, display
└── embedded/
    ├── acquisition/         # Data collection firmware
    ├── processing/          # Signal processing algorithms
    └── calibration/         # Calibration routines
```

**Design Structure Decision**: [DEFAULT to Option 1 unless Technical Context indicates robotics/measurement system]

## Phase 0: Outline & Research
1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each hardware component → specifications task
   - For each design tool requirement → workflow task
   - For each manufacturing process → feasibility task

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Technical Context:
     Task: "Research {unknown} for {hardware context}"
   For each hardware platform choice:
     Task: "Find specifications and design guidelines for {platform} in {domain}"
   For each tool/process:
     Task: "Research design workflow for {tool} in {application}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]
   - Specifications: [key technical parameters]
   - Constraints: [limitations and requirements]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Design & Specifications
*Prerequisites: research.md complete*

1. **Extract system components from feature spec** → `data-model.md`:
   - Component specifications and interfaces
   - Communication protocols and data formats
   - Power requirements and signal characteristics
   - Environmental and performance constraints

2. **Generate hardware specifications** from functional requirements:
   - Mechanical: dimensions, materials, mounting, enclosures → `/hardware/mechanical-spec.md`
   - Electrical: schematics, power, connectors, PCB → `/hardware/electrical-spec.md`  
   - Embedded: firmware architecture, communication, interfaces → `/hardware/embedded-spec.md`

3. **Generate design validation tests** from specifications:
   - Mechanical: stress analysis, fit tests, material validation
   - Electrical: design rule checks, power analysis, signal integrity
   - Embedded: unit tests, communication tests, integration tests
   - Tests must be defined before implementation begins

4. **Extract test scenarios** from user stories:
   - Each story → system-level test scenario
   - Quickstart test = end-to-end validation steps
   - Environmental and performance validation procedures

5. **Update agent file incrementally** (O(1) operation):
   - Run `/scripts/update-agent-context.sh [claude|gemini|copilot]` for your AI assistant
   - If exists: Add only NEW hardware context from current plan
   - Preserve manual additions between markers
   - Update recent design changes (keep last 3)
   - Keep under 150 lines for token efficiency
   - Output to repository root

**Output**: data-model.md, /hardware/*, design validation procedures, quickstart.md, agent-specific file

## Phase 2: Task Planning Approach
*This section describes what the /tasks command will do - DO NOT execute during /plan*

**Task Generation Strategy**:
- Load `/templates/tasks-template.md` as base
- Generate tasks from Phase 1 design docs (hardware specs, data model, quickstart)
- Each hardware spec → design validation task [P]
- Each subsystem → design and simulation task [P] 
- Each user story → system integration test task
- Implementation tasks for mechanical, electrical, and embedded subsystems

**Ordering Strategy**:
- Design-for-Test order: Test procedures before implementation 
- Dependency order: Mechanical → Electrical → Embedded → Integration
- Mark [P] for parallel execution (independent subsystems)

**Estimated Output**: 20-25 numbered, ordered tasks in tasks.md covering:
- Mechanical design and validation
- Electrical schematic and PCB design
- Embedded firmware development
- System integration and testing

**IMPORTANT**: This phase is executed by the /tasks command, NOT by /plan

## Phase 3+: Future Implementation
*These phases are beyond the scope of the /plan command*

**Phase 3**: Task execution (/tasks command creates tasks.md)  
**Phase 4**: Hardware implementation (execute tasks.md following constitutional principles)  
**Phase 5**: Validation (run design verification, execute quickstart.md, performance validation)

## Complexity Tracking
*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th subsystem] | [current need] | [why 3 subsystems insufficient] |
| [e.g., Custom connector] | [specific requirement] | [why standard connectors insufficient] |


## Progress Tracking
*This checklist is updated during execution flow*

**Phase Status**:
- [ ] Phase 0: Research complete (/plan command)
- [ ] Phase 1: Hardware design complete (/plan command)
- [ ] Phase 2: Task planning complete (/plan command - describe approach only)
- [ ] Phase 3: Tasks generated (/tasks command)
- [ ] Phase 4: Hardware implementation complete
- [ ] Phase 5: Design validation passed

**Gate Status**:
- [ ] Initial Constitution Check: PASS
- [ ] Post-Design Constitution Check: PASS
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented

---
*Based on Constitution v2.1.1 - See `/memory/constitution.md`*