% Given values
fs = 4e6; % Sampling frequency
T = 1/fs; % Sampling period
ground_truth_ToF = 2 * h / 343; % Ground truth time of flight (ToF)

% Find peaks in the transmitted pulse envelope
[~, t_peak_transmitted] = findpeaks(rcve_discrete);

% Find peaks in the received echo pulse envelope
[~, t_peak_echo] = findpeaks(rcve_discrete);

% Compute the time-of-flight measurement (Tfmeas1) in seconds
Tfmeas1 = (t_peak_echo(1) - t_peak_transmitted(1)) * T;

% Display the results
disp('Ground Truth ToF:');
disp(ground_truth_ToF);
disp('Measured ToF (Tfmeas1):');
disp(Tfmeas1);

% Compare the obtained time-of-flight with the ground truth
error_Tof = abs(Tfmeas1 - ground_truth_ToF);
disp('Error in ToF measurement:');
disp(error_Tof);
