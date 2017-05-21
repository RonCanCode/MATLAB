% Main Function:
% CME 102 - Winter
% Ron Guglielmone
% Problem 5, set 5

close all
clear

% Initial Conditions:
beta = 0.00002; % [constant]
gamma = 1/14; % [inverse days]
S0 = 50000; % Initial Suceptible #
I0 = 2200; % Initial Infected #
R0 = 2500; % Initial Recovered #
tspan = [0 60]; % Time

[t,y] = RK4(@(t,y)ODEforEpidemic(t, y, beta, gamma),...
        tspan, [S0 I0 R0], 0.5);

hold on
plot(t,y(:,1),'--b');
plot(t, y(:,2),'-r');
plot(t, y(:,3),':k');
legend('Suceptible', 'Infected', 'Recovered');
title('Recovery to 10 Days Beta/2');
xlabel('Time in Days');
ylabel('Number of People');

