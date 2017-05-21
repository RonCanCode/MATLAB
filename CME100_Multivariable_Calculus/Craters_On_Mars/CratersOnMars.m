% Author: Ron Guglielmone
% Language: MATLAB R2015
% Date:  Fall 2015
%
% Course: CME100
% School: Stanford University
% Problem Set 4, Problem No. 2
%
% Description:  Fits a line to data
% points that describe the size of craters
% on mars in terms of their diameters.

% Data:
diametersL = [32 45 64 90]; % [m]
recpDiam = [ 0.001 0.0005 0.00024 0.000123]; % [1/m]
x = [0.001 0.0005 0.00024 0.000123];
y = [51 22 14 4];

% Slope for fit:
m = ((x(1)+x(2)+x(3)+x(4)) *...
    (y(1)+y(2)+y(3)+y(4)) -...
    (4*((x(1)*y(1))+(x(2)*y(2))+...
    (x(3)*y(3))+(x(4)*y(4))))) /...
    (((x(1)+x(2)+x(3)+x(4))^2) -...
    4*((x(1)^2)+(x(2)^2)+(x(3)^2)+(x(4)^2)));

% Y-intercept for fit:
b = (1/4) * ((y(1) + y(2) + y(3) + y(4))...
    - m * ((x(1) + x(2) + x(3) + x(4))));

% Line formula:
yfit = m*x + b;

% Plot:
plot(recpDiam, y, '*');
hold on;
plot(recpDiam, yfit);
legend('Data Points', 'Fit Line');
title('Astroids on Mars');
xlabel('Diameter [km]');
ylabel('Frequency');  

