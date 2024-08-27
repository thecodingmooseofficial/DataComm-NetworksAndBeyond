% Parameters for the second signal
fs2 = 40e3;               % Sampling frequency
fc2 = 13;                 % Signal frequency
t2 = 0:1/fs2:0.001;       % Discrete time vector
x2 = 5 * sin(2 * pi * fc2 * 100 * t2); % Discrete signal

% Quantization for the second signal
n = 4;                   % Number of bits
L = (2^n) - 1;           % Number of quantization levels
delta2 = (max(x2) - min(x2)) / L; % Step size for quantization
xq2 = min(x2) + round((x2 - min(x2)) / delta2) * delta2; % Quantized signal

% Plotting for the second signal
figure;
subplot(2, 1, 1);
stem(t2, x2, 'r');
title('Discrete Time Representation (Amplitude = 5)');
xlabel('Time (s)');
ylabel('X[n]');

subplot(2, 1, 2);
stairs(t2, xq2, 'b');
title('Quantized Signal (Amplitude = 5)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;