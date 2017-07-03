% Author: Ron Guglielmone
% Language: MATLAB R2015
% Date: Fall 2015
%
% Course: CME100
% School: Stanford University
% Problem Set X, Problem No. X
%
% Description: X

% Time Step:
dt = 0.1;
t = 0:dt:2*pi;

% Vectors:
x = cos(t);
y = 2.*sin(t);
z = t;

% Plot Trajectory:
plot3(x,y,z);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');

% Compute Velocity:
Vx = gradient(x, dt);
Vy = gradient(y, dt);

% Speed:
speed = sqrt(Vx.^2 + Vy.^2);

% Component Accel:
Ax = gradient(Vx, dt);
Ay = gradient(Vy, dt);

% Sum Accel:
acceleration = sqrt(Ax.^2 + Ay.^2);

% Unit Tangent:
Tx = Vx./speed;
Ty = Vy./speed;

% Angle:
theta = acos((Vx.*Ax+Vy.*Ay)./speed./acceleration);

