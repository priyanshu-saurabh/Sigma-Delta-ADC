# OTA (Summing Amplifier) – Schematic Documentation

## Overview
This folder contains the schematic design of the **OTA (Operational Transconductance Amplifier)** used as a **summing block** in the **Sigma-Delta Modulator (SDM) ADC** project.  
The OTA combines the external input signal with the feedback signal from the 1-bit DAC and delivers the summed output to the integrator stage.

---

## Figure 1 – OTA Summing Block Schematic
**Pins Description:**
- **Vdd** – Positive supply voltage  
- **Vss** – Ground / negative supply  
- **Vin+** – Positive input (external signal)  
- **Vin-** – Negative input (feedback signal from DAC)  
- **Vout** – Summed output (drives the integrator)  
- **Vbias** – Bias voltage for OTA  

---

## Role in SDM ADC
- **Summing Stage**: Adds the external analog input signal and the feedback from the DAC.  
- **Amplification Stage**: Provides sufficient gain to drive the OTA-C integrator.  
- **Output Stage**: Supplies the summed differential output to the integrator for noise-shaping.  

---

## Features
- Differential input OTA  
- Functions as a summing junction in the feedback loop  
- Configurable gain via OTA bias current  
- Low power consumption depending on bias point  

---

## Notes
- Proper **biasing** of the OTA is essential for linear summing operation.  
- Input transistors should be sized for **low input-referred noise** since this stage directly processes the external input signal.  
- The common-mode feedback (if used) must be tuned for stable operation.  

---

## Integration with Other Blocks
This OTA summing block works in conjunction with:
- **Integrator (OTA-C)** – integrates the summed output  
- **StrongARM Comparator** – resolves the integrated signal into digital output  
- **1-bit DAC** – provides feedback signal for summation  
- **Clocking Unit** – synchronizes comparator and DAC operation  

Together, these blocks form the **first-order Sigma-Delta ADC** implemented in this repository.  
