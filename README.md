# RISC-SPM-Programs
## Group 5: Khanh(L), Hung, and Hieu.
## This repository contains the source code of RISC-SPM architecture.

### The RISC-SPM Architecture:

![Alt text](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/risc_spm_diagram.png)

### There are 3 main blocks in RISC-SPM: Controller, Processor, and Memory.

### I. RISC-SPM Processor

1. The program of R0, R1, R2, R3 is [register_unit.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/register_unit.v)

2. The program of Reg_Z is           [register_z.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/register_z.v)

3. The program of Program Counter is [program_counter.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/program_counter.v)

4. The program of Mux3to1 is         [mux_3to1.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/mux_3to1.v)

5. The program of Mux5to1 is         [mux_5to1.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/mux_5to1.v)

6. The program of Instruction Register is [instruction_register.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/instruction_register.v)

7. The program of Address Register is [address_register.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/address_register.v)

8. The program of ALU is [ALU_RISC.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/ALU_RISC.v)

The full program of RISC-SPM Processor is [Complete_Processor.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/Complete_Processor.v)

### II. RISC-SPM Controller
The program of Controller is [control_unit.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/control_unit.v#L7)
### III. RISC-SPM Memory
The program of Memory is [memory_unit.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/memory_unit.v)

#### The full design of RISC-SPM is [RISC-SPM.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/RISC-SPM.v)
#### The testbench for RISC-SPM is [RISC_SPM_TB_1](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/RISC_SPM_TB_1.v) with the clock unit [Clock_Unit.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/Clock_Unit.v)
### IV. FPGA Deployment
We will use the Terasic DE10-Lite FPGA for this project.

Here is the Memory that we will implement on DE10-Lite board

![Alt text](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/fpga_implementation.png)

On the FPGA, we need to see the output as shown below

![Alt text](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/what_we_implement.png)

Make sure you have to assign the right pin planner shown below

![Alt text](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/pin_planner1.png)

![Alt text](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/pin_planner2.png)

![Alt text](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/pin_planner3.png)

We need to modify our Memory_Unit.v to the [fpga_memory.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/fpga_memory.v).

We need to add a 7-segment Hex decoder to our project [Hex7Seg.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/Hex7Seg.v)

The final program loaded to the FPGA is [DE10_Lite_RISC_Wrapper.v](https://github.com/GitRepo088/RISC-SPM-Programs/blob/main/DE10_Lite_RISC_Wrapper.v).
