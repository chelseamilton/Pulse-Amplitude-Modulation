clc;
clear all;
close all;

A = 5;
f = 1;
T = 1;
fs = 200;
ts = 1/fs;
t = 0:ts:T;

Sam_inst = ones(1, length(t));
subplot(3, 1, 1);
stem(t, Sam_inst);
title('Impulse Signal');
ylabel('Amplitude ---->');
xlabel('Time ---->');
ylim([0 A]);
grid on;

x = A*sin(2*pi*f*t);
subplot(3, 1, 2);
plot(t, x);
title('Sine Waveform');
ylabel('Amplitude ---->');
xlabel('Time ---->');
grid on;

PAM = Sam_inst.*x;
subplot(3, 1, 3);
stem(t, PAM);
title('Pulse Modulated Wave - Impulse or Natural Sampling');
xlabel('Time ----->');
ylabel('Amplitude ----->');
grid on;
%%

pulses = [ones(1, 3), zeros(1, 3)];
puls = [];
pulseflat = [];
it = 6;
for k = 0:it:length(t) - it
    PAM_1(k + 1:k + it) = x(k + 1:k + it).*pulses;
    puls = [puls pulses];
    pulseflat = [pulseflat mean(x(k + 1:k + it)).*pulses];
end

figure; 
subplot(4, 1, 1); 
plot(t, x);
title('Sine Waveform');
ylabel('Amplitude ---->');
xlabel('Time ---->');
grid on;

subplot(4, 1, 2);
bar(puls)
title('Pulse Waveform');
ylabel('Amplitude ---->');
xlabel('Time ---->');
ylim([0 A]);
grid on;

subplot(4, 1, 3);
bar(PAM_1)
title('Pulse Amplitude Waveform');
ylabel('Amplitude ---->');
xlabel('Time ---->');
grid on;


subplot(4, 1, 4);
bar(pulseflat)
title('Pulse Flat Top Waveform');
ylabel('Amplitude ---->');
xlabel('Time ---->');
grid on;

