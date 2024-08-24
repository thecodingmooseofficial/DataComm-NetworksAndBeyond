% Parameters
A1 = 4; % Amplitude of first signal
A2 = 9; % Amplitude of second signal
s = 3; % Standard deviation of the noise
f1 = 4; % Frequency of first signal
f2 = 5; % Frequency of second signal
fs = 8000; % Sampling frequency
t = -0.5:1/fs:0.5-1/fs; % Time vector

% Signals
x1 = A1 * sin(2 * pi * f1 * 10 * t); % First signal
x2 = A2 * cos(2 * pi * f2 * 10 * t); % Second signal
x = x1 + x2; % Composite signal

% Noise
n = s * randn(size(t)); % Noise

% Composite noisy signal
ns = x + n; 

% Plotting
figure;

subplot(3, 1, 1);
plot(t, x, 'r'); % Plot composite signal
title('Composite Signal (x)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, n, 'b'); % Plot noise
title('Noise (n)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, ns); % Plot noisy composite signal
title('Composite Noisy Signal (ns)');
xlabel('Time (s)');
ylabel('Amplitude');

% SNR and Channel Capacity Calculation
SNR = snr(ns, n); % Signal-to-Noise Ratio
bandwidth = obw(ns, fs); % Bandwidth of the noisy signal
C = bandwidth * log2(1 + SNR); % Channel Capacity
SL = ceil(2^(C / (2 * bandwidth))); % Symbol Rate