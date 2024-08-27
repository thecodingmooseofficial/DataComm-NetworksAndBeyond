% Parameters
Amplitude = 4;              % Amplitude of the sine wave
Bits = 3;                   % Number of bits for quantization
Frequency = 1;              % Frequency of the sine wave
SamplingFrequency = 30;     % Sampling frequency

% Time vector for one cycle
Time = 0:1/SamplingFrequency:pi;

% Generate sampled sine wave
SampledSignal = Amplitude * sin(2 * pi * Frequency * Time);

% Number of samples
NumSamples = length(SampledSignal);

% Initialize quantized output
QuantizedOutput = zeros(1, NumSamples);

% Calculate step size for quantization
StepSize = 2 * Amplitude / (2 ^ Bits);

% Determine lower and upper limits for quantization
LowerLimit = -Amplitude + StepSize / 2;
UpperLimit = Amplitude - StepSize / 2;

% Quantization process
for Level = LowerLimit:StepSize:UpperLimit
    for SampleIndex = 1:NumSamples
        if ((Level - StepSize / 2) < SampledSignal(SampleIndex)) && (SampledSignal(SampleIndex) < (Level + StepSize / 2))
            QuantizedOutput(SampleIndex) = Level;
        end
    end
end

% Plot quantized signal
stem(Time, QuantizedOutput, 'b', 'DisplayName', 'Quantized Signal');
hold on;

% Plot original sine wave
plot(Time, SampledSignal, 'r', 'DisplayName', 'Original Signal');

% Labels and legend
xlabel('Time');
ylabel('Amplitude');
title('Quantization of a Sine Wave');
legend show;
grid on;