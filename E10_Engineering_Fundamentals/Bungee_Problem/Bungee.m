% Initial Conditions:
to = 0; % s - initial time.
tmax = 5; % s - maximum time.
x0 = 0; % m - initial displacement.
v0 = 0; % m/s - initial velocity.

% Initial Conditions Vector
zo=[x0 v0]; 

% ODE Solver Call:
[t,z] = ode45('eqns',[to,tmax],zo);

% Graph Output:
figure;
plot (t,z(:,1),'b-');
title ('Displacement');
xlabel ('Time');
ylabel ('Meters');

figure;
plot(t,z(:,2),'r-');
title ('Velocity');
xlabel ('Time');
ylabel ('Meters');

