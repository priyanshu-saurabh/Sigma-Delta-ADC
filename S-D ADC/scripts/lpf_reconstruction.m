clear; close all; clc;

CSV_FILE = "SDM-ADC-OUTPUT.csv";  % <<< change this
CUTOFF_HZ = 3000;             % LPF cutoff in Hz (set > fundamental)
DECIM = 10;                   % decimation factor
NUMTAPS = 501;                % number of FIR taps (odd recommended)

T = readmatrix(CSV_FILE);
time = T(:,1);
voltage = T(:,2);
N = length(voltage);
dt = mean(diff(time));
fs = 1/dt;


nyq = fs/2;
Wn = CUTOFF_HZ / nyq;
b = fir1(NUMTAPS-1, Wn);  % NUMTAPS-1 because fir1 length = order+1

filtered = filter(b, 1, voltage);


delay = floor((length(b)-1)/2);
filtered_shifted = circshift(filtered, -delay);
% trim tail introduced by shift
filtered_shifted(end-delay+1:end) = [];
time_trim = time(1:length(filtered_shifted));


down = filtered_shifted(1:DECIM:end);
time_down = time_trim(1:DECIM:end);
fs_down = fs / DECIM;

out_file = erase(CSV_FILE, ".csv") + "_reconstructed.csv";
T_out = [time_down, down];
writematrix(T_out, out_file);


figure;
plot(time_down(1:min(2000,length(time_down))), down(1:min(2000,length(down))));
xlabel('Time (s)'); ylabel('Voltage');
title(sprintf('Reconstructed signal (Fs_{new}=%.1f Hz) ', fs_down));
grid on;

fprintf('Saved reconstructed file: %s\n', out_file);
fprintf('Original Fs = %.1f Hz, New Fs = %.1f Hz (decim=%d)\n', fs, fs_down, DECIM);

% NOTE - refined and reformatted by AI
