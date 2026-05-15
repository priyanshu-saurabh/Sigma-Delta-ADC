# High-Resolution Continuous-Time ΣΔ Modulator with OTA-C Integrator and StrongARM Comparator

<p align="center">
  <img src="https://github.com/priyanshu-saurabh/Sigma-Delta-ADC/blob/main/S-D%20ADC/layouts/main/sdm-adc-layout.png" alt="Sigma-Delta ADC Layout" width="80%">
</p>
---
First-Order Sigma-Delta ADC (Full-Custom Design)

This project involved the design and implementation of a first-order continuous-time Sigma-Delta (ΣΔ) ADC using Cadence Virtuoso. The complete system included an OTA, OTA-C integrator, dynamic comparator acting as a 1-bit quantizer, and a 1-bit feedback DAC. The ADC was tested using both sine-wave inputs for SNR and ENOB evaluation, and a real voice signal converted into a PWL source. The output was a 1-bit pulse density modulated (PDM) stream, which was analyzed through FFT, SNR/ENOB calculations, and signal reconstruction.

The work covered complete schematic design, system-level simulation, layout implementation, and post-layout verification. Several practical mixed-signal design challenges were encountered during development. Initially, mismatched reference levels between the OTA, comparator, and DAC caused the integrator output to drift far beyond the supply range. This was resolved by establishing a consistent common-mode reference and properly aligning the comparator threshold and DAC polarity, which stabilized the loop operation within the 0–1.8 V supply range. Integrator instability caused by improper RC selection and biasing was corrected by tuning the resistor, capacitor, and bias current values so that the integrator pole remained within the OTA bandwidth.

Comparator threshold alignment was another critical issue, as incorrect thresholds caused the quantizer output to remain stuck at logic 0 or logic 1. Using a latch comparator and matching the threshold to the system common-mode enabled reliable pulse-density modulation. Oversampling and clock configuration also required optimization because early simulations lacked proper noise shaping due to insufficient oversampling. By selecting an OSR of at least 64, clear quantization noise shaping became visible in FFT analysis. Input and DAC scaling were also carefully adjusted to avoid loop saturation while still utilizing the available dynamic range effectively.

FFT analysis initially produced misleading results because most signal power appeared in the DC bin, resulting in poor measured SNR. This was corrected by using coherent sine-wave inputs and proper windowing functions such as Hann or Hamming windows. Post-layout simulations introduced additional issues related to parasitic effects and component mismatch. These were minimized through common-centroid layout techniques, guard rings, substrate contacts, and wide supply rails, resulting in DRC/LVS-clean layouts with post-layout behavior closely matching schematic simulations.

Performance results included:

• SNDR ≈ 51.4 dB and ENOB ≈ 8.2 bits for a 2 kHz sine-wave input at OSR = 64
• SNR ≈ 32 dB and ENOB ≈ 5.1 bits for the recorded voice input
• Clear quantization noise shaping observed in FFT analysis
• Successful basic reconstruction of the original voice signal using averaging filters

This project provided practical experience in mixed-signal system integration, analog debugging, FFT-based performance evaluation, and layout-aware circuit design. It demonstrated how sensitive Sigma-Delta systems are to biasing, reference alignment, integrator tuning, and layout parasitics, reinforcing the importance of both circuit-level understanding and careful physical implementation in analog and mixed-signal IC design.

