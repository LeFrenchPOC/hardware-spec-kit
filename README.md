<div align="center">
    <img src="./media/FrenchPOC-LOGOS-General-EXE-1_FP-Picto Fd Bleu.png"/>
    <h1>🔧 Hardware Spec Kit</h1>
    <h3><em>Build high-quality hardware products faster.</em></h3>
</div>

<p align="center">
    <strong>An effort to allow hardware teams to focus on product scenarios rather than undifferentiated design work with the help of Spec-Driven Development for hardware products and prototypes.</strong>
</p>

[![Release](https://github.com/github/spec-kit/actions/workflows/release.yml/badge.svg)](https://github.com/github/spec-kit/actions/workflows/release.yml)

---

## Table of Contents

- [🤔 What is Spec-Driven Development?](#-what-is-spec-driven-development)
- [⚡ Get started](#-get-started)
- [📚 Core philosophy](#-core-philosophy)
- [🌟 Development phases](#-development-phases)
- [🎯 Experimental goals](#-experimental-goals)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Learn more](#-learn-more)
- [📋 Detailed process](#-detailed-process)
- [🔍 Troubleshooting](#-troubleshooting)
- [👥 Maintainers](#-maintainers)
- [💬 Support](#-support)
- [🙏 Acknowledgements](#-acknowledgements)
- [📄 License](#-license)

## 🤔 What is Spec-Driven Hardware Development?

Spec-Driven Development **flips the script** on traditional hardware development. For decades, CAD files and schematics have been king — specifications were just scaffolding we built and discarded once the "real work" of design began. Spec-Driven Hardware Development changes this: **specifications become executable**, directly generating working hardware designs, embedded code, and manufacturing documentation rather than just guiding them.

## ⚡ Get started

### 1. Install Specify

Initialize your hardware project depending on the AI agent you're using:

```bash
uvx --from git+https://github.com/LeFrenchPOC/hardware-spec-kit.git specify init <PROJECT_NAME>
```

### 2. Create the hardware spec

Use the `/specify` command to describe what you want to build. Focus on the **what** and **why**, not the implementation details.

```bash
/specify Build a smart temperature monitoring device that can track environmental conditions in multiple rooms. The device should display real-time temperature and humidity on a local screen, log data over time, and send alerts when conditions exceed safe thresholds. The system should be battery-powered and communicate wirelessly with a central hub.
```

### 3. Create a technical implementation plan

Use the `/plan` command to provide your hardware platform and design choices.

```bash
/plan The device uses an ESP32 microcontroller with DHT22 sensors for temperature/humidity monitoring. Mechanical enclosure designed in Fusion360 for 3D printing. PCB layout in KiCAD with battery management and wireless communication. Central hub runs on Raspberry Pi with LoRa communication.
```

### 4. Break down and implement

Use `/tasks` to create an actionable task list, then ask your agent to implement the feature.

For detailed step-by-step instructions, see our [comprehensive guide](./spec-driven.md).

## 📚 Core philosophy

Spec-Driven Hardware Development is a structured process that emphasizes:

- **Intent-driven development** where specifications define the "_what_" before the "_how_"
- **Rich specification creation** using guardrails and hardware design principles
- **Multi-disciplinary coordination** between mechanical, electrical, and embedded systems teams
- **Multi-step refinement** rather than one-shot design generation from prompts
- **Heavy reliance** on advanced AI model capabilities for hardware specification interpretation

## 🌟 Development phases

| Phase | Focus | Key Activities |
|-------|-------|----------------|
| **0-to-1 Development** ("New Product") | Generate from scratch | <ul><li>Start with high-level requirements</li><li>Generate hardware specifications</li><li>Plan mechanical, electrical, and embedded implementation</li><li>Build functional prototypes</li></ul> |
| **Design Exploration** | Parallel implementations | <ul><li>Explore diverse hardware solutions</li><li>Support multiple platforms & architectures (MCUs, SBCs)</li><li>Experiment with mechanical designs and enclosures</li></ul> |
| **Iterative Enhancement** ("Product Evolution") | Product iteration | <ul><li>Add features iteratively</li><li>Optimize designs for manufacturing</li><li>Adapt processes for different hardware platforms</li></ul> |

## 🎯 Experimental goals

Our research and experimentation focus on:

### Hardware platform independence

- Create hardware products using diverse platforms (MCUs, SBCs, FPGA)
- Validate the hypothesis that Spec-Driven Development works across mechanical, electrical, and embedded systems
- Support various manufacturing processes and material choices

### Engineering constraints

- Demonstrate production-ready hardware development
- Incorporate manufacturing constraints (tolerances, materials, cost targets)
- Support hardware design systems and compliance requirements (FCC, CE, safety standards)

### Multi-disciplinary development

- Build products integrating mechanical, electrical, and embedded systems
- Support various development approaches and team structures
- Enable collaboration between mechanical engineers, electrical engineers, and firmware developers

### Iterative & prototyping processes

- Validate the concept of rapid prototyping and design iteration
- Provide robust workflows for design validation and testing
- Extend processes to handle product evolution and manufacturing optimization  

## 🔧 Prerequisites

- **Linux/macOS** (or WSL2 on Windows)
- AI coding agent: [Claude Code](https://www.anthropic.com/claude-code), [GitHub Copilot](https://code.visualstudio.com/), or [Gemini CLI](https://github.com/google-gemini/gemini-cli)
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- **Hardware Design Tools**:
  - [Fusion360](https://www.autodesk.com/products/fusion-360) for mechanical design
  - [KiCAD](https://www.kicad.org/) for electrical design and PCB layout
  - Development boards and prototyping hardware as needed

## 📖 Learn more

- **[Complete Spec-Driven Hardware Development Methodology](./spec-driven.md)** - Deep dive into the full process
- **[Detailed Walkthrough](#detailed-process)** - Step-by-step implementation guide

---

## 📋 Detailed process

<details>
<summary>Click to expand the detailed step-by-step walkthrough</summary>

You can use the Specify CLI to bootstrap your project, which will bring in the required artifacts in your environment. Run:

```bash
specify init <project_name>
```

Or initialize in the current directory:

```bash
specify init --here
```

![Specify CLI bootstrapping a new project in the terminal](./media/specify_cli.gif)

You will be prompted to select the AI agent you are using. You can also proactively specify it directly in the terminal:

```bash
specify init <project_name> --ai claude
specify init <project_name> --ai gemini
specify init <project_name> --ai copilot
# Or in current directory:
specify init --here --ai claude
```

The CLI will check if you have Claude Code or Gemini CLI installed. If you do not, or you prefer to get the templates without checking for the right tools, use `--ignore-agent-tools` with your command:

```bash
specify init <project_name> --ai claude --ignore-agent-tools
```

### **STEP 1:** Bootstrap the project

Go to the project folder and run your AI agent. In our example, we're using `claude`.

![Bootstrapping Claude Code environment](./media/bootstrap-claude-code.gif)

You will know that things are configured correctly if you see the `/specify`, `/plan`, and `/tasks` commands available.

The first step should be creating a new project scaffolding. Use `/specify` command and then provide the concrete requirements for the project you want to develop.

>[!IMPORTANT]
>Be as explicit as possible about _what_ you are trying to build and _why_. **Do not focus on the tech stack at this point**.

An example prompt:

```text
Develop TempSense, a wireless environmental monitoring system for greenhouse operations. It should allow farmers to monitor temperature, humidity, and soil moisture across multiple greenhouse zones. The system should display real-time data on a central dashboard, send automated alerts when conditions go outside optimal ranges, and log historical data for analysis. In this initial phase, let's call it "Create TempSense," let's support monitoring of five greenhouse zones with three sensor types per zone. Each zone should have temperature, humidity, and soil moisture sensors. The central hub should be battery-powered with solar charging capability. Individual sensor nodes should be low-power wireless devices that can operate for months without battery replacement. The system should send SMS alerts to predefined phone numbers when any sensor readings exceed safe thresholds. The main display should show current readings for all zones in a grid layout, with historical graphs available for each sensor. Data should be stored locally and optionally uploaded to cloud storage for remote monitoring.
```

After this prompt is entered, you should see Claude Code kick off the planning and spec drafting process. Claude Code will also trigger some of the built-in scripts to set up the repository.

Once this step is completed, you should have a new branch created (e.g., `001-create-tempsense`), as well as a new specification in the `specs/001-create-tempsense` directory.

The produced specification should contain a set of user stories, functional requirements, and hardware constraints, as defined in the template.

At this stage, your project folder contents should resemble the following:

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

### **STEP 2:** Functional specification clarification

With the baseline specification created, you can go ahead and clarify any of the requirements that were not captured properly within the first shot attempt. For example, you could use a prompt like this within the same Claude Code session:

```text
For the environmental monitoring system, each sensor node should have a weatherproof enclosure rated for outdoor greenhouse use. The battery life should be at least 6 months under normal operation. The wireless communication range should cover up to 500 meters line-of-sight between sensor nodes and the central hub. Add temperature alert thresholds between 15-35°C, humidity between 40-80%, and soil moisture below 30%.
```

You should also ask Claude Code to validate the **Review & Acceptance Checklist**, checking off the things that are validated/pass the requirements, and leave the ones that are not unchecked. The following prompt can be used:

```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

It's important to use the interaction with Claude Code as an opportunity to clarify and ask questions around the specification - **do not treat its first attempt as final**.

### **STEP 3:** Generate a plan

You can now be specific about the hardware platform and other technical requirements. You can use the `/plan` command that is built into the project template with a prompt like this:

```text
We are going to implement this using ESP32-S3 microcontrollers for sensor nodes with LoRaWAN communication. Mechanical enclosures will be designed in Fusion360 for 3D printing in PETG. The PCB design will use KiCAD with integrated battery management and low-power design. Central hub uses Raspberry Pi 4 with LoRaWAN gateway module. Power management includes 18650 lithium batteries with solar charging controllers. Sensor interfaces include I2C temperature/humidity sensors and analog soil moisture probes.
```

The output of this step will include a number of implementation detail documents, with your directory tree resembling this:

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

Check the `research.md` document to ensure that the right hardware platform and design tools are used, based on your instructions. You can ask Claude Code to refine it if any of the components stand out, or even have it check compatibility between different hardware components and design constraints.

Additionally, you might want to ask Claude Code to research details about the chosen hardware platform if it's something that requires specific considerations (e.g., power consumption, wireless regulations, manufacturing constraints), with a prompt like this:

```text
I want you to go through the implementation plan and implementation details, looking for areas that could
benefit from additional research as low-power wireless designs and battery management require careful consideration of power budgets, antenna design, and regulatory compliance. For those areas that you identify that require further research, I want you to update the research document with specific details about power consumption targets, communication protocols, and mechanical design constraints for this TempSense system.
```

During this process, you might find that Claude Code gets stuck researching the wrong thing - you can help nudge it in the right direction with a prompt like this:

```text
I think we need to break this down into a series of steps. First, identify a list of hardware design tasks
that you would need to do during implementation that you're not sure of or would benefit
from further research. Write down a list of those tasks. And then for each one of these tasks,
I want you to spin up a separate research task so that the net result is we are researching
all of those very specific tasks in parallel. What I saw you doing was it looks like you were
researching ESP32 microcontrollers in general and I don't think that's gonna do much for us in this case.
That's way too untargeted research. The research needs to help you solve a specific targeted question
like power consumption calculations, antenna design requirements, or mechanical stress analysis.
```

>[!NOTE]
>Claude Code might be over-eager and add components that you did not ask for. Ask it to clarify the rationale and the source of the change.

### **STEP 4:** Have Claude Code validate the plan

With the plan in place, you should have Claude Code run through it to make sure that there are no missing pieces. You can use a prompt like this:

```text
Now I want you to go and audit the implementation plan and the implementation detail files.
Read through it with an eye on determining whether or not there is a sequence of tasks that you need
to be doing that are obvious from reading this. Because I don't know if there's enough here. For example,
when I look at the core implementation, it would be useful to reference the appropriate places in the implementation
details where it can find the information as it walks through each step in the core implementation or in the refinement.
```

This helps refine the implementation plan and helps you avoid potential blind spots that Claude Code missed in its planning cycle. Once the initial refinement pass is complete, ask Claude Code to go through the checklist once more before you can get to the implementation.

You can also ask Claude Code (if you have the [GitHub CLI](https://docs.github.com/en/github-cli/github-cli) installed) to go ahead and create a pull request from your current branch to `main` with a detailed description, to make sure that the effort is properly tracked.

>[!NOTE]
>Before you have the agent implement it, it's also worth prompting Claude Code to cross-check the details to see if there are any over-engineered pieces (remember - it can be over-eager). If over-engineered components or decisions exist, you can ask Claude Code to resolve them. Ensure that Claude Code follows the [constitution](base/memory/constitution.md) as the foundational piece that it must adhere to when establishing the plan.

### STEP 5: Implementation

Once ready, instruct Claude Code to implement your hardware design (example path included):

```text
implement specs/001-create-tempsense/plan.md
```

Claude Code will spring into action and will start creating the implementation including:
- Fusion360 mechanical design files for enclosures
- KiCAD schematic and PCB layout files
- Embedded firmware code for ESP32 microcontrollers
- Configuration and deployment scripts

>[!IMPORTANT]
>Claude Code will execute local CLI commands for design tool automation and firmware compilation - make sure you have the necessary tools installed on your machine.

Once the implementation step is done, ask Claude Code to try to validate the design and resolve any emerging issues. This includes checking mechanical fits, electrical compatibility, and firmware compilation. If there are design rule check (DRC) errors in KiCAD or assembly conflicts in Fusion360, copy and paste the error messages in Claude Code and have it attempt to resolve them.

</details>

---

## 🔍 Troubleshooting

### Git Credential Manager on Linux

If you're having issues with Git authentication on Linux, you can install Git Credential Manager:

```bash
#!/usr/bin/env bash
set -e
echo "Downloading Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installing Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuring Git to use GCM..."
git config --global credential.helper manager
echo "Cleaning up..."
rm gcm-linux_amd64.2.6.1.deb
```

## 👥 Maintainers

- Den Delimarsky ([@localden](https://github.com/localden))
- John Lam ([@jflam](https://github.com/jflam))

## 💬 Support

For support, please open a [GitHub issue](https://github.com/github/spec-kit/issues/new). We welcome bug reports, feature requests, and questions about using Spec-Driven Development.

## 🙏 Acknowledgements

This project is heavily influenced by and based on the work and research of [John Lam](https://github.com/jflam).

## 📄 License

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.
