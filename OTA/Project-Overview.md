# 🧪 BJT-Based OTA Simulation in Cadence Virtuoso

This project simulates an **Operational Transconductance Amplifier (OTA)** designed using **Bipolar Junction Transistors (BJTs)** in **Cadence Virtuoso**. 
The goal is to understand how an OTA works at the transistor level and verify its behavior using DC simulations.

---

## 📖 What is an OTA?

An **Operational Transconductance Amplifier (OTA)** is a voltage-controlled current source (VCCS). Unlike a traditional op-amp that amplifies voltage, 
an OTA outputs a **current proportional to the differential input voltage**:


Iout = gm × (V+ - V−)

Where `gm` is the **transconductance**. OTAs are widely used in analog circuits like filters, oscillators, and modulators.



---

## ⚙️ Project Details

- **Tool**: Cadence Virtuoso (ADE-L)
- **Technology**: GPDK90 
- **Core Components**:
  - Differential input pair (NPN BJTs)
  - Active load using a current mirror (PNP BJTs)
  - Proper biasing using current sources

---

## 📊 Simulations

### ✅ DC Sweep Analysis
- A small differential input voltage (`Vin = V+ - V−`) was applied.
- The output current (`Iout`) was observed.
- Linear behavior confirmed around 0V input — OTA action is verified.
- The **slope of the Iout vs Vin curve** gives the transconductance `gm`.



---

## 🔍 Key Results

-Outputs is attached


🔗 Reference: [EEEGUIDE – OTA Explanation](https://www.eeeguide.com/operational-transconductance-amplifier-ota/)


