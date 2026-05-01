# High-Resolution Continuous-Time ΣΔ Modulator with OTA-C Integrator and StrongARM Comparator

<p align="center">
  <img src="https://github.com/priyanshu-saurabh/Sigma-Delta-ADC/blob/main/S-D%20ADC/layouts/main/sdm-adc-layout.png" alt="Sigma-Delta ADC Layout" width="80%">
</p>
---
First-Order Sigma-Delta ADC (Full-Custom Design)

This repository documents the design, verification, and layout of a first-order Sigma-Delta Modulator (ΣΔM) ADC in Cadence Virtuoso. The project was completed from scratch, including OTA, integrator, 1-bit DAC, dynamic comparator, system-level integration, FFT analysis, and layout verification.

🔹 Project Overview

Architecture: First-order continuous-time ΣΔ ADC

Blocks Implemented:

OTA (Operational Transconductance Amplifier)

OTA-C Integrator

Dynamic comparator (1-bit quantizer)

1-bit feedback DAC

Input Stimuli:

Sine waves (for SNR/ENOB testing)

PWL file generated from my recorded voice (“Hi”, ~1.2 s duration)

Output:

1-bit Pulse Density Modulated (PDM) stream

Verified through FFT, SNR/ENOB, and reconstruction

🔹 Key Features

Complete schematic design of all building blocks.

System-level simulation using both sine and real audio inputs.

FFT-based performance analysis (SNR, ENOB, quantization noise shaping).

Layout implementation with DRC/LVS verification.

Documentation of debugging challenges and practical solutions.

🔹 Challenges & Solutions
1. Reference Level Mismatch Between Blocks

Problem: OTA, comparator, and DAC worked on different reference levels → integrator output drifted unrealistically (0–50 V).

Solution: Unified references with a consistent common-mode (Vcm). Adjusted comparator threshold and DAC polarity to match.

Impact: Loop stabilized, integrator output confined within supply range (0–1.8 V).

2. OTA-C Integrator Stability

Problem: Wrong RC or bias caused integrator to either saturate or barely respond.

Solution: Bias current = ----, R = 100kΩ, C = 1pF → pole at ~1.6 MHz, within OTA GBW.

Impact: Achieved correct (sine-->cosine or pulse--->sawtooth-like) integration, enabling proper ΣΔ loop operation.

3. Comparator Threshold & Offset

Problem: Comparator stuck at constant output (all 0’s or all 1’s).

Solution: Aligned comparator threshold to integrator’s common-mode (0 V for bipolar, 0.9 V for unipolar feedback). Used latch comparator for sharp decisions.

Impact: Reliable quantization, correct pulse-density variation.

4. Oversampling Ratio (OSR) & Clock Selection

Problem: Early simulations had fclk ≈ fin, so no oversampling/noise shaping.

Solution: Chose OSR ≥ 64 (e.g., fin = 2 kHz, fclk ≈ 128 kHz).

Impact: Clear quantization noise shaping observed in FFT.

5. Input vs DAC Scaling

Problem: Small Vin → density barely changed; large Vin → loop saturated.

Solution: Set Vin amplitude ≈ 50–80% of Vref (e.g., 9m – 50m V for Vref = 20-50u V).

Impact: Proper dynamic range utilization; output density varied with input amplitude.

6. FFT Analysis Confusion

Problem: First FFT runs showed signal power in DC bin → SNR ~8 dB, looked wrong.

Solution: Used coherent sine input + Hann window or hamming. Isolated fundamental tone in FFT.

Impact: Realistic SNR values measured.

7. Layout Parasitics & Matching

Problem: Extracted simulations showed pole shifts & offset due to parasitics/mismatch.

Solution: Common-centroid layout for capacitors and resistors, guard rings, substrate contacts, wide supply rails.

Impact: DRC/LVS clean, post-layout sims matched schematic-level behavior.

🔹 Performance Results

Sine Input (2 kHz, OSR = 64):

Quantizer CLOCK Period = 3.90625u s

Quantizer CLOCK Pulse Width = 1.953125u s

Fall/Rise time = 1n s

SNDR ≈ 51.4 dB (without DSP filtering)

ENOB ≈ 8.2 bits

Voice Input (PWL “Hi”, ~1.2 s):

SNR ≈ 32 dB (raw PDM stream, pre-DSP filtering)

ENOB ≈ 5.1 bits

FFT Analysis: Clear signal tone with shaped quantization noise slope.

Reconstruction: Basic averaging filter showed resemblance to original input.

🔹 Layout Results

All building blocks placed and routed in Cadence Virtuoso.

DRC/LVS clean.

Layout techniques:

Common-centroid capacitor matching

Guard rings & substrate contacts for isolation

Wide metal rails for power stability

🔹 Lessons Learned

Working on this project made me realize that analog debugging is as much about intuition as it is about running simulations. No tool can magically fix problems like reference mismatches or wrong biasing.
those have to be understood at the circuit level. I also learned how sensitive a Sigma Delta loop is to details: things like integrator tuning or comparator threshold alignment can make or break the system. And even if the schematic looks perfect, layout parasitics and mismatches can completely change the behavior unless you use careful matching and isolation. In the end, this “simple” first-order Sigma-Delta ADC showed me just how deep and challenging mixed-signal design really is.
