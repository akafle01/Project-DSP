% Given values
f = 4e6; % Sampling frequency in Hz
T = 1 / f; % Sampling period
k = 1001; % Number of samples
speed_of_sound = 1390; % Speed of sound in m/s
ToF = 2 * h / speed_of_sound; % Ground truth time of flight (ToF)

% Vary λ from -0.5 to 5 with a step of 0.1
lambda_values = -0.5:0.1:5;

% Initialize array to store maximum distance errors
max_distance_errors = zeros(size(lambda_values));

% Loop through different λ values
for i = 1:length(lambda_values)
    lambda = lambda_values(i);
    
    % Compute the theoretical resolution error
    theoretical_resolution_error = -lambda * T;

    % Compute the maximum distance error
    max_distance_error = theoretical_resolution_error * k * speed_of_sound / 2;

    % Store the result in the array
    max_distance_errors(i) = max_distance_error;
end

% Plot the results
figure;
plot(lambda_values, max_distance_errors, 'o-', 'DisplayName', 'Maximum Distance Error');
xlabel('Lambda (\lambda)');
ylabel('Maximum Distance Error (m)');
title('Effect of Finite Time Resolution on ToF Estimation');
legend('Location', 'Best');
grid on;
