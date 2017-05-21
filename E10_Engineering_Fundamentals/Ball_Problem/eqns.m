function g = eqns(t,x)

% Input Values
Cd = 0.3;
P = 1.22; % kg/m^3 (air density)
K = .000007; % s^2/m (proportion constant)
W = 200; % rad/s (radial freq)
A = pi*3.750^2; % cm^2 (cross-sectional area)
M = (1.5/9.8); % kg (ball mass)

% Variables to solve for:
X = x(1); % position
Vx = x(2); % velocity
Y = x(3);
Vy = x(4);

% Forces:
Fdx = .5*(Cd*(.5*P)*(Vx^2)*A); % drag force
Fmx = (K*W*Vx*Cd); % magnum force

Fdy = -Cd*.5*P*(Vy^2)*A;
Fmy = .5*K*W*Vy*Cd;
Fg = 1.5; % N

% ODEs:
dVxdt = (Vx-Fdx-Fmx)/M; % m/s (velocity)
dXdt = X + Vx; % m (position)

dVydt = ((Vy + Fmy - Fdy - Fg)/M);
dYdt = Y + Vy;

g = [dXdt dVxdt dYdt dVydt]';
