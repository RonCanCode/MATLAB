% Initial Conditions:
X0 = 0; % m (position)
Vx0 = .5*50; % m/s (velocity)
Y0 = 0;
Vy0 = .5*50;

% Time Window:
t0 = 0;
tmax = 500;

% Solve for:
xo=[X0 Vx0 Y0 Vy0];

% Call ODE:
[t,x]=ode45('eqns',[t0,tmax],xo);

% Graph:
figure;
plot(t,x(:,1),'b-');
title('X-Position');
xlabel('Time');
ylabel('Meters');

figure;
plot(t,x(:,2),'b-');
title('X-Velocity');
xlabel('Time');
ylabel('Meters / Sec');

figure;
plot(t,x(:,3),'b-');
title('Y-Position');
xlabel('Time');
ylabel('Meters');

figure;
plot(t,x(:,4),'b-');
title('Y-Velocity');
xlabel('Time');
ylabel('Meters / Sec');


