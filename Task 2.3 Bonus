% Given values
m = 2;
u = 3.6e-6;
fs = 4e6;
h = 0.174;
Ar_As = 0.8; % Echo amplitude scaling factor
T = 1/fs; % Sampling period
n = 0:T:5e-3; % Time vector for the discrete-time signal
speed_of_sound = 343; % Speed of sound in m/s

% Target distances corresponding to ToF (k + λ)T
lambda_values = -0.5:0.1:5;
target_distances = (1001 + lambda_values) * T * speed_of_sound / 2;

% Initialize arrays to store errors for both methods
errors_method1 = zeros(size(lambda_values));
errors_method2 = zeros(size(lambda_values));

% Loop through different λ values
for i = 1:length(lambda_values)
    lambda = lambda_values(i);
    
    % Generate the received signal for the variable target distance
    received_signal = zeros(size(n));
    echo_delay = (1001 + lambda) * T;
    
    % Ensure that the echo_delay is within the range of n
    if round(echo_delay/T) < length(n)
        received_signal(round(echo_delay/T) + 1:end) = Ar_As * circshift(transmitted_signal(1:length(n)-round(echo_delay/T)), [0, -round(echo_delay/T)]);
    else
        disp('Echo delay exceeds the length of n.');
        continue;  % Skip to the next iteration if echo delay is too large
    end

    % Measure ToF using Method 1 (tracking maximum value)
    [~, t_peak_transmitted] = findpeaks(transmitted_signal);
    [~, t_peak_echo_method1] = findpeaks(abs(hilbert(received_signal)));

    % Check if there are enough peaks to calculate ToF
    if numel(t_peak_transmitted) >= 1 && numel(t_peak_echo_method1) >= 1
        ToF_method1 = (t_peak_echo_method1(1) - t_peak_transmitted(1)) * T;
        error_method1 = abs(ToF_method1 - target_distances(i));
        errors_method1(i) = error_method1;
    else
        disp('Not enough peaks found for Method 1.');
    end

    % Measure ToF using Method 2 (correlation)
    correlation_result = xcorr(abs(hilbert(received_signal)));
    [~, locs_method2] = findpeaks(correlation_result, 'SortStr', 'descend');

    % Check if there are enough peaks to calculate ToF
    if numel(locs_method2) >= 2
        ToF_method2 = (locs_method2(2) - k) * T;
        error_method2 = abs(ToF_method2 - target_distances(i));
        errors_method2(i) = error_method2;
    else
        disp('Not enough peaks found for Method 2.');
    end
end

% Plot the errors as a function of λ for both methods
figure;
plot(lambda_values, errors_method1, 'o-', 'DisplayName', 'Method 1');
hold on;
plot(lambda_values, errors_method2, 's-', 'DisplayName', 'Method 2');
xlabel('Lambda (\lambda)');
ylabel('Error in Distance Measurement (mm)');
title('Error in Distance Measurement vs. Lambda for Variable Targets');
legend('Location', 'Best');
grid on;
