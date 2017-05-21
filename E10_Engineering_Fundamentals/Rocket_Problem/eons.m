function g = eqns(t,z)

% Input Values
T = 37000000; % N (thrust)
g = 9.8; % m/s/s (acceleration due to gravity)
P0 = 1.2; % kg/m^3 (density)
Cd = 0.0075; % (drag coefficient)
As = pi*10*110; % Surface area (pi*D*H)
Vj = 3528; % m/s (velocity of jet)

% Variables to solve for:
Y = z(1); % position
M = z(2); % mass
V = z(3); % velocity

% Forces:
Fd = .5*(P0)*Cd*As*(V^2)*exp(-Y/7300); % N (drag force)
Fg = g*M; % N (gravitational pull)

% ODEs:
dYdt = V;

if M > 730000;
dMdt = (-1*T/Vj);
else
dMdt = 0;
end

if M > 730000;
dVdt = (T-Fd-(Fg)-((T/Vj)*V))/M;
else
dVdt = (-Fd-(Fg)-((T/Vj)*V))/M;
end 

g = [dYdt dMdt dVdt]';

