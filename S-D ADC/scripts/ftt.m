
clear; close all; clc;

CSV_FILE = "SDM-ADC-OUTPUT.csv"; 
MAX_HARMONICS = 5;          

T = readmatrix(CSV_FILE);
time = T(:,1);
voltage = T(:,2);
N = length(voltage);
dt = mean(diff(time));
fs = 1/dt;

w = hann(N);
X = fft(voltage .* w);
P2 = (abs(X).^2);
P1 = P2(1:floor(N/2)+1);
freqs = (0:floor(N/2))' * (fs / N);


[~, idx_rel] = max(P1(2:end));
fund_idx = idx_rel + 1;
fund_freq = freqs(fund_idx);


sig_bins = max(1, fund_idx-1) : min(length(P1), fund_idx+1);
P_signal = sum(P1(sig_bins));

harmonic_bins = [];
for h = 2:MAX_HARMONICS
    hf = fund_freq * h;
    if hf >= fs/2, break; end
    [~, hidx] = min(abs(freqs - hf));
    harmonic_bins = [harmonic_bins, max(1,hidx-1) : min(length(P1),hidx+1)];
end
harmonic_bins = unique(harmonic_bins);

exclude = unique([1, sig_bins]); 
P_noise_and_dist = sum(P1(setdiff(1:length(P1), exclude)));


noise_only_bins = setdiff(2:length(P1), union(sig_bins, harmonic_bins));
P_noise_only = sum(P1(noise_only_bins));

SNDR_dB = 10*log10(P_signal / P_noise_and_dist);
SNR_dB  = 10*log10(P_signal / (P_noise_only + eps));

ENOB = (SNDR_dB - 1.76) / 6.02;

figure;
semilogx(freqs, 10*log10(P1 + 1e-30)); hold on;
xlim([1, fs/2]);
xlabel('Frequency (Hz)'); ylabel('Power (dB)');
title(sprintf('SNDR=%.2f dB, ENOB=%.2f bits, FUND=%.3f Hz', SNDR_dB, ENOB, fund_freq));
grid on;
plot(fund_freq, 10*log10(P1(fund_idx)), 'ro', 'MarkerFaceColor','r');

fprintf('Fundamental = %.6f Hz\n', fund_freq);
fprintf('SNR = %.3f dB (noise only)\n', SNR_dB);
fprintf('SNDR = %.3f dB\n', SNDR_dB);
fprintf('ENOB = %.3f bits\n', ENOB);
