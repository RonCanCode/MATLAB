% Ron Guglielmone
% EE102 B - Signal Processing
% June 2, 2017
%
% Echo Cancellation
% Homework #8

% Task 1: Verifying Echo-Cancellation System

%                          y[n]
% x[n] ---> (+) ----------------------- (+) ---> z[n]
%            ^              |            ^           
%            |           [ Z^-n ]        |            
%            |              |            |           
%             ---< alpha |----| alpha >---           
%
% x[n] = inputSignal
% y[n] = x[n] + alpha*y[n-N]
% z[n] = y[n] - alpha*y[n-N]
% z[n] = x[n] = inputSignal

% Task 2: Echo Generation

fs = 8192;                           % sampling freq.
f = 400;                             % pulse freq.
Tdur = 0.2;                          % duration
n = 1:floor(fs*Tdur);
x = pulse(f,Tdur,fs);
% plot(n/fs,x); 
% xlabel('Time [s]'); 
% ylabel('Amplitude [0:1]');

% Zero Pad:
Tzp = 1;
Nzp = floor(fs*Tzp);
xzp = [x zeros(1,Nzp-length(x))];

% Generate Echos:
Tdel = 0.125;                        % echo delay [seconds]
alpha = -0.5;                        % echo gain
Ndel = floor(Tdel*fs);               % echo delay [samples]
a = [1 zeros(1,Ndel-1) -alpha];      % filter coeffs.
b = 1;                               % filter coeffs.
y = filter(b,a,xzp);                 % filtered output

% Plot:
figure(1);
plot(y); 
xlabel('Time [s]'); 
ylabel('Amplitude [0:1]');

% Task 3: Echo Cancelation

% Using diff eqn:
y1 = diffCancel(y, Ndel, Nzp, alpha);
figure(2);
plot(y1);
xlabel('Time [s]'); 
ylabel('Amplitude [0:1]');

% Using filter:
y2 = filter(a,b,y);
figure(3);
plot(y2);
xlabel('Time [s]'); 
ylabel('Amplitude [0:1]');

% Task 4: Error Effects:

% Perfect knowledge of N
% i.e. N(hat) = N

alpha = -0.45;
a2 = [1 zeros(1,Ndel-1) -alpha];
y3 = filter(a2,b,y);
figure(4);
plot(y3);
xlabel('Time [s]'); 
ylabel('Amplitude [0:1]');

% Perfect knowledge of alpha
% i.e. N = [1 2 10 20] samples error

error = [1 2 10 20];
Ndel = Ndel + error;
alpha = -0.5;
figure(5);

for i = 1 : length(error)
    
    a = [1 zeros(1,Ndel(i)-1) -alpha];
    b = 1;
    y = filter(b,a,xzp);
    subplot(4,1,i);
    plot(y);
    str = num2str(error(i));
    title(['Error = ' str ' Suppressed Signal']);
    
end