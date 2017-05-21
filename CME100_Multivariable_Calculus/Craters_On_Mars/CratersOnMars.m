% CME 100, PSET 4
% Problem 2
%
% Name: Ron Guglielmone

% Data:
diametersL = [32 45 64 90];
recpDiam = [ 0.001 0.0005 0.00024 0.000123];
x = [0.001 0.0005 0.00024 0.000123];
y = [51 22 14 4];

% Curve for Fit:
m = ((x(1)+x(2)+x(3)+x(4)) *...
    (y(1)+y(2)+y(3)+y(4)) -...
    (4*((x(1)*y(1))+(x(2)*y(2))+...
    (x(3)*y(3))+(x(4)*y(4))))) /...
    (((x(1)+x(2)+x(3)+x(4))^2) -...
    4*((x(1)^2)+(x(2)^2)+(x(3)^2)+(x(4)^2)));

b = (1/4) * ((y(1) + y(2) + y(3) + y(4))...
    - m * ((x(1) + x(2) + x(3) + x(4))));

yfit = m*x + b;

% Plot:
plot(recpDiam, y, '*');
hold on;
plot(recpDiam, yfit);
legend('Data Points', 'Fit Line');
title('Astroids on Mars');
xlabel('Diameter [km]');
ylabel('Frequency');  

