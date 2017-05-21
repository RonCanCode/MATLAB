% Ron Guglielmone
% CME 102, Winter '15-16
% Stanford University
%
% Problem Set 1, #6
% Plot ODE:
% y' = (y^2 - 4)(y + 1)^2;

% Create x-cordinates:
t_points = linspace(0,3,30);
% Create y-cordinates:
y_points = linspace(-3,3,30);
% Create 2-D grid:
[T,y] = meshgrid(t_points,y_points);
% Size of grid:
s = size(T);
% X-component of vectors:
v_t = ones(s);
% Y-component of vectors:
v_y = 4.*T.*y.^3;
% Plot using quiver:
quiver(T,y,v_t,v_y,1.,'k', 'Linewidth', 1.25)
% Label plot:
title('Quiver Plot of dy = (y^2 - 4)(y + 1)^2');
xlabel('x values');
ylabel('y values');


