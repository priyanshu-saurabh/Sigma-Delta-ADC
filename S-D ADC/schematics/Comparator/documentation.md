# StrongARM Comparator – Schematic Documentation

## Overview
This folder contains the schematic design of the **StrongARM Comparator** used in the **Sigma-Delta Modulator (SDM) ADC** project.  
The comparator receives the differential summed output from the OTA stage and makes a digital decision that drives the feedback DAC.

---

## Figure 1 – StrongARM Comparator Schematic
**Pins Description:**
- **Vdd** – Positive supply voltage  
- **Vss** – Ground / negative supply  
- **CLK** – Clock input (non-inverted)  
- **CLKB** – Complementary clock input (inverted)  
- **Vbias** – Bias voltage input  
- **Vout+** – Positive differential output  
- **Vout-** – Negative differential output  

---

## Role in SDM ADC
- **Input Stage**: Receives the differential summed voltage from the OTA (summing block).  
- **Decision Stage**: Resolves the small analog input difference into a full-swing digital output when triggered by the clock.  
- **Output Stage**: Provides a digital decision (**Vout+/Vout-**) that controls the 1-bit DAC for feedback.  

---

## Features
- Dynamic latch-based comparator  
- Fully differential outputs  
- Low static power consumption (dynamic operation)  
- High-speed decision capability  

---

## Notes
- Ensure proper **clock phasing** between **CLK** and **CLKB** for correct decision-making.  
- **Vbias** must be tuned for the chosen technology node and transistor sizing.  

---

## Integration with Other Blocks
This comparator is part of the complete **first-order Sigma-Delta ADC**, which consists of:
- **OTA (Summing Amplifier)** – sums the input signal and DAC feedback  
- **StrongARM Comparator** – makes the digital decision  
- **1-bit DAC** – generates feedback to close the loop  
- **Clocking Unit** – synchronizes all operations  

---
