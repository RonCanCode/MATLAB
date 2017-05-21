% Globals:
global a b c

% Constants:
a = 1;
b = .001;
c = .5

% Initial Time:
to = 1;

% Maximum Time:
tmax = 69999;
nQo = 0;

% Initial Conditions Vector:
zo = [nQo];

% Calling statement for ode solver:
[t,z] = ode45('eqns',[to,tmax],zo);

% This section does all of the plotting...
figure(1)

plot(t,z(:,1),'r-');
xlabel('time');
ylabel('people');
