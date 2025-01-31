# NEORV32 RISC-V Core: Formal Verification Using SST & PC-Based Checking

This repository contains the formal verification environment for the NEORV32 RISC-V core at the CPU level. The approach leverages State Space Tunneling (SST) to efficiently break down complex verification goals and uses program counter (PC) tracking as the primary bug detection mechanism.

## Table of contents

- [Run Project](#run-project)
- [Implementaion Idea](#implementation-idea)
- [Full Proof with the SST Method](#full-proof-with-the-sst-method)


## Run Project
1. Clone repository
2. Run make command
3. See [script description](.Jasper_RISC_V/scripts/script_desc.md)

## Implementation idea

Any bug that may exist in the system will ultimately affect the **program counter (PC)**. Since the PC value is determined by branch instructions—directly influenced by the comparison between source registers—and register values depend on instructions that modify them, verifying the PC alone is sufficient to detect bugs across the entire system.  

### **Tracking Register Updates with a Free Variable**  
A **free variable** is used to dynamically select any register (from **1 to 31**, since register 0 is always zero) to be tracked for a given test case.  

- When an **implemented instruction** is processed, the `instruction_supported` flag is asserted.  
- If an instruction modifies a register (e.g., `ADD`, `ADDI`), the `chosen_reg_flag` is asserted—indicating that the **selected register’s value is updated by a supported instruction** (if the destination register matches the one chosen by the free variable).  
- From this point onward, the selected register's value is **marked as known**—until an unsupported instruction modifies it. If an unsupported instruction occurs in between, the check is not triggered, as the source register's value may have changed unpredictably.  

### **How Is a Potential Bug Detected?**  
Bugs are **caught through branch instructions**, which trigger only if one of the source registers is the **chosen register**.  

- The **precondition** for checking is that `chosen_reg_flag` is set, meaning the reference model has a known value for the chosen register.  
- Based on the **chosen register and the second source register (from the DUT)**, the **reference model determines whether a branch should occur** and updates its own PC accordingly.  
- The **reference model’s PC** is updated after `pc_we` is asserted:  
  - If a branch occurs, the PC is updated by adding an **immediate constant** to the DUT’s PC.  
  - Otherwise, the PC is simply incremented by **4**.  
- Since the check runs **after every instruction**, there is **no need to store previous values**.  

### **Bug Identification Logic**  
For every instruction:  
1. If the **chosen register** is involved, determine whether a branch should occur.  
2. Compute the **expected PC** in the **reference model**.  
3. Compare the **reference model’s PC** with the **DUT’s PC**.  
4. Any difference suggests a **bug related to the chosen register**.  

### **Reference Model Structure**  
The **reference model** consists of:  
- **A program counter (PC)**  
- **A chosen register** (selected by the free variable)  
- **Logic for instruction execution**  

### **Ensuring Full Coverage**  
By leveraging the **free variable**, the system ensures that **every register is eventually checked**, providing a thorough verification of the NEORV32 core at the CPU level.  


## Full Proof with the SST Method  

### **Overview of the State Space Tunneling (SST) Method**  
The **State Space Tunneling (SST) method** is a technique used to break down complex verification goals into smaller, more manageable sub-proofs, making convergence feasible for challenging properties. By strategically introducing **helper properties**, SST enables **faster proof stabilization** and enhances **state space exploration**.

### **Proof Organization Using JasperGold’s Proof Structure Feature**  
Initially, the **main check without helpers** struggled to exceed a bound of **~17 even after a full day of runtime**. To improve convergence, a structured **helper hierarchy** was implemented using JasperGold’s **proof structure feature**.  

#### **Helper Hierarchy**  
The proof structure is organized into **three levels**:  
- **Main Level**  → Target branch property.
- **LV1 (Level 1 Helpers)** → Divided into different branch types. 
- **LV2 (Level 2 Helpers)** → For each branch type. 

Each level consists of:  
- An **assume node** → Where the target is **proven**, assuming all helpers from the current and lower levels.  
- A **guarantee node** → Where the **helpers themselves are proven** before being assumed in higher levels.  

#### **Results and Future Work**  
- The **helper properties** were derived using the **SST method** and structured into a **tree-like hierarchy** with JasperGold’s **proof structure feature**.  

![Proof Structure](.Jasper_RISC_V/docs/ps.png)

- The achieved results are based on **constrained conditions**, excluding **memory-related instructions** and **interrupt occurrences** (which are planned for future verification efforts).  

![Result](.Jasper_RISC_V/docs/result.png)

This hierarchical approach significantly enhances proof convergence and provides a **scalable verification strategy** for complex designs. 🚀  


