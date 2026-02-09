✈️ Single Bus Controller ↔ Remote Terminal Communication
MIL-STD-1553 with UPF (Unified Power Format)

This repository contains the design and verification of a single Bus Controller (BC) to single Remote Terminal (RT) communication system compliant with MIL-STD-1553, enhanced with Unified Power Format (UPF) to model and verify low-power intent.
The project demonstrates deterministic command–response communication, memory-backed message handling, and power-aware design methodology suitable for avionics, defense, FPGA, and ASIC flows.

📌 Project Overview

MIL-STD-1553 is a command/response, time-deterministic serial bus used in safety-critical avionics systems.

In this project:

A single Bus Controller (BC) initiates all communication
A single Remote Terminal (RT) responds deterministically
Message flow follows Command → Data → Status
A Read-Before-Write dual-port SRAM is used for buffering
UPF is used to describe and verify power intent


🔁 Communication Flow

BC transmits Command Word
RT decodes command and subaddress
Data phase (BC→RT or RT→BC)
RT transmits Status Word
BC validates response and timing
All transfers are BC-controlled, ensuring deterministic behavior.

⚙️ Functional Blocks
Bus Controller (BC)
Command word generation
Message scheduling
Data transmit/receive
Status validation
Power-aware operation (UPF controlled)
Remote Terminal (RT)
Command decoding
Subaddress handling
Data buffering
Status word generation
Power-state awareness

🧠 Memory Architecture
Generic Dual-Port SRAM
Read-Before-Write (RBW) behavior

Used for:

Command words
Data words
Status words
Safe under concurrent BC/RT access

🔋 Low-Power Design Using UPF
This project includes Unified Power Format (UPF) to model and verify low-power intent, which is critical in avionics and space-constrained systems.

Power Domains
Power Domain	Description
PD_BC	Bus Controller logic
PD_RT	Remote Terminal logic
PD_MEM	Shared DPRAM
PD_IF	1553 interface logic

Power States

ON – Normal operation
IDLE – Clock gated / low activity
OFF – Logic powered down (retention optional)
Power Management Features
Power switches for BC and RT domains
Isolation cells between powered-off and powered-on domains
Retention registers for critical RT state

Controlled power-up / power-down sequencing
Safe memory access during power transitions

Example UPF Concepts Used
create_power_domain PD_RT
create_supply_net VDD_RT
create_supply_net VSS

create_power_switch RT_SW \
  -domain PD_RT \
  -input_supply VDD \
  -output_supply VDD_RT \
  -control RT_PWR_EN

set_isolation ISO_RT \
  -domain PD_RT \
  -isolation_power_net VDD \
  -isolation_ground_net VSS

(Illustrative — actual UPF may vary)

🧪 Power-Aware Verification

Power-up / power-down simulation
Isolation correctness checks
Retention behavior validation
BC ↔ RT communication across power transitions
UPF + RTL co-simulation
This enables power-aware simulation, similar to ASIC sign-off flows.


🚀 Applications

MIL-STD-1553 avionics systems
Safety-critical SoCs
Low-power defense electronics
FPGA / ASIC protocol controllers
Power-aware RTL & UPF training

⚠️ Notes & Disclaimer

Single BC ↔ single RT only
Redundant bus (A/B) not implemented
Analog front-end not included
UPF intent is reference-level, not silicon-qualified

👤 Author

Shishir A
Electronics & Communication Engineer

Focus Areas:
Avionics Communication Systems
RTL Design & Verification
MIL-STD-1553
Low-Power Design (UPF / Power-Aware Simulation)
