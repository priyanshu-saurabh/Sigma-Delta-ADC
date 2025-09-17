# 1-Bit DAC – Schematic Documentation

## Overview
This folder contains the schematic design of the **1-bit Digital-to-Analog Converter (DAC)** used in the **Sigma-Delta Modulator (SDM) ADC** project.  
The DAC converts the digital decision from the StrongARM Comparator into an analog feedback voltage, which is summed with the input signal at the OTA.

---

## Figure 1 – 1-Bit DAC Schematic
**Pins Description:**
- **Vdd** – Positive supply voltage  
- **Vss** – Ground / negative supply  
- **-Vref** – Reference voltage input (negative)  
- **+Vref** – Reference voltage input (positive)
- **Vin+** –  Digital input (from comparator)  
- **Vout** – Analog feedback output  

---

## Role in SDM ADC
- **Input Stage**: Receives digital decision signals (**Din+/Din-**) from the StrongARM Comparator.  
- **Conversion Stage**: Switches between reference voltage levels (**±Vref**) based on comparator output.  
- **Output Stage**: Provides an analog feedback signal (**Vout**) to the OTA summing node, closing the loop of the Sigma-Delta Modulator.  

---

## Features
- Single-bit DAC (minimal complexity)  
- Rail-to-rail switching based on comparator decision  
- Compatible with differential input/output scheme  
- Low latency and high speed  

---

## Notes
- **Vref** defines the feedback amplitude – must be consistent with system supply limits.  
- Correct synchronization with comparator outputs (**Din+/Din-**) is essential for stable modulator operation.  

---

## Integration with Other Blocks
This DAC works in conjunction with:
- **OTA (Summing Amplifier)** – sums the input signal with DAC feedback  
- **StrongARM Comparator** – provides the digital control for DAC switching  
- **Clocking Unit** – ensures proper timing of decisions and feedback updates  

Together, these blocks form the **first-order Sigma-Delta ADC** implemented in this repository.  
