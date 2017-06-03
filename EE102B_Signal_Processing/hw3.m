% Ron Guglielmone
% Problem Set #3
%
% EE102B - StamFurd University
% April 28, 2017
%
% Effects of Windowing - Problem 5

clear all;
close all;

% Constants:
T0 = 1;               % period
t0 = 0;               % delay
tau = 0.5*T0;         % pulse width
omega0 = 2*pi;        % fund. freq.
deltat = T0/1000;     % dt
t = -T0:deltat:T0;    % time vec.
K = 128;              % 2K + 1 FS terms
m = -K:K;             % symmetric      
omega = m*omega0;     % freq vec.

% PART A: Plot w/ Xwind and hamming()

hammer = hamming(2*K+1);
boxer = rectwin(2*K+1);
% Hsig = sinc(time);
% hammingX = Hsig.*hammer';
% boxerX = ifft(Hsig*boxer);
% plot(time,fftshift(ifft(Hsig)))

% FS Coeffs:
a = tau/T0*sinc(m*tau/T0);

% Dynamic variables:
t0 = 0;
% t0 = (1/4)*T0;
% d0 = 0;
% d0 = 10^(-4);
 d0 = -10^(-4);
H = exp(-1i*(-m*omega0*t0 + d0*(m*omega0).^2));

% Pre-allocate for speed:
x = zeros(size(t));

% Calculate expansion:
for i = 1 : m;
    x = x + boxer(i+K+1)*H(i+K+1)...
        *a(i+K+1)*exp(-1i*omega(i+K+1)*t);
end

% Plot:
plot(t,x);
plot(m,unwrap(angle(H)));