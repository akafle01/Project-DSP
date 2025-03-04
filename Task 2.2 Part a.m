% Given values
m = 2;
u = 3.6e-6;
fs = 4e6;
h = 0.174;
Ar_As = 0.8; % Echo amplitude scaling factor
ToF = 2 * h / 343; % Ground truth time of flight (ToF)
T = 1/fs; % Sampling period
n = 0:T:5e-3; % Time vector for the discrete-time signal

% (1.1) Generate the transmitted ultrasound signal
A_s = 1;
f_s = 550e3;
phi_s = 0;
transmitted_signal = A_s * (n.^m) .* exp(-n/u) .* cos(2*pi*f_s*n + phi_s);

% Generate the received continuous-time ultrasonic signal
target_distance = 0.174;
echo_delay = 2 * target_distance / 343;
received_signal = transmitted_signal + Ar_As * circshift(transmitted_signal, [0, -round(echo_delay/T)]);

%  Compute the corresponding discrete-time signal
received_discrete = received_signal(1:round(5e-3/T));

%  Extract the envelope of the discrete-time signal
rcve_discrete = abs(hilbert(received_discrete));

%% (2.1) Generate a noise signal with a maximum amplitude of 0.04
noise_amplitude = 0.04;
noise_signal = noise_amplitude * randn(size(rcve_discrete));

% Add the noise signal to the normalized received signal
noisy_received_signal = rcve_discrete + noise_signal;

% Plot the signals
figure;
subplot(3,1,1);
plot(n, transmitted_signal);
title('Transmitted Ultrasound Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(n(1:length(rcve_discrete)), rcve_discrete);
title('Normalized Received Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(n(1:length(noisy_received_signal)), noisy_received_signal);
title('Noisy Received Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% (2.2) Recover the envelope from the noisy received signal
recovered_envelope = abs(hilbert(noisy_received_signal));

% (2.3) Measure ToF using the recovered envelope
[~, t_peak_transmitted_noisy] = findpeaks(transmitted_signal);
[~, t_peak_echo_noisy] = findpeaks(recovered_envelope);

%%%Check if there are enough peaks to calculate Tfmeas_noisy
if numel(t_peak_transmitted_noisy) >= 1 && numel(t_peak_echo_noisy) >= 1
    % Compute the time-of-flight measurement (Tfmeas_noisy) in seconds
    Tfmeas_noisy = (t_peak_echo_noisy(1) - t_peak_transmitted_noisy(1)) * T;

    % Display the results and errors for the noisy signal
    disp('Ground Truth ToF:');
    disp(ToF);
    disp('Measured ToF (Tfmeas_noisy):');
    disp(Tfmeas_noisy);

    % Compare the obtained time-of-flight with the ground truth
    error_Tof_meas_noisy = abs(Tfmeas_noisy - ToF);
    disp('Error in ToF measurement (Tfmeas_noisy):');
    disp(error_Tof_meas_noisy);
else
    disp('Not enough peaks found to calculate Tfmeas_noisy.');
end

% Plot the recovered envelope
figure;
plot(n(1:length(recovered_envelope)), recovered_envelope);
title('Recovered Envelope from Noisy Received Signal');
xlabel('Time (s)');
ylabel('Amplitude');
