% Given values
m = 2;
u = 3.6e-6;
fs = 4e6;
h = 0.174;
Ar_As = 0.8; % Echo amplitude scaling factor
ToF = 2 * h / 343; % Ground truth time of flight (ToF)
T = 1/fs; % Sampling period
n = 0:T:5e-3; % Time vector for the discrete-time signal

% Generate the transmitted ultrasound signal
A_s = 1;
f_s = 550e3;
phi_s = 0;
transmitted_signal = A_s * (n.^m) .* exp(-n/u) .* cos(2*pi*f_s*n + phi_s);

% Generate the received continuous-time ultrasonic signal
target_distance = 0.174;
echo_delay = 2 * target_distance / 343;
received_signal = transmitted_signal + Ar_As * circshift(transmitted_signal, [0, -round(echo_delay/T)]);

% Compute the corresponding discrete-time signal
received_discrete = received_signal(1:round(5e-3/T));

% Extract the envelope of the discrete-time signal
rcve_discrete = abs(hilbert(received_discrete));

% Generate a noise signal with a maximum amplitude of 0.04
noise_amplitude = 0.04;
noise_signal = noise_amplitude * randn(size(rcve_discrete));

% Add the noise signal to the normalized received signal
noisy_received_signal = rcve_discrete + noise_signal;

% Recover the envelope from the noisy received signal using Hilbert Transform
rcvnoisy_envelope = abs(hilbert(noisy_received_signal));

% Measure ToF using the autocorrelation function
correlation_result = xcorr(rcvnoisy_envelope);
[~, locs] = findpeaks(correlation_result, 'SortStr', 'descend');

% Check if there are enough peaks to calculate T_f_noisymeas2
if numel(locs) >= 2
    % Compute the time-of-flight measurement (T_f_noisymeas2) in seconds
    T_f_noisymeas2 = locs(2) * T;

    % Display the results and errors for the noisy signal
    disp('Ground Truth ToF:');
    disp(ToF);
    disp('Measured ToF (T_f_noisymeas2):');
    disp(T_f_noisymeas2);

    % Compare the obtained time-of-flight with the ground truth
    error_Tof_noisymeas2 = abs(T_f_noisymeas2 - ToF);
    percentage_error_Tof_noisymeas2 = (error_Tof_noisymeas2 / ToF) * 100;

    disp('Error in ToF measurement (T_f_noisymeas2):');
    disp(error_Tof_noisymeas2);
    disp('Percentage Absolute Distance Error:');
    disp(percentage_error_Tof_noisymeas2);
    
else
    disp('Not enough peaks found to calculate T_f_noisymeas2.');
end

% Plot the signals and recovered envelope
figure;
subplot(4,1,1);
plot(n, transmitted_signal);
title('Transmitted Ultrasound Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(n(1:length(rcve_discrete)), rcve_discrete);
title('Original Envelope (rcve[n])');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(n(1:length(noisy_received_signal)), noisy_received_signal);
title('Noisy Received Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(n(1:length(rcvnoisy_envelope)), rcvnoisy_envelope);
title('Recovered Envelope from Noisy Received Signal');
xlabel('Time (s)');
ylabel('Amplitude');
