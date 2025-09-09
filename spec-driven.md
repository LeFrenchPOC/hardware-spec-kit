# Specification-Driven Hardware Development (SDD)

## The Power Inversion

For decades, CAD files and circuit schematics have been king. Specifications served design files—they were the scaffolding we built and then discarded once the "real work" of design began. We wrote PRDs to guide development, created requirement docs to inform implementation, drew system diagrams to visualize architecture. But these were always subordinate to the design files themselves. CAD models were truth. PCB layouts were truth. Firmware code was truth. Everything else was, at best, good intentions. Design files were the source of truth, as they moved forward, and specs rarely kept pace. As the asset (design files) and the implementation are one, it's not easy to have a parallel implementation without trying to rebuild from the design files.

Spec-Driven Hardware Development (SDD) inverts this power structure. Specifications don't serve design files—design files serve specifications. The (Product Requirements Document-Specification) PRD isn't a guide for implementation; it's the source that generates implementation. Technical plans aren't documents that inform design; they're precise definitions that produce mechanical designs, electrical schematics, PCB layouts, and embedded firmware. This isn't an incremental improvement to how we build hardware. It's a fundamental rethinking of what drives hardware development.

The gap between specification and implementation has plagued hardware development since its inception. We've tried to bridge it with better documentation, more detailed requirements, stricter design reviews. These approaches fail because they accept the gap as inevitable. They try to narrow it but never eliminate it. SDD eliminates the gap by making specifications and their concrete implementation plans executable. When specifications and implementation plans generate hardware designs, there is no gap—only transformation.

This transformation is now possible because AI can understand and implement complex hardware specifications, and create detailed implementation plans spanning mechanical, electrical, and embedded systems. But raw AI generation without structure produces chaos. SDD provides that structure through specifications and subsequent implementation plans that are precise, complete, and unambiguous enough to generate working hardware systems. The specification becomes the primary artifact. Design files become their expression as an implementation from the implementation plan for particular manufacturing processes and component choices.

In this new world, maintaining hardware means evolving specifications. The intent of the development team is expressed in natural language ("**intent-driven development**"), design assets, core principles and other guidelines. The **lingua franca** of development moves to a higher-level, and design files are the last-mile approach.

Debugging means fixing specifications and their implementation plans that generate incorrect designs. Refactoring means restructuring for clarity and manufacturability. The entire development workflow reorganizes around specifications as the central source of truth, with implementation plans and design files as the continuously regenerated output. Updating products with new features or creating a new parallel implementation because we are creative beings, means revisiting the specification and creating new implementation plans. This process is therefore a 0 -> 1, (1', ..), 2, 3, N.

The development team focuses on their creativity, experimentation, their critical thinking.

## The SDD Workflow in Practice

The workflow begins with an idea—often vague and incomplete. Through iterative dialogue with AI, this idea becomes a comprehensive hardware PRD. The AI asks clarifying questions, identifies design constraints, and helps define precise acceptance criteria covering mechanical, electrical, and embedded requirements. What might take weeks of meetings and documentation in traditional hardware development happens in hours of focused specification work. This transforms the traditional hardware development lifecycle—requirements and design become continuous activities rather than discrete phases. This is supportive of a **team process**, that's team reviewed-specifications are expressed and versioned, created in branches, and merged.

When a product manager updates acceptance criteria, implementation plans automatically flag affected mechanical designs, electrical schematics, and firmware architectures. When an engineer discovers a better component or manufacturing process, the PRD updates to reflect new possibilities.

Throughout this specification process, research agents gather critical context. They investigate component availability, manufacturing constraints, regulatory requirements, and cost implications. Organizational constraints are discovered and applied automatically—your company's manufacturing partners, component sourcing standards, certification requirements, and design for manufacturing (DFM) guidelines seamlessly integrate into every specification.

From the PRD, AI generates implementation plans that map requirements to technical decisions across mechanical, electrical, and embedded domains. Every component choice has documented rationale. Every design decision traces back to specific requirements. Throughout this process, consistency validation continuously improves quality. AI analyzes specifications for ambiguity, contradictions, and gaps—not as a one-time gate, but as an ongoing refinement.

Design generation begins as soon as specifications and their implementation plans are stable enough, but they do not have to be "complete." Early generations might be exploratory—testing whether the specification makes sense in practice. System concepts become mechanical assemblies. User interactions become electrical interfaces. Performance requirements become embedded algorithms. This merges development and testing through specification—test scenarios aren't written after design, they're part of the specification that generates both implementation and validation procedures.

The feedback loop extends beyond initial development. Manufacturing feedback, field performance data, and failure analysis don't just trigger design revisions—they update specifications for the next regeneration. Thermal issues become new cooling requirements. Component availability problems become new sourcing constraints. User feedback becomes refined interface specifications. This iterative dance between specification, implementation, and operational reality is where true understanding emerges and where the traditional hardware development lifecycle transforms into a continuous evolution.

## Why SDD Matters Now for Hardware

Three trends make SDD not just possible but necessary for hardware development:

First, AI capabilities have reached a threshold where natural language specifications can reliably generate working hardware designs. This isn't about replacing engineers—it's about amplifying their effectiveness by automating the mechanical translation from specification to implementation across mechanical, electrical, and embedded domains. It can amplify exploration and creativity, it can support "start-over" easily, it supports addition subtraction and critical thinking.

Second, hardware complexity continues to grow exponentially. Modern products integrate sophisticated mechanical systems, complex electronics, wireless communication, embedded AI, and regulatory compliance requirements. Keeping all these interdisciplinary pieces aligned with original intent through manual processes becomes increasingly difficult. SDD provides systematic alignment through specification-driven generation. Design tools may evolve to provide AI-first support, not human-first support, or architect around reusable component libraries.

Third, the pace of hardware development accelerates. Requirements change more rapidly than traditional hardware development can accommodate. Market demands, supply chain disruptions, regulatory changes, and technological advances create constant pressure for adaptation. Traditional hardware development treats these changes as costly disruptions requiring complete redesign cycles. Each pivot requires manually propagating changes through mechanical designs, electrical schematics, PCB layouts, firmware, and manufacturing processes. The result is either slow, careful updates that limit time-to-market, or fast, reckless changes that accumulate design debt and quality issues.

SDD can support what-if/simulation experiments, "If we need to re-implement or change the product to target a different market segment with different power requirements, how would we redesign the power management system and what would be the manufacturing impact?".

SDD transforms requirement changes from obstacles into normal workflow. When specifications drive implementation, design changes become systematic regenerations rather than manual redesigns. Change a core performance requirement in the PRD, and affected mechanical, electrical, and embedded designs update automatically. Modify a user interface requirement, and corresponding mechanical controls, electrical interfaces, and firmware implementations regenerate. This isn't just about initial development—it's about maintaining engineering velocity through inevitable changes while preserving design integrity.

## Core Principles

**Specifications as the Lingua Franca**: The specification becomes the primary artifact. Design files become their expression for particular manufacturing processes and component choices. Maintaining hardware means evolving specifications.

**Executable Specifications**: Specifications must be precise, complete, and unambiguous enough to generate working hardware systems across mechanical, electrical, and embedded domains. This eliminates the gap between intent and implementation.

**Continuous Refinement**: Consistency validation happens continuously, not as a one-time gate. AI analyzes specifications for ambiguity, contradictions, and gaps as an ongoing process across all engineering disciplines.

**Research-Driven Context**: Research agents gather critical context throughout the specification process, investigating component specifications, manufacturing constraints, regulatory requirements, and cost implications.

**Bidirectional Feedback**: Manufacturing reality and field performance inform specification evolution. Design for manufacturing feedback, component availability, field failures, and user experience become inputs for specification refinement.

**Multi-Disciplinary Integration**: Generate coordinated implementations across mechanical, electrical, and embedded systems from unified specifications, ensuring proper interfaces and constraints are maintained across domains.

## Implementation Approaches

Today, practicing SDD for hardware requires assembling existing tools and maintaining discipline throughout the process. The methodology can be practiced with:

- AI assistants for iterative specification development
- Research agents for gathering technical context and component information
- Design generation tools for translating specifications to mechanical designs (Fusion360), electrical schematics (KiCAD), and embedded firmware
- Version control systems adapted for specification-first workflows with large binary design files
- Consistency checking through AI analysis of specification documents across engineering disciplines

The key is treating specifications as the source of truth, with design files as the generated output that serves the specification rather than the other way around.

## Streamlining SDD with Claude Commands for Hardware

The SDD methodology is significantly enhanced through two powerful Claude commands that automate the specification and planning workflow for hardware development:

### The `new_feature` Command

This command transforms a simple hardware feature description (the user-prompt) into a complete, structured specification with automatic repository management:

1. **Automatic Feature Numbering**: Scans existing specs to determine the next feature number (e.g., 001, 002, 003)
2. **Branch Creation**: Generates a semantic branch name from your description and creates it automatically
3. **Template-Based Generation**: Copies and customizes the hardware feature specification template with your requirements
4. **Directory Structure**: Creates the proper `specs/[branch-name]/` structure for all related documents

### The `generate_plan` Command

Once a hardware feature specification exists, this command creates a comprehensive implementation plan:

1. **Specification Analysis**: Reads and understands the feature requirements, user stories, and acceptance criteria
2. **Constitutional Compliance**: Ensures alignment with hardware project constitution and design principles
3. **Technical Translation**: Converts product requirements into mechanical, electrical, and embedded system architectures
4. **Detailed Documentation**: Generates supporting documents for hardware specifications, component lists, and test procedures
5. **Manual Testing Plans**: Creates step-by-step validation procedures for each hardware subsystem

### Example: Building a Wireless Sensor Node

Here's how these commands transform the traditional hardware development workflow:

**Traditional Approach:**
```
1. Write a PRD in a document (2-3 hours)
2. Create mechanical design documents (4-6 hours)
3. Create electrical schematics and specifications (4-6 hours)
4. Define embedded system architecture (3-4 hours)
5. Set up project structure manually (1 hour)
6. Create test and validation plans (3-4 hours)
Total: ~20-25 hours of documentation work
```

**SDD with Commands Approach:**
```bash
# Step 1: Create the hardware feature specification (5 minutes)
/new_feature Wireless environmental sensor node with temperature, humidity monitoring, 1-year battery life, and LoRaWAN connectivity

# This automatically:
# - Creates branch "003-sensor-node"
# - Generates specs/003-sensor-node/feature-spec.md
# - Populates it with structured hardware requirements

# Step 2: Generate implementation plan (10 minutes)
/generate_plan ESP32-S3 microcontroller, DHT22 sensors, LoRa module, 3D printed PETG enclosure, 18650 battery with solar charging, KiCAD PCB design

# This automatically creates:
# - specs/003-sensor-node/implementation-plan.md
# - specs/003-sensor-node/hardware/
#   - mechanical-spec.md (Enclosure design, materials, mounting)
#   - electrical-spec.md (Schematic, PCB layout, power management)
#   - embedded-spec.md (Firmware architecture, communication protocols)
# - specs/003-sensor-node/research.md (Component comparisons, power analysis)
# - specs/003-sensor-node/data-model.md (Sensor data formats, communication protocols)
# - specs/003-sensor-node/manual-testing.md (Validation procedures)
```

In 15 minutes, you have:
- A complete hardware feature specification with user stories and acceptance criteria
- A detailed implementation plan with component choices and design rationale
- Hardware specifications for mechanical, electrical, and embedded subsystems ready for design
- Comprehensive test scenarios for both component-level and system-level testing
- All documents properly versioned in a feature branch

### The Power of Structured Automation

These commands don't just save time—they enforce consistency and completeness across disciplines:

1. **No Forgotten Details**: Templates ensure every aspect is considered, from environmental requirements to regulatory compliance
2. **Traceable Decisions**: Every component choice and design decision links back to specific requirements
3. **Living Documentation**: Specifications stay in sync with design files because they generate them
4. **Rapid Iteration**: Change requirements and regenerate design plans in minutes, not days
5. **Multi-Disciplinary Coordination**: Ensures mechanical, electrical, and embedded systems are properly integrated

The commands embody SDD principles by treating specifications as executable artifacts rather than static documents. They transform the specification process from a necessary evil into the driving force of hardware development.

### Template-Driven Quality: How Structure Constrains LLMs for Better Hardware Outcomes

The true power of these commands lies not just in automation, but in how the templates guide LLM behavior toward higher-quality hardware specifications. The templates act as sophisticated prompts that constrain the LLM's output in productive ways:

#### 1. **Preventing Premature Implementation Details**

The hardware feature specification template explicitly instructs:
```
- ✅ Focus on WHAT users need and WHY, and WHAT the hardware must do
- ❌ Avoid HOW to implement (no specific MCU/SBC models, CAD tools, PCB layouts)
```

This constraint forces the LLM to maintain proper abstraction levels. When an LLM might naturally jump to "implement using ESP32 with Arduino IDE," the template keeps it focused on "users need wireless environmental monitoring with 1-year battery life." This separation ensures specifications remain stable even as implementation technologies and component choices change.

#### 2. **Forcing Explicit Uncertainty Markers**

Both templates mandate the use of `[NEEDS CLARIFICATION]` markers:
```
When creating this spec from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS CLARIFICATION: specific question] 
2. **Don't guess**: If the prompt doesn't specify something, mark it
```

This prevents the common LLM behavior of making plausible but potentially incorrect assumptions. Instead of guessing that a "wireless sensor" uses WiFi communication, the LLM must mark it as `[NEEDS CLARIFICATION: protocol not specified - WiFi, LoRa, Bluetooth, Zigbee?]`.

#### 3. **Structured Thinking Through Checklists**

The templates include comprehensive checklists that act as "unit tests" for the specification:
```
### Requirement Completeness
- [ ] No [NEEDS CLARIFICATION] markers remain
- [ ] Requirements are testable and measurable
- [ ] Physical and environmental constraints defined
- [ ] Power and communication requirements specified
```

These checklists force the LLM to self-review its output systematically, catching gaps that might otherwise slip through. It's like giving the LLM a quality assurance framework specifically tuned for hardware development.

#### 4. **Constitutional Compliance Through Gates**

The implementation plan template enforces design principles through phase gates:
```
### Phase -1: Pre-Implementation Gates
#### Design Modularity Gate
- [ ] Using ≤3 subsystems?
- [ ] Standard interfaces defined?
#### Design-for-Test Gate
- [ ] Test procedures defined?
- [ ] Validation plan exists?
```

These gates prevent over-engineering by making the LLM explicitly justify any complexity. If a gate fails, the LLM must document why in the "Complexity Tracking" section, creating accountability for design decisions.

#### 5. **Hierarchical Detail Management**

The templates enforce proper information architecture:
```
**IMPORTANT**: This implementation plan should remain high-level and readable. 
Any detailed component specifications, CAD models, or extensive technical 
specifications must be placed in the appropriate `hardware/` subdirectories
```

This prevents the common problem of specifications becoming unreadable technical dumps. The LLM learns to maintain appropriate detail levels, extracting complexity to separate domain-specific files while keeping the main document navigable.

#### 6. **Design-First Thinking**

The implementation template enforces design-for-test development:
```
### Design Creation Order
1. Create hardware specifications for each subsystem
2. Create validation procedures in order: component → subsystem → system
3. Create design files to meet specifications
```

This ordering constraint ensures the LLM thinks about testability and validation before implementation, leading to more robust and verifiable hardware designs.

#### 7. **Preventing Speculative Features**

Templates explicitly discourage speculation:
```
- [ ] No speculative or "might need" features
- [ ] All subsystems have clear interfaces and deliverables
- [ ] Environmental and regulatory requirements identified
```

This stops the LLM from adding "nice to have" features that complicate design and manufacturing. Every feature must trace back to a concrete user story with clear acceptance criteria.

### The Compound Effect

These constraints work together to produce hardware specifications that are:
- **Complete**: Checklists ensure nothing is forgotten across mechanical, electrical, and embedded domains
- **Unambiguous**: Forced clarification markers highlight uncertainties in specifications
- **Testable**: Design-for-test thinking baked into the process
- **Maintainable**: Proper abstraction levels and information hierarchy across engineering disciplines
- **Implementable**: Clear phases with concrete deliverables for each engineering domain

The templates transform the LLM from a creative writer into a disciplined hardware specification engineer, channeling its capabilities toward producing consistently high-quality, executable specifications that truly drive hardware development.

## The Constitutional Foundation: Enforcing Design Discipline

At the heart of SDD lies a constitution—a set of immutable principles that govern how specifications become hardware designs. The constitution (`memory/constitution.md`) acts as the design DNA of the system, ensuring that every generated implementation maintains consistency, modularity, and quality across mechanical, electrical, and embedded domains.

### The Five Articles of Hardware Development

The constitution defines five articles that shape every aspect of the hardware development process:

#### Article I: Design-First Principle
Every hardware feature starts as a complete design specification with mechanical, electrical, and embedded components clearly defined:
```
Every hardware feature MUST begin with comprehensive design specifications.
No implementation begins without:
- Mechanical design constraints and enclosure requirements
- Electrical schematic and power budgets
- Embedded firmware architecture and communication protocols
```

This principle ensures that specifications generate coordinated, integrated designs rather than disconnected subsystems. When the LLM generates an implementation plan, it must structure features with clear interfaces between mechanical, electrical, and embedded domains.

#### Article II: Multi-Disciplinary Interface
Every hardware system exposes functionality through well-defined interfaces:
```
All hardware interfaces MUST:
- Mechanical: Standard mounting points, connector placements, assembly procedures
- Electrical: Documented pinouts, power requirements, signal specifications
- Embedded: API endpoints, communication protocols, configuration interfaces
```

This enforces integration and testability. The LLM cannot hide functionality inside proprietary interfaces—everything must be accessible and verifiable through standard interfaces.

#### Article III: Design-for-Test Imperative
The most transformative article—no implementation before test procedures:
```
This is NON-NEGOTIABLE: All hardware implementation MUST follow strict Design-for-Test.
No implementation shall begin before:
1. Test procedures are defined during specification phase
2. Test procedures are validated and approved
3. Design validation tests are confirmed to exist
```

This completely inverts traditional hardware development. Instead of designing hardware and hoping it works, the LLM must first generate comprehensive test procedures that define validation criteria, get them approved, and only then generate implementation.

#### Article IV: Integration-First Validation
Prioritizes real-world testing over isolated component tests:
```
Hardware systems MUST be tested as integrated systems:
- Prefer real sensor/actuator interfaces over simulated inputs
- Use actual communication protocols and physical connections
- Environmental testing under realistic operating conditions
```

This ensures generated designs work in practice, not just in theory.

#### Article V: Platform Modularity
Hardware designs must support modular implementation:
```
Hardware designs MUST support modularity:
- Mechanical: Standardized mounting interfaces and enclosure systems
- Electrical: Modular PCB designs with standard connectors
- Embedded: Hardware abstraction layers and standardized communication
```

When an LLM might naturally create monolithic designs, this article forces modular thinking with clear subsystem boundaries.

### Constitutional Enforcement Through Templates

The implementation plan template operationalizes these articles through concrete checkpoints:

```markdown
### Constitution Check
#### Design Modularity
- [ ] Using ≤3 subsystems?
- [ ] Standard interfaces defined?

#### Design-for-Test (NON-NEGOTIABLE)
- [ ] Test procedures defined before implementation?
- [ ] Design validation plan exists?

#### Integration-First
- [ ] Real environment testing planned?
- [ ] Actual hardware interfaces specified?
```

These gates act as design review checks for hardware principles. The LLM cannot proceed without either passing the gates or documenting justified exceptions in the "Complexity Tracking" section.

### The Power of Immutable Principles

The constitution's power lies in its immutability. While implementation details can evolve, the core principles remain constant. This provides:

1. **Consistency Across Time**: Designs generated today follow the same principles as designs generated next year
2. **Consistency Across LLMs**: Different AI models produce architecturally compatible designs
3. **Design Integrity**: Every feature reinforces rather than undermines the system design
4. **Quality Guarantees**: Design-for-test, modularity, and integration principles ensure manufacturable hardware

### Constitutional Evolution

While principles are immutable, their application can evolve:
```
Section 4.2: Amendment Process
Modifications to this constitution require:
- Explicit documentation of the rationale for change
- Review and approval by project maintainers
- Backwards compatibility assessment
```

This allows the methodology to learn and improve while maintaining stability. The constitution shows its own evolution with dated amendments, demonstrating how principles can be refined based on real-world hardware development experience.

### Beyond Rules: A Design Philosophy

The constitution isn't just a rulebook—it's a philosophy that shapes how LLMs think about hardware design generation:

- **Integration Over Isolation**: Test in real environments with actual hardware, not simulated ones
- **Modularity Over Monoliths**: Every subsystem has clear interfaces and boundaries
- **Validation Over Assumption**: Design validation procedures are mandatory before implementation
- **Standards Over Custom**: Use standard interfaces and components unless custom solutions are justified

By embedding these principles into the specification and planning process, SDD ensures that generated designs aren't just functional—they're manufacturable, testable, and architecturally sound. The constitution transforms AI from a design generator into a design partner that respects and reinforces hardware engineering principles.

## The Transformation

This isn't about replacing engineers or automating creativity. It's about amplifying human capability by automating mechanical translation from specifications to designs. It's about creating a tight feedback loop where specifications, research, and hardware designs evolve together, each iteration bringing deeper understanding and better alignment between intent and implementation.

Hardware development needs better tools for maintaining alignment between intent and implementation across mechanical, electrical, and embedded domains. SDD provides the methodology for achieving this alignment through executable specifications that generate coordinated hardware designs rather than merely guiding them.