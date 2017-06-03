% Ron Guglielmone
% EE102 B - Signal Processing
% May 5, 2017
%
% FIR Filters and DFT Convolution
% Homework # 4

% Task 1: Generate a Chirp

fs = 8192;                  % Sampling rate
T = 1/fs;                   % Sampling period
tmax = 4;                   % Time duration
N = fs*tmax;                % Sample duration
fmax = 4096;                % max freq.
k = fmax/2/tmax;            % chirp coeffs
nx = 0:N-1;                 % DT indices
x = cos(2*pi*k*(nx*T).^2);  % signal

% Plot the signal
% plot(nx*T,x);
% sound(x,fs)

% The signal sounds like an upward sweeping
% simple sinusoid...

% Task 2: Design an FIR BP Filter

% Given parameters:
f1 = 1024;                 % lower cut-freq
f2 = 2048;                 % upper cut-freq
M = 128;                   % length of h[n]
w1 = boxcar(M+1);          % first window f(n)
w2 = hanning(M+1);         % second window f(n)
nha = -M/2:M/2;            % non-causal indicies
nhc = 0:M;                 % causal indicies

% Design hw filter:
filter = ((2*pi*(f1/fs)) - (2*pi*(f2/fs)))/...
    pi*cos(((2*pi*(f1/fs)) + (2*pi*(f2/fs)))/...
    2*nha).*sinc(((2*pi*(f1/fs)) - (2*pi*(f2/fs))*...
    nha/2/pi));

% Window it:
windowedFilter1 = filter.*w1';
windowedFilter2 = filter.*w2';
hw1 = windowedFilter1;
hw2 = windowedFilter2;

% Plot the filters:
plot(nhc*T,hw1);
hold on
plot(nhc*T,hw2);
legend('Boxcar Window','Hanning Window');

% The hanning filter has a shorter impulse
% response.

% Compute H(z) for both:
H1 = fftshift(fft(hw1,12*M));
H2 = fftshift(fft(hw2,12*M));

% Visualize Magnitude Response:
% fvtool(H1);
% fvtool(H2);

% The hanning filter seems to have less energy
% in its magnitude frequency response.

% Task 3: Filter Chirp

ydirect = conv(x,hw2);
ny = 0:N+M-1;
figure(2)
plot(ny*T,ydirect);

% The hanning window results in a smoother
% looking signal.

% Task 4: do the same with DFT based conv

ydirect2 = ifft(fft(x,N+M).*fft(hw1,N+M));
