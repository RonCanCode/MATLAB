% Ron Guglielmone
% Problem Set #1
%
% EE102B - StamFurd University
% April 14, 2017
%
% Quadrature Amplitude Modulation

% Define constants:
deltat = 50e-12;
T = 10*10^(-9);
Tmax = 10*T-deltat;
t = 0:deltat:Tmax;
wc = 2*pi*2*(10^9);
wn = 2*pi*150*(10^6);
c = 1/sqrt(2);

% PART A:

% Define binary data strings:
b1 = [0 1 1 0 1 0 0 1 1 0];
b2 = [1 0 0 1 1 0 0 1 0 1];

% Compute message signals m1(t) and m2(t):
m1 = reshape(kron(2*b1-1,ones(1,round(T/deltat)).'),...
    1,length(b1)*round(T/deltat));
m2 = reshape(kron(2*b2-1,ones(1,round(T/deltat)).'),...
    1,length(b2)*round(T/deltat));

Plot the signals:
plot(t,m1,'o',t,m2,'-');
legend('m1', 'm2');
xlabel('Time [seconds]');
ylabel('Amplitude [binary]');
title('Component Signals: m1 and m2');
axis([0 Tmax -1.5 1.5])

% PART B:

s = m1.*(cos(wc*t)) + m2.*(sin(wc*t));
plot(t, s);
xlabel('Time [seconds]');
ylabel('Amplitude [binary]');
title('Full Signal: s');
axis([0 Tmax -1.5 1.5])

% PART C:

v1 = s.*cos(wc*t );
v2 = s.*sin(wc*t);
plot(t, v1, t, v2);
xlabel('Time [seconds]');
ylabel('Amplitude [binary]');
title('Separate Signals v1 and v2');
axis([0 Tmax -1.5 1.5])

% PART D:

time = -1/wn : deltat : 15/wn;

% Compute h(t):
h = (wn/sqrt(1-c^2))*exp(-c*wn*time).*...
    sin(wn*time*sqrt(1-c^2)).*...
    heaviside(time);

% Compute y(t) using conv:
y1 = deltat*conv(v1,h);
y2 = deltat*conv(v2,h);

% Plot:
plot(y1);
hold on;
plot(y2);
xlabel('Time [seconds]');
ylabel('Amplitude');
title('Separate Signals y1 and y2');

% Repeat with phase shifts:
theta1 = pi/4;
theta2 = pi/2;
v1 = s.*cos(wc*t + theta %1 or 2);
v2 = s.*sin(wc*t + theta %1 or 2);
h = (wn/sqrt(1-c^2))*exp(-c*wn*time).*...
    sin(wn*time*sqrt(1-c^2)).*...
    heaviside(time);
y1 = deltat*conv(v1,h);
y2 = deltat*conv(v2,h);
plot(y1);
hold on;
plot(y2);
xlabel('Time [seconds]');
ylabel('Amplitude');
title('With _____ Phase Shift');