% Traces the path of a point P along the
% circumference of a circle of radius a = 1
% as a function of the angle t for 0 < t < 4pi

% Variables:
a = 1;
t0 = 0;
tmax = 4*pi;

% Timespan:
t = linspace (t0, tmax, 100);

% Parametric Equations:
x = a*(t - sin(t));
y = a*(1 - cos(t));

figure;
plot(x, y);
title('Cycloid Parameterization');
xlabel('X-Position');
ylabel('Y-Position');
