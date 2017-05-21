function g = eqns(t,z)

% Initial Conditions:
Xo = z(1);
Vo = z(2);

% Variables:
gravity = 9.8; % m/s/s - gravity acceleration.
V = Vo; % m/s - person velocity.
M = 70; % kg - person weight.
F1 = 500; % N - coefficient.
k0 = 1; % 1/m - spring constant
k1 = 50; % 1/m - spring constant.
L = 10; % m - rope loose length.
x = Xo; % m - displacement.

% Forces:
ropeForce = (F1*(1-exp(-1*k0*(x-L))) + k1*(x-L));
fallForce = (M*gravity);

% Differentials:
if x < 10
    dXdt = 0.5*(gravity*t^2);
    dVdt = gravity*t;

else 
    dXdt = V;
    dVdt = (fallForce - ropeForce)/M;
end

% Final Output:
g = [dXdt dVdt]';

