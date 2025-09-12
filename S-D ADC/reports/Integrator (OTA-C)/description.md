## OTA-C (Integrator) Simulation Results

### Figure 1: Integrator Output with High Time Constant
The output of the OTA-C integrator when the input is a **pulse signal**.  
The time constant is set to a **high value**, causing the output to integrate the input slowly.

![Figure 1](https://github.com/priyanshu-saurabh/Sigma-Delta-ADC/blob/main/S-D%20ADC/reports/Integrator%20(OTA-C)/Figure%201.png)



### Figure 2: Integrator Output with Very High Time Constant
Same input pulse signal, but with the time constant set to a **very high value**.  
This results in an even slower integration response compared to Figure 1.

![Figure 2](docs/integrator_very_high_tc.png)



### Figure 3: Integrator Output with Sine Input
The input is a **sine wave**, and the time constant is set to a **moderate value** (neither high nor low).  
The output resembles a **cosine wave**, as expected from an integration operation.

![Figure 3](docs/integrator_sine_input.png)
