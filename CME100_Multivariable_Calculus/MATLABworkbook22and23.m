% Author: Ron Guglielmone
% Language: MATLAB R2015
% Date: Fall 2015
%
% Course: CME100
% School: Stanford University
% Problem Set X, Problem No. X
%
% Description: X

% Matlab Workbook - Problem Set 8
% Exercise 22
% Part a
% Result of the integral analytically = 10/3

% Part b:
x = 0:0.01:2;
y = x.^2+(x+1).^-2
I = trapz(x,y)
I = 3.3334

% Part c:
x = 0:0.2:2;
y = x.^2+(x+1).^-2
I = trapz(x,y)
I =
    3.3530
% My conclusion is that the smaller the increment, the more accurate the answer.

% Exercise 23

% Parameters:
G = 1350;
A = 8;
c = 3*10^8;
% Orbit:
t = 0:0.001:pi/2;
% Ellipse:
a = 1.5*10^11; 
b = 1.3*10^11;
c = 10^9;
% Parametric curve:
x = a*cos(t); 
y = b*sin(t);
z = c*cos(t);
% Velocity:
velx = gradient(x,0.001); 
vely = gradient(y,0.001);
velz = gradient(z,0.001);
% Velocity Magnitude:
velmag = sqrt(velx.^2+vely.^2+velz.^2);
% Acceleration:
accx = gradient(velx,0.001); 
accy = gradient(vely,0.001);
accz = gradient(velz,0.001);
% Acceleration Magnitude:
accmag = sqrt(accx.^2+accy.^2+accz.^2);
% Force Due to Solar Radiations:
f = -1/c*G*A;
% Tangential Force:
costheta = (velx.*accx+vely.*accy+velz.*accz)./velmag./accmag;
% Work:
W = trapz(f*velmag.*costheta,t)
W = 2.1362e+05
