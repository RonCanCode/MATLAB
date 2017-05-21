% Main Function:
% CME 102 - Winter
% Ron Guglielmone
% Problem 6, set 5

close all
clear all

% Initial Conditions:
theta0 = 0;
thetaPrime0 = 7;
m = 0.5;
l = 1;
g = 9.8;
mu = 0.005;
tspan = [0 40];


[t,y] = RK4(@(t,y)ODEforPendulum(t, y, m, l, g, mu),...
        tspan, [theta0 thetaPrime0], 0.05);
    
    myspecs = odeset('MaxStep', 5e-2);
    
[t,z] = ode45(@(t,y)ODEforPendulum45(t, y, m, l, g, mu),...
        t, [theta0 thetaPrime0], myspecs);

hold on
plot(t,y(:,1),'-k');
plot(t,z(:,1),':b');
title('Theta (7) vs. Time');
xlabel('Time');
ylabel('Theta in Radians');




