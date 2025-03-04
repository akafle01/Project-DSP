% 1.1: Generate the transmitted ulltrasound signal given by the equation on MATLAB
% Parameters
m = 2;
fs = 550e3;
u = 3.6e-6;
phi_s = 0;
A_s = 1;

% Time vector
t = 0:1/fs:5e-3; % 5 milliseconds duration

% Transmitted ultrasound signal
s_t = A_s * (t.^m) .* exp(-t/u) .* cos(2 * pi * fs * t + phi_s) .* (t >= 0);

% Plot the original transmitted signal
figure;
subplot(2,1,1);
plot(t, s_t);
title('Original Transmitted Ultrasound Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Normalize the amplitude to [-1, 1]
s_t_normalized = s_t / max(abs(s_t));

% Plot the normalized transmitted signal
subplot(2,1,2);
plot(t, s_t_normalized);
title('Normalized Transmitted Ultrasound Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Display the plots
sgtitle('Transmitted Ultrasound Signal and Normalized Signal');
