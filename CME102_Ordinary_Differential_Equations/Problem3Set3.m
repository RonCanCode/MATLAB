% Problem 3 Set 3
% CME 102 - Stanford
%
% Ron Guglielmone
% MAIN FUNCTION:

ti = 0;
tf = 50;
y0 = 0.5; % [m]
steps = 1000;
[timespan] = linspace(ti, tf, steps);
[T,Y] = ode45(@myode, timespan,y0); 

% Calculate Time to Drain:
n_empty = length(find(Y>0));
time_to_drain = n_empty * tf / steps

plot(T,Y)
title('Water Level vs. Time')
xlabel('Time [s]')
ylabel('Water Level [m]')


