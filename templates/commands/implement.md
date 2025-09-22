---
description: Execute the hardware implementation plan by processing and executing all tasks defined in tasks.md
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

The user input can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

1. Run `{SCRIPT}` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute.

2. Load and analyze the hardware implementation context:
   - **REQUIRED**: Read tasks.md for the complete task list and execution plan
   - **REQUIRED**: Read plan.md for hardware platform, architecture, and design structure
   - **IF EXISTS**: Read data-model.md for data entities and relationships
   - **IF EXISTS**: Read hardware/ directory for mechanical, electrical, and embedded specifications
   - **IF EXISTS**: Read research.md for technical decisions and hardware constraints
   - **IF EXISTS**: Read quickstart.md for assembly and testing scenarios

3. Parse tasks.md structure and extract:
   - **Task phases**: Design, Prototype, Implementation, Integration, Testing
   - **Task dependencies**: Sequential vs parallel execution rules for hardware development
   - **Task details**: ID, description, design files, parallel markers [P]
   - **Execution flow**: Order and dependency requirements for hardware workflows

4. Execute hardware implementation following the task plan:
   - **Phase-by-phase execution**: Complete each design phase before moving to the next
   - **Respect dependencies**: Run sequential tasks in order, parallel tasks [P] can run together  
   - **Follow hardware design approach**: Design → Simulate → Prototype → Test → Iterate
   - **File-based coordination**: Tasks affecting the same design files must run sequentially
   - **Validation checkpoints**: Verify each phase completion before proceeding

5. Hardware implementation execution rules:
   - **Design first**: Initialize mechanical models, electrical schematics, embedded code structure
   - **Simulation before prototyping**: Verify mechanical fits, electrical functionality, embedded logic
   - **Core development**: Implement CAD models, PCB layouts, firmware code, test procedures
   - **Integration work**: Assembly procedures, system integration, communication protocols
   - **Testing and validation**: Hardware testing, performance verification, documentation

6. Progress tracking and error handling:
   - Report progress after each completed task
   - Halt execution if any non-parallel task fails
   - For parallel tasks [P], continue with successful tasks, report failed ones
   - Provide clear error messages with context for debugging hardware issues
   - Suggest next steps if implementation cannot proceed
   - **IMPORTANT** For completed tasks, make sure to mark the task off as [X] in the tasks file.

7. Completion validation:
   - Verify all required tasks are completed
   - Check that implemented hardware matches the original specification
   - Validate that simulations pass and hardware tests meet requirements
   - Confirm the implementation follows the technical plan
   - Report final status with summary of completed work

Note: This command assumes a complete task breakdown exists in tasks.md. If tasks are incomplete or missing, suggest running `/tasks` first to regenerate the task list.