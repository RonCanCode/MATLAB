% Ron Guglielmone
% EE102 B - Signal Processing
% May 19, 2017
%
% Touch-Tone Dialing Signals
% Homework # 5

% TASK 1: Generate a DTMF Signal
% (Dual-Tone, Multi-Frequency)

clear all;
close all;

% Given:
phone_number = [3 1 0 6 9 4 7 7 8 5];
fs = 8192;

% Call helper f( ):
outputSignal = ttdial_hw5(phone_number);

% Listen to output:
sound(outputSignal,fs);

% Look at output:
plot(outputSignal);

% TASK 2: Use DFT To Estimate Freqs:

% Given:
phone_number = [5];
outputSignal = ttdial_hw5(phone_number);
N = length(outputSignal);
f = [0:fs/N:fs*(N-1)/N];
plot(f,abs(fft(outputSignal))/N);
axis([500 1500 0 1]);

% TASK 3: Build a Filter Bank:

h = hamming(256)';
f = [0:255]*fs/256;
l1 = length(h);
delta = 1023 - l1 + 1;
hp = zeropadwin_hw5(h,delta);
fp = [0:1023]*fs/1024;
plot(fp,abs(fft(hp))/1024);
axis([0 200 0 1]);

% 74 Hz is supressed to 0.0007 * Initial Amp.
% In dB that is approximately -63 dB.

