# OTA – V–I Characteristics

## Overview
This folder contains the **Voltage–Current (V–I) output waveforms** of the **Operational Transconductance Amplifier (OTA)** used in the **Sigma-Delta Modulator (SDM) ADC** project.  
The plots demonstrate the OTA’s transconductance behavior by showing the relationship between input voltage and output current.

---

## Figure 1 – OTA V–I Plot
**Signals:**
- **/net012 (Red)** – Input voltage sweep  
- **/net011 (Green)** – OTA output current  
- **/R4/PLUS (Magenta)** – Positive node response  
- **/R4/MINUS (Cyan)** – Negative node response  

---

## Interpretation
- The OTA converts the differential input voltage into output current, following the ideal **Iout = gm × Vin** relationship.  
- As the input voltage increases, the output current increases non-linearly at first, then transitions into the expected linear region defined by OTA’s transconductance (**gm**).  
- The positive and negative output nodes show symmetrical response as expected from a differential OTA design.  

---

## Role in SDM ADC
- The OTA is used as the **summing block**, combining the external input signal with the feedback signal from the 1-bit DAC.  
- Its V–I behavior directly affects loop gain and noise shaping in the modulator.  
- Proper sizing and biasing ensure linearity and stability of the modulator.  

---

## Notes
- Bias voltage (**Vbias**) sets the OTA’s operating point and hence its effective transconductance (**gm**).  
- Non-idealities (such as output resistance and transistor mismatch) may cause slight asymmetry in the curves.  
- Ensure simulation covers the full input swing expected in the SDM ADC loop.  

---
![Figure 2: OTA V–I Characteristics](ota_vi.png)
