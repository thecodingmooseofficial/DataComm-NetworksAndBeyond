% Define parameters
fs = 1000; % Sampling frequency
T = 1/fs; % Sampling period
Frequency = 19;  
t = -0.1: T: 0.1; % Time vector

% Amplitudes and phases
A1 = 4;
A2 = 1;
j1 = 7; % Phase in degrees
j2 = 30; % Phase in degrees

% Convert phases to radians
phase1 = deg2rad(j1);
phase2 = deg2rad(j2);

% Generate signals
x1 = A1 * cos(2*pi*Frequency*t + phase1);
x2 = A2 * cos(2*pi*Frequency*t + phase2);

% Plot both signals
figure;
plot(t, x1, 'b', 'DisplayName', 'x1(t)');
hold on;
plot(t, x2, 'r', 'DisplayName', 'x2(t)');
title('Signals x1(t) and x2(t)');
xlabel('Time (s)');
ylabel('Amplitude');
legend;
grid on;

% Subplot 1 -- Signal x1
subplot(3,1,1);
plot(t, x1);
title('Signal x1(t) in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Subplot 2 -- Signal x2
subplot(3,1,2);
plot(t, x2);
title('Signal x2(t) in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Calculate and display phase and amplitude at t = 0
fprintf('At t = 0:\n');
fprintf('x1(t) = %.2f\n', A1 * cos(phase1));
fprintf('x2(t) = %.2f\n', A2 * cos(phase2));

% Verify maximum amplitudes
fprintf('Maximum amplitude of x1(t): %.2f\n', A1);
fprintf('Maximum amplitude of x2(t): %.2f\n', A2);

% Generate the third signal x3
x3 = x1 + x2;

% Subplot 3 -- Signal x3
subplot(3,1,3);
plot(t, x3);
title('Signal x3(t) = x1(t) + x2(t) in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on; 

% Calculate magnitude and phase of x3
magnitude_x3 = sqrt((A1 + A2 * cos(phase1 - phase2))^2 + (A2 * sin(phase1 - phase2))^2);
phase_x3 = atan2(A2 * sin(phase1 - phase2), A1 + A2 * cos(phase1 - phase2));
phase_x3_deg = rad2deg(phase_x3);
fprintf('Magnitude of x3(t): %.2f\n', magnitude_x3);
fprintf('Phase of x3(t): %.2f degrees\n', phase_x3_deg);