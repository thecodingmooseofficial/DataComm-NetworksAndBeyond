% Define parameters 
fs = 1000; % Sampling frequency 
t = -0.5:1/fs:0.5-1/fs; % Time vector 

% Signal parameters 
f1 = 4; % Frequency of the first signal 
f2 = 7; % Frequency of the second signal 
A1 = 7; % Amplitude of the first signal 
A2 = 9; % Amplitude of the second signal 

% Generate signals 
x1 = A1 * sin(2 * pi * f1 * 10 * t);  
x2 = A2 * sin(2 * pi * f2 * 10 * t);  
x3 = x1 + x2; % Composite signal 

% Quantization parameters 
n_bits = 8; % Number of bits for quantization 
quantization_levels = 2^n_bits; % Number of quantization levels
x3_quantized = round((x3 - min(x3)) / (max(x3) - min(x3)) * (quantization_levels - 1)) / (quantization_levels - 1) * (max(x3) - min(x3)) + min(x3);

% Compute the Bit Rate 
bit_rate = n_bits * fs; % Bit rate in bits per second

% Create figure 
figure; 

% Subplot 1 -- Signal x1 in Time Domain 
subplot(4, 2, 1); 
plot(t, x1); 
title('Signal x1 in Time Domain'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 

% Subplot 2 -- Signal x2 in Time Domain 
subplot(4, 2, 2); 
plot(t, x2); 
title('Signal x2 in Time Domain'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 

% Subplot 3 -- Signal x3 in Time Domain 
subplot(4, 2, [3 4]); 
plot(t, x3); 
title('Signal x3 in Time Domain'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 

% Subplot 4 -- Quantized Signal x3 
subplot(4, 2, [5 6]); 
plot(t, x3_quantized); 
title('Quantized Signal x3'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 

% Compute the FFT of signal x3 
fx3 = fft(x3); % FFT of the composite signal 
fx3 = fftshift(fx3) / (fs / 2); % Shift zero frequency component to center and normalize 
f = fs / 2 * linspace(-1, 1, length(x3)); % Frequency vector 

% Subplot 5 -- Magnitude FFT of Signal x3 
subplot(4, 2, [7 8]); 
plot(f, abs(fx3), 'LineWidth', 1.5); 
title('Magnitude FFT of Signal x3'); 
xlabel('Frequency (Hz)'); 
ylabel('Magnitude'); 

% Set figure title 
sgtitle('Combined Plots of Signals x1, x2, and x3 with Quantization in Time and Frequency Domains'); 

% Plot the magnitude of the FFT with custom axis limits 
figure; 
plot(f, abs(fx3), 'LineWidth', 1.5); 
title('Magnitude FFT of Composite Signal'); 
xlabel('Frequency (Hz)'); 
ylabel('Magnitude'); 
axis([-70 70 0 9]); 

% Compute and display the bandwidth 
bandwidth = obw(x3, fs); 
disp(['Bandwidth: ', num2str(bandwidth)]);

% Display the bit rate
disp(['Bit Rate: ', num2str(bit_rate), ' bits per second']);