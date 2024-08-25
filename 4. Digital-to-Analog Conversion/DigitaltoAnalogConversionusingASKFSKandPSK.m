% Digital to Analog Conversion using ASK, FSK, and PSK

f = 5; % Frequency for ASK and PSK
f2 = 10; % Frequency for FSK

x = [1 1 0 0 1 0 1 0]; % Input signal
nx = length(x); % Number of elements in the input signal

figure; % Create a new figure for plotting

% Loop through each element of the input signal
for i = 1:nx
    t = i:0.001:i+1;  % Time vector for each signal element
    
    % Generate signals based on the current input value
    if x(i) == 1
        ask = sin(2*pi*f*t); % Amplitude Shift Keying
        fsk = sin(2*pi*f*t); % Frequency Shift Keying
        psk = sin(2*pi*f*t); % Phase Shift Keying
    else
        ask = 0; % No signal for ASK
        fsk = sin(2*pi*f2*t); % Frequency Shift Keying with different frequency
        psk = sin(2*pi*f*t + pi); % Phase Shift Keying with phase shift
    end
    
    % Plot the signals
    subplot(3,1,1);
    plot(t, ask); hold on; grid on;
    axis([1 nx -1 1]);
    title('Amplitude Shift Keying');
    
    subplot(3,1,2);
    plot(t, fsk); hold on; grid on;
    axis([1 nx -1 1]);
    title('Frequency Shift Keying');
    
    subplot(3,1,3);
    plot(t, psk); hold on; grid on;
    axis([1 nx -1 1]);
    title('Phase Shift Keying');
end
