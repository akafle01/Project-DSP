% Given values
m = 2;
u = 3.6e-6;
fs = 4e6;
h = 0.174;
Ar_As = 0.8; % Echo amplitude scaling factor
ToF = 2 * h / 343; % Ground truth time of flight (ToF)
T = 1/fs; % Sampling period
n = 0:T:5e-3; % Time vector for the discrete-time signal

% Create an array of noise amplitudes from 0.01 to 0.9 with a step of 0.01
noise_amplitudes = 0.01:0.01:0.9;

% Initialize arrays to store results
percentage_errors_Tofmeas1 = zeros(size(noise_amplitudes));
percentage_errors_Tofmeas2 = zeros(size(noise_amplitudes));

% Loop through different noise levels
for i = 1:length(noise_amplitudes)
    noise_amplitude = noise_amplitudes(i);
    
    % (1.1) to (2.2) Generate and process signals as before with the given noise amplitude
    % ... (copy relevant code from previous sections)

    % (2.3) Measure ToF using the recovered envelope for Method 1
    [~, t_peak_transmitted_noisy] = findpeaks(transmitted_signal);
    [~, t_peak_echo_noisy_method1] = findpeaks(rcvnoisy_envelope);

    % Check if there are enough peaks to calculate T_f_noisymeas1
    if numel(t_peak_transmitted_noisy) >= 1 && numel(t_peak_echo_noisy_method1) >= 1
        T_f_noisymeas1 = (t_peak_echo_noisy_method1(1) - t_peak_transmitted_noisy(1)) * T;
        error_Tofmeas1 = abs(T_f_noisymeas1 - ToF);
        percentage_errors_Tofmeas1(i) = (error_Tofmeas1 / ToF) * 100;
    else
        disp('Not enough peaks found to calculate T_f_noisymeas1.');
    end

    % Measure ToF using the autocorrelation function for Method 2
    correlation_result = xcorr(rcvnoisy_envelope);
    [~, locs_method2] = findpeaks(correlation_result, 'SortStr', 'descend');

    % Check if there are enough peaks to calculate T_f_noisymeas2
    if numel(locs_method2) >= 2
        T_f_noisymeas2 = locs_method2(2) * T;
        error_Tofmeas2 = abs(T_f_noisymeas2 - ToF);
        percentage_errors_Tofmeas2(i) = (error_Tofmeas2 / ToF) * 100;
    else
        disp('Not enough peaks found to calculate T_f_noisymeas2.');
    end
end

% Plot the results
figure;
plot(noise_amplitudes, percentage_errors_Tofmeas1, 'o-', 'DisplayName', 'Method 1');
hold on;
plot(noise_amplitudes, percentage_errors_Tofmeas2, 's-', 'DisplayName', 'Method 2');
xlabel('Noise Maximum Amplitude');
ylabel('Percentage Absolute Error in Distance Measurement');
title('Performance Analysis for Different Noise Levels');
legend('Method 1', 'Method 2');
grid on;
