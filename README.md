# RISC-SPM-Programs
## Group 5: Khanh(L), Hung, and Hieu.
## Instructor: Dr. Vo Le Cuong.
## This repository contains the source code of RISC-SPM architecture.

3 main blocks in RISC-SPM: Controller, Processor, and Memory.

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
