% Given values
fs = 4e6; % Sampling frequency (4 MHz)
Ts = 1/fs; % Sampling period
A_s = 1;
Ar_As = 0.8;
% Time vector for the continuous-time signal
t_continuous = 0:Ts:5e-3; % Discretize time from 0 to 5 ms

% Define your continuous-time received signal r(t)
r_t = A_s * (t_continuous.^m) .* exp(-t_continuous/u) + Ar_As * (t_continuous - ToF).^m .* exp(-(t_continuous - ToF)/u);

% Sample the continuous-time signal to obtain the discrete-time signal
rcv_discrete = r_t;

% Plot the original continuous-time signal and the discrete-time signal
figure;
subplot(2,1,1);
plot(t_continuous, r_t);
title('Continuous-Time Received Ultrasound Signal (r(t))');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(t_continuous, rcv_discrete, 'Marker', 'o');
title('Discrete-Time Received Ultrasound Signal (rcv[n])');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

xlim([0, 5e-6]);

% Display the plots
sgtitle('Continuous-Time and Discrete-Time Received Ultrasound Signals');
