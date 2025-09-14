# Integrator (OTA-C) – Schematic Documentation

## Overview
This folder contains the schematic design of the **Integrator** implemented using an **OTA (Operational Transconductance Amplifier) with a capacitor load**.  
The integrator is a key building block of the **Sigma-Delta Modulator (SDM) ADC**, providing noise shaping by accumulating the input signal and emphasizing quantization noise at higher frequencies.

---

## Figure 1 – OTA-C Integrator Schematic
**Pins Description:**
- **Vdd** – Positive supply voltage  
- **Vss** – Ground / negative supply  
- **Vin+** – Positive input  
- **Vin-** – Negative input  
- **Vout** – Integrator output  
- **Vbias** – Bias voltage for OTA  

---

## Role in SDM ADC
- **Input Stage**: Receives the summed input signal (external input + DAC feedback).  
- **Integration Stage**: The OTA drives the capacitor load to perform continuous-time integration.  
- **Output Stage**: Provides an integrated output signal to the StrongARM Comparator for decision-making.  

---

## Features
- OTA-C based continuous-time integrator  
- Differential input and output for noise immunity  
- High linearity when properly biased  
- Tunable time constant (**τ = R × C**) depending on OTA transconductance and capacitor value  

---

## Notes
- Capacitor value **C** and OTA bias current must be chosen carefully to set the required loop filter response.  
- Ensure OTA is biased in its **linear region** for proper integration behavior.  
- Stability depends on OTA gain and capacitor sizing.  

---

## Integration with Other Blocks
This integrator works alongside:
- **OTA (Summing Amplifier)** – sums the input signal and DAC feedback before integration  
- **StrongARM Comparator** – resolves the integrated signal into a digital decision  
- **1-bit DAC** – provides the feedback signal to the summing node  
- **Clocking Unit** – controls timing of comparator decision and feedback loop  

Together, these blocks form the **first-order Sigma-Delta ADC** implemented in this repository.  
