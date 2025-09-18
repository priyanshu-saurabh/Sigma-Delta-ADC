# Sigma-Delta ADC Simulation Results

This document summarizes the measured Signal-to-Noise Ratio (SNR) for different input conditions of the 1st-order ΣΔ ADC.

---

## Figure 1 — SNR ≈ 45 dB (70% of Full-Scale Input)

- **Input type**: Single-tone sine wave  
- **Amplitude**: ~70% of full-scale  
- **Measured SNR**: ~45 dB  
- **Observation**:  
  - At moderate-to-high input levels, the ADC achieves near-ideal in-band noise shaping.  
  - Distortion is minimal, so the SNR is close to the expected theoretical performance.  
  - This operating point represents a good balance between input amplitude and linearity.

---

## Figure 2 — SNR ≈ 18 dB (Small-Signal Input, 30 mV)
![Figure 2](https://github.com/priyanshu-saurabh/Sigma-Delta-ADC/blob/main/S-D%20ADC/simulations/enob_snr/Test-2/Figure%202%20A.png)
- **Input type**: Single-tone sine wave  
- **Amplitude**: ~30 mV (~much smaller than full-scale)  
- **Measured SNR**: ~18 dB  
- **Observation**:  
  - For small signals, quantization noise dominates because the signal power is much weaker relative to the noise floor.  
  - The effective SNR drops significantly as the input amplitude decreases.  
  - This illustrates the trade-off in ΣΔ ADCs: smaller inputs experience reduced effective resolution.

---

## Key Insight

- **SNR scales with input amplitude**:  
  - Near full-scale → higher SNR (close to theory).  
  - Small amplitude → much lower SNR, as noise floor becomes dominant.  
- The decimation filter successfully shapes quantization noise in-band, but ultimate performance depends on input signal amplitude relative to full-scale.

---

