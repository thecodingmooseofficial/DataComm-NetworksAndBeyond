% Parameters
fs = 40e3;        % Sampling frequency
fc = 4e3;         % Signal frequency
t = 0:1/fs:0.001; % Discrete time vector
x = 0.5 * sin(2 * pi * fc * t); % Discrete signal

% --------Quantization------------
n = 8; % Number of bits
L = (2^n) - 1; % Number of quantization levels
delta = (max(x) - min(x)) / L; % Step size for quantization
xq = min(x) + (round((x - min(x)) / delta)) * delta; % Quantized signal
% --------END------------%

% Plot original discrete signal
subplot(2, 1, 1);
stem(t, x, 'r');
title('Discrete Time Representation');
xlabel('Time (s)');
ylabel('X[n]');

% Plot quantized signal
subplot(2, 1, 2);
stairs(t, xq, 'b');
title('Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
