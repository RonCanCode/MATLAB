% Ron Guglielmone
% Problem Set #2
%
% EE102B - StamFurd University
% April 21, 2017
%
% Reconstructing Sampled Signals

% TASK 1: Reduction Towards Nyquist

% Define constants:
fs = 500;
f = 5;
dt = 1/fs;
dur = 1;
t = 0:dt:dur;
x = cos(2*pi*f*t);

% Case 1 (m=10):
m = 10;
subplot(4,1,1);
stem(t(1:m:end), x(1:m:end));
hold on;
plot(t,x,'--');
title('Sampled Cos, m = 10');
xlabel('Time');
ylabel('Amplitude');

% Case 1 (m=20):
m = 20;
subplot(4,1,2);
stem(t(1:m:end), x(1:m:end));
hold on;
plot(t,x,'--');
title('Sampled Cos, m = 20');
xlabel('Time');
ylabel('Amplitude');

% Case 1 (m=30):
m = 30;
subplot(4,1,3);
stem(t(1:m:end), x(1:m:end));
hold on;
plot(t,x,'--');
title('Sampled Cos, m = 30');
xlabel('Time');
ylabel('Amplitude');

% Case 1 (m=50):
m = 50;
subplot(4,1,4);
stem(t(1:m:end), x(1:m:end));
hold on;
plot(t,x,'--');
title('Sampled Cos, m = 50');
xlabel('Time');
ylabel('Amplitude');

% TASK 2:

% Define constants:
fs = 8192;
f = 200;
dt = 1/fs;
dur = 1;
t = 0:dt:dur - dt;
xh = cos(2*pi*f*t);

% sound(xh/max(abs(xh)),fs);
% plot(xh);

x = xh(1:8:end);

% Task 2 - Part 1:

stem(t(1:8:256),x(1:32));
hold on;
plot(t(1:256),xh(1:256),'--');
title('Signal x - Every 8th Sample');
xlabel('Time [samples]')
ylabel('Amplitude [0 - 1]');

% Task 2 - Part 2:

x0 = zeros(1, 8192);
x0(1:8:8192) = x;
figure;
stem(t(1:256), x0(1:256));
title('Zero Insertion');
xlabel('Time [samples]')
ylabel('Amplitude [0 - 1]');

% Task 2 - Part 3:

f1 = ones(8,1);
x1 = conv(x0,f1);
figure;
stem(t(1:256), x1(1:256));
hold on;
plot(t(1:256), xh(1:256), '--');
title('Zero-Order Hold');
xlabel('Time [samples]')
ylabel('Amplitude [0 - 1]');

% Task 2 - Part 4:

f2 = (1:15)/8;
f2(9:15) = flip(f2(1:7));
x2 = conv(x0,f2);
figure;
stem(t(1:256), x2(1+8:256+8));
hold on;
plot(t(1:256), xh(1:256),'--');
title('Linear Interpolation');
xlabel('Time [samples]')
ylabel('Amplitude [0 - 1]');

% Task 2 - Part 5:

f3 = sin(pi*1024*(-16:16)/8192+eps)./...
    (pi*1024*(-16:16)/8192+eps);
f3w = f3.*hann(length(f3)).';
x3 = conv(x0,f3w);

figure;
stem(t(1:256), x3(1+16:256+16));
hold on;
plot(t(1:256), xh(1:256), '--');
title('Hann Windowed Sinc');
xlabel('Time [samples]')
ylabel('Amplitude [0 - 1]');

% Task 2 - Part 6:

f4 = sin(pi*1024*(-32:32)/8192+eps)./...
    (pi*1024*(-32:32)/8192+eps);
f4w = f4.*hann(length(f4)).';
x4 = conv(x0,f4w);

figure;
stem(t(1:256), x4(1+32:256+32));
hold on;
plot(t(1:256), xh(1:256), '--');
title('Longer Hann Windowed Sinc');
xlabel('Time [samples]')
ylabel('Amplitude [0 - 1]');

% Task 2 - Part 7:

figure;

subplot(3,1,1);
plot(t(1:256), xh(1+256:256+256)...
    - x4(1+256+32:256+256+32));
title('Long Hann Window Error');
xlabel('Time [samples]')
ylabel('Error');

subplot(3,1,2);
plot(t(1:256), xh(1+256:256+256)...
    - x3(1+256+16:256+256+16));
title('Short Hann Window Error');
xlabel('Time [samples]')
ylabel('Error');

subplot(3,1,3);
plot(t(1:256), xh(1+256:256+256)...
    - x2(1+256+8:256+256+8));
title('Long Window Error');
xlabel('Time [samples]')
ylabel('Error');