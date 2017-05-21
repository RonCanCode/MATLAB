% Promblem Set 8 - #1
% Stanford, CME 100, Fall 2015
%
% Ron Guglielmone

% First Case:
C = 3000;
n = 3.0;

% Parameter g:
g = 0:0.001:1;

% Air Density [kg/m.^3]:
% p = 1.2 * exp(-y(0)/8000);

% Create Vectors:
t = zeros(length(g), 1);
x = zeros(length(g), 1);
y = zeros(length(g), 1);

% Generate Trajectories:
for i = 1 : length(g)
    
    % Parametric Equations:
    t(i) = (0.1) * C * (((g(i).^(n-1))/(n-1)) + ((g(i).^(n+1))/(n+1)));
    x(i) = (0.2) * C.^2 * (((g(i).^(2*n-1)/(2*n-1)) + ((g(i).^(2*n+1))/(2*n+1))));
    y(i) = (0.1) * C.^2 * (((g(i).^(2*n-2)/(2*n-2)) - ((g(i).^(2*n+2))/(2*n+2))));
    
    % Air Density [kg/m.^3]:
    p = 1.2 * exp(-y(i)/8000);
end

plot(x,y);
legend('Trial 1');
hold on

% Second Case:
C = 2775;
n = 2.8;

% Third Case:
C = 2545;
n = 2.6;

% Air Density [kg/m.^3]:
p = 1.2 * exp(-y(i - 1)/8000);
% Drag Coefficient:
Cd = 0.2;
% Cross-Section Area [m.^2]:
A = 2;
% Drag Force:
Fd = (1/2) * p * velocity.^2 * A * Cd;