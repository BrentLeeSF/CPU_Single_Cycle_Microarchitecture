# CPU_Single_Cycle_Microarchitecture
CPU (Central Processing Unit)

The Python script converts each line of ARM Assembly code into 32 bit instruction words. We then open up our 
CPU with Logisim and load the text file (full of instruction words) into the ROM of the Main Memory (see picture).

Each clock cycle will then send the instruction word to be split up by the Wire_Split file to determine if it is a 
data, memory, or branch instruction. It is then sent to the Control Unit to be further broken down to determine its 
exact function.

-The Control Unit is broken down into two major sections (Decoder and Condition Logic) with sections between them. 

-The Decoder is made of the ALU Decoder, Main Decoder, and PC Logic. The ALU Decoder receives bits to determine what 
function the ALU should perform. The Main Decoder receives bits to determine the majority of the functions of the CPU 
(determines which parts of the data, memory, and branch instructions it is and which flags to set because of them). 
The PC Logic determines if the instruction is using the PC.

-The Condition Logic (one of two main parts of the Control Unit) receives a lot of info from the Decoder, and from 
the wire split. In the Condition Check, it determines if the action should perform (the condition flags are set from 
the ALU (negative, equal, overflow, etc), if these flags do not equal the one of the instruction (or the instruction 
indicates to ignore them) it is ignored. Otherwise it performs the function given by the flags. The Condition Logic 
sends out flags to either write to the Reg File, write to Memory (Data Memory) and determine if the instruction uses the PC.

-The flags from the Control Unit determine which parts of the CPU perform. Many of these flags are sent to mutexes 
which work off of if binary information (if the flag is positive or negative).

-The ALU receives flags from the Control Unit, and input from the Register File and Extend File to perform the given 
calculations (add, subtract, etc). The results of the calculations will send off flags back to the Control Unit if the 
values are equal, negative, overflow, or if carry information is used. The results from the calculation are either put 
in the Data Memory, used with the PC, or Register File.

-The Extend is given values by the Wire Split. It determines if the value is from a data, memory or branch instruction. 
It extends the value accordingly. It then sends it’s values to the ALU.

-The Register File has two Read Ports A1 & A2 (to read from specific registers) and one Write Port A3 (to write to a 
specific register), a Write Data Input (WD3 - to write values into the register indicated by Write Port A3), and two 
Read Data Outputs RD1 & RD2 (A1 & A2 determine which registers to read from, the register values are read out from the 
Read Outputs). The Register File is full of 16 different registers to store value (some of these are the PC 
(register 15 - the PC program counter - points to the next instruction), 
LR (register 14 - link register - where to branch to on the stack), and SP (register 13 - stack pointer). 
It also receives flags from the Control Unit to indicate which actions are to be performed (although many of 
these flags are sent to mutexes before the Register File to determine which values or register to use). 
Also, the final value in Register 0, is the result of the end of the program :)

-The Data Memory - is used to store and load data from the indicated memory instruction at a specific address (on the RAM). 
A STR instruction writes data into memory at a given address, and an LDR instruction reads data from a given address.

Here are SOME pictures of the structures I made of the CPU

CPU
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/CPU.png)
Control Unit
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/ControlUnit.png)
Decoder
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/Decoder.png)
Main Decoder
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/MainDecoder.png)
ALU Decoder
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/ALU_Decoder.png)
Condition Logic
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/ConditionLogic.png)
Condition Check
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/ConditionCheck.png)
Register File
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/RegFile.png)
ALU
![alt text](https://github.com/BrentLeeSF/CPU_Single_Cycle_Microarchitecture/blob/master/CPU_Pics/ALU.png)



