# OTA Simulation Results – Cadence (BJT-Based Design)

This document summarizes the simulation setup and key findings from the OTA (Operational Transconductance Amplifier) simulation carried out using BJTs
 in Cadence Virtuoso.

---

## Simulation Setup

| Parameter                  | Value/Configuration                                |
|---------------------------|-----------------------------------------------------|
| **Technology**            | GPDK90 (90nm Generic Process Design Kit)            |
| **Transistor Type**       | BJTs (NPN & PNP from gpdk90 library)                |
| **Input Voltage (`V+`)**  | Swept from **-0.9 V to +0.3 V**                     |
| **Reference Input (`V−`)**| **0 V** (grounded)                                  |
| **Input Resistance**      | **10 kΩ**                                           |
| **Output Resistance**     | **30 kΩ**                                           |
| **Collector Current (Ic)**| Approximately **1 mA** per leg of differential pair |
| **Biasing**               | Constant current source at NPN tail                 |
| **Load**                  | Current mirror (active PNP load)                    |

---

##  Simulations Performed

### 1. **DC Sweep Analysis**

- `V+` was swept from -0.9 V to +0.3 V while `V−` remained at 0 V.
- `Iout` was measured at the output node (collector of active load , accross the output resistor(R4-plus is taken)).
  

### 2. **gm (Transconductance) Estimation**



gm = ΔIout / ΔVin ≈ 1 mA / 0.1 V = 10 mS

- The linear region showed transconductance of approximately **10 mS**.
- This matches expected values for BJT operation with 1 mA collector current.
- It is shifted in right after changing the factors.
---

##  Key Results

- OTA behaves as a **voltage-controlled current source (VCCS)**.
- `Iout` responds linearly to differential input (`Vin`).
- Transconductance (`gm`) is extracted accurately from DC sweep.
- Proper biasing ensured all BJTs operated in the **active region** during simulation.
- No distortion observed within the small-signal range.

---


