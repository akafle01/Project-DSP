%%bonus 
% Given values
m = 2;
u = 3.6e-6;
fs = 4e6;
h = 0.174;
Ar_As = 0.8; % Echo amplitude scaling factor
ToF = 2 * h / 343; % Ground truth time of flight (ToF)
T = 1/fs; % Sampling period

% (1.1) Generate the transmitted ultrasound signal
t = 0:T:5e-3;
A_s = 1;
f_s = 550e3;
phi_s = 0;
transmitted_signal = A_s * (t.^m) .* exp(-t/u) .* cos(2*pi*f_s*t + phi_s);

% Generate the received continuous-time ultrasonic signal
target_distance = 0.174;
echo_delay = 2 * target_distance / 343;
received_signal = transmitted_signal + Ar_As * circshift(transmitted_signal, [0, -round(echo_delay/T)]);

% Compute the corresponding discrete-time signal
received_discrete = received_signal(1:round(5e-3/T));

%  Extract the envelope of the discrete-time signal
rcve_discrete = abs(hilbert(received_discrete));

% Find the ToF by computing the start time of the transmitted pulse and the echo pulse
[~, t_peak_transmitted] = findpeaks(transmitted_signal);
[~, t_peak_echo] = findpeaks(rcve_discrete);
Tfmeas1 = (t_peak_echo(1) - t_peak_transmitted(1)) * T;

%  Find the ToF, Tfmeas2 by computing the autocorrelation function
autocorr_result = xcorr(rcve_discrete);
[~, lags] = findpeaks(autocorr_result);

% Check if there are enough peaks to calculate Tfmeas2
if numel(lags) >= 2
    % Sort lags in descending order to get the delay of the second maximum peak
    sorted_lags = sort(lags, 'descend');
    Tfmeas2 = sorted_lags(2) * T;
    disp('Measured ToF (Tfmeas2):');
    disp(Tfmeas2);
else
    disp('Not enough peaks found to calculate Tfmeas2.');
end

% Display the results and errors
disp('Ground Truth ToF:');
disp(ToF);
disp('Measured ToF (Tfmeas1):');
disp(Tfmeas1);

% Compare the obtained time-of-flight with the ground truth and previous measurement
error_Tof_meas1 = abs(Tfmeas1 - ToF);
error_Tof_meas2 = abs(Tfmeas2 - ToF);
disp('Error in ToF measurement (Tfmeas1):');
disp(error_Tof_meas1);
disp('Error in ToF measurement (Tfmeas2):');
disp(error_Tof_meas2);
