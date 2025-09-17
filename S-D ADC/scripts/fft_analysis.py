import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


CSV_FILE = "CSV_FILE_PATH"

def measure_sndr_enob(csv_file, harmonics=5):
    df = pd.read_csv(csv_file)
    df.columns = ["time", "voltage"]
    signal = df["voltage"].values
    N = len(signal)
    dt = np.mean(np.diff(df["time"].values))
    fs = 1.0 / dt

    window = np.hanning(N)
    fft_vals = np.fft.rfft(signal * window)
    fft_power = np.abs(fft_vals) ** 2
    freqs = np.fft.rfftfreq(N, d=dt)

    fund_idx = np.argmax(fft_power[1:]) + 1
    fund_freq = freqs[fund_idx]
    sig_bins = range(max(0, fund_idx - 1), min(len(fft_power), fund_idx + 2))
    P_signal = np.sum([fft_power[i] for i in sig_bins])

    harmonic_bins = []
    for h in range(2, harmonics + 1):
        h_freq = fund_freq * h
        if h_freq >= fs / 2:
            break
        h_idx = np.argmin(np.abs(freqs - h_freq))
        harmonic_bins.extend(range(max(0, h_idx - 1), min(len(fft_power), h_idx + 2)))

    exclude = set([0]) | set(sig_bins)
    P_noise_and_dist = np.sum([fft_power[i] for i in range(len(fft_power)) if i not in exclude])

    sndr_db = 10 * np.log10(P_signal / P_noise_and_dist)
    enob_bits = (sndr_db - 1.76) / 6.02

    plt.figure(figsize=(8, 4))
    plt.semilogx(freqs, 10 * np.log10(fft_power + 1e-20))
    plt.xlabel("Frequency (Hz)")
    plt.ylabel("Power (dB)")
    plt.title(f"SNDR = {sndr_db:.2f} dB, ENOB = {enob_bits:.2f} bits")
    plt.grid(True)
    plt.show()

    return sndr_db, enob_bits

if __name__ == "__main__":
    sndr, enob = measure_sndr_enob(CSV_FILE)

##Refined by using AI
    print(f"SNDR = {sndr:.2f} dB, ENOB = {enob:.2f} bits")
