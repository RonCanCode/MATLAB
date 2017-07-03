% Author: Ron Guglielmone
% Language: MATLAB R2015
% Date: Fall 2015
%
% Course: CME100
% School: Stanford University
% Problem Set X, Problem No. X
%
% Description: X

clear

% Parameters:
E0 = 3;
Is = 7*10^-14;
R = 200;
C = 0.026;

% Initial Guess:
Vdiode = 1;

% Storage:
lastVdiode = 77;
iterations = 0;

while lastVdiode - Vdiode > 0.000001
    
    fprime = -1 - Is * R/C * exp(Vdiode/C);
    f = E0 - Vdiode - Is * R * (exp(Vdiode/C) - 1);
    lastVdiode = Vdiode;
    Vdiode = Vdiode - f/fprime;
    iterations = iterations + 1;
end

% Display Solution:
I = Is*(exp(Vdiode/C) - 1);
Vdiode
I
iterations


