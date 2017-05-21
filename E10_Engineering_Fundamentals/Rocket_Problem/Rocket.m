% Input Values
Md = 730000; % kg (dry mass)
Mp = 2100000; % kg (propellant mass)

% Initial Conditions:
Y0 = 0; % m (position)
M0 = Md + Mp; % kg (mass)
V0 = 0; % m/s (velocity)

% Time Window:
t0 = 0;
tmax = 350;

% Solve for X0, v0, and M0:
zo=[Y0 M0 V0]; 

% Call ODE:
[t,z]=ode45('eqns',[t0,tmax],zo);

% Graph:
figure;
plot(t,z(:,1),'b-');
title('Altitude');
xlabel('Time');
ylabel('Meters');

figure;
plot(t,z(:,2),'r-');
title('Mass');
xlabel('Time');
ylabel('Kg');

figure;
plot(t,z(:,3),'g-');
title('Velocity');
xlabel('Time');
ylabel('meters / sec');

