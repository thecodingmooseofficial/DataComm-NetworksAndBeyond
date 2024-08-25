% QPSK Modulation

f = 10; % Carrier frequency
x1 = [0 1 0 1]; % First bit stream
x2 = [0 0 1 1]; % Second bit stream
nx = length(x1); % Number of elements in the bit stream

figure; % Create a new figure for plotting

for i = 1:nx
    t = (i-1):0.001:i;  % Time vector for each signal element
    
    if x1(i) == 1
        psk1 = sin(2*pi*f*t); % No phase shift
    else
        psk1 = sin(2*pi*f*t + pi); % Phase shift by π
    end
    
    if x2(i) == 1
        psk2 = sin(2*pi*f*t + pi/2); % Phase shift by π/2
    else
        psk2 = sin(2*pi*f*t + 3*pi/2); % Phase shift by 3π/2
    end
    
    QPSK = psk1 + psk2; % Combine the two PSK components to form QPSK
    
    subplot(3,1,1); % Plot PSK1
    plot(t, psk1); hold on; grid on;
    axis([0 nx -1.5 1.5]); % Start from 0 on the x-axis
    title('PSK1');
    
    subplot(3,1,2); % Plot PSK2
    plot(t, psk2); hold on; grid on;
    axis([0 nx -1.5 1.5]); % Start from 0 on the x-axis
    title('PSK2');
    
    subplot(3,1,3); % Plot the resulting QPSK signal
    plot(t, QPSK); hold on; grid on;
    axis([0 nx -2.5 2.5]); % Adjusted to fit QPSK signal range
    title('QPSK');
end
