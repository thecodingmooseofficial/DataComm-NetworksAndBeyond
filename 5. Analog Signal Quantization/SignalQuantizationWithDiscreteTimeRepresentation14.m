% Parameters
fs = 40e3;               % Sampling frequency
fc = 13;                 % Signal frequency
t = 0:1/fs:0.001;        % Discrete time vector
x = 14 * sin(2 * pi * fc * 100 * t); % Discrete signal

% Quantization
n = 4;                   % Number of bits
L = (2^n) - 1;           % Number of quantization levels
delta = (max(x) - min(x)) / L; % Step size for quantization
xq = min(x) + round((x - min(x)) / delta) * delta; % Quantized signal

% Plotting original discrete signal
subplot(2, 1, 1);
stem(t, x, 'r');
title('Discrete Time Representation');
xlabel('Time (s)');
ylabel('X[n]');

% Plotting quantized signal
subplot(2, 1, 2);
stairs(t, xq, 'b');
title('Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;