%Extracting the envelope of the discrete-time signal, rcv[n] to avoid the
%possible errors introduced due to signal attenuation (and resulting in
%phase shift and frequeny shift)
% Given values
m = 2;
u = 3.6e-6;
Ar_As = 0.8; % Echo amplitude scaling factor
fs = 4e6;
h = 0.174;
ToF = 2 * h / 343; % Time of Flight (ToF) for the given target distance
T = 1/fs; % Sampling period

% Time vector for the discrete-time signal
n = 0:T:5e-3; % Assuming the same time vector as before

% Envelope formula
rcve = A_s * (n.^m) .* exp(-n/u) + Ar_As * (n - ToF/T).^m .* exp(-(n - ToF/T)/u);

% Extracted envelope of the discrete-time signal
rcve_discrete = rcv_discrete .* rcve;

% Plot the original discrete-time signal, its envelope, and the extracted envelope
figure;

subplot(3,1,1);
stem(n, rcv_discrete, 'Marker', 'o');
title('Discrete-Time Received Ultrasound Signal (rcv[n])');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(n, rcve, 'Marker', 'o');
title('Envelope of Discrete-Time Received Ultrasound Signal (rcve[n])');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(n, rcve_discrete, 'Marker', 'o');
title('Envelope Extracted from Discrete-Time Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Display the plots
sgtitle('Discrete-Time Received Ultrasound Signal and Extracted Envelope');
