

% Plot Output Spectrum of Switched-Capacitor Circuit as a sampler for ADCs


%%
clc;
clear;
close all;

%% Input Signal Parameters

Data = importdata('output voltage.txt');      % Output Voltage Which have get from Simulation in Hspice
samples=(Data(:,2));                          % Select Output Voltage
N=8192;                                       % Number of FFT point
Ts=10e-9;                                     % Sampling Period
Fs=1/Ts;                                      % Sampling Frequency
A = 0.5;                                      % Common Mode of Input Signal

%% Calculate Dynamic Parameters(SNR,SNDR,SFDR,ENOB)

s=abs(fft(samples));                          % Fourier of Output Voltages
s=s(1:N/2)/ N / A * 2;                        % Plot Half of Output Specturm

output_noise = s;
output_noise(output_noise==max(output_noise))=[];
 
sndr=10*log10(max(s)^2/(sum(output_noise.^2)));
sfdr=10*log10(max(s)^2/max(output_noise)^2);

%% Plot Output Spectrum in Frequency Domain (SFDR,ENOB)

figure(1);
f=(0:N/2-1)/N;
s = 20*log10(s);
plot(f,s)
grid on
xlabel('Frequency[fin/fs]');
ylabel('DFT Magnitude [dbfs]');
title('Output spectrum');

fprintf('SNDR=%g dB\n',sndr)
fprintf('SFDR=%g dB\n',sfdr)

