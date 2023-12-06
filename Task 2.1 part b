% (1.2)	Generate the received continuous-time ultrasonic signal, for a target corresponding to a distance h = 0.174m. Compute the ToF, TF. The received signal is the transmitted signal added to the echo (delayed and scaled version of the transmitted signal), given by 
% the equation

% Parameters
m = 2;
fs = 550e3;
u = 3.6e-6;
phi_s = 0;
A_s = 1;
Ar_As = 0.8; % Echo amplitude scaling factor
h = 0.174; % Target distance in meters

% Time vector
t = 0:1/fs:5e-3; % 5 milliseconds duration

% Transmitted ultrasound signal equation
s_t = A_s * (t.^m) .* exp(-t/u) .* cos(2 * pi * fs * t + phi_s) .* (t >= 0);

% Computing the Time of Flight (ToF) for the given target distance
ToF = 2 * h / 343; % Speed of sound in air is approximately 343 m/s

% Received ultrasound signal with echo
r_t = s_t + Ar_As * circshift(s_t, [0, round(ToF * fs)]);

% Plot the original received signal
figure;
subplot(2,1,1);
plot(t, r_t);
title('Original Received Ultrasound Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Normalize the amplitude to [-1, 1]
r_t_normalized = r_t / max(abs(r_t));

% Plot the normalized received signal
subplot(2,1,2);
plot(t, r_t_normalized);
title('Normalized Received Ultrasound Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Adjust the axis limits for better visualization
%xlim([0, 5e-4]); % Adjust this based on your preference

% Display the plots
sgtitle('Received Ultrasound Signal and Normalized Signal');
