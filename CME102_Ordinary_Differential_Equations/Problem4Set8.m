% Main Function:
% CME 102 - Winter
% Ron Guglielmone
% Problem 4, Set 8

close all
clear all

% Initial Conditions:
tspan = [0 8];
x1i = 0;
x2i = 0;
x1primei = 0;
x2primei = 0;

[t,z] = ode45(@ODEforSpringMass,...
        tspan, [x1i x2i x1primei x2primei]);

plot(t,z(:,1), t,z(:,2));

title('Position vs Time (K2 = 202.8)');
xlabel('Time');
ylabel('Position');
legend('Mass 1', 'Mass 2');

