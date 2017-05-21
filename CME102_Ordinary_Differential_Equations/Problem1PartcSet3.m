% CME 102 - Stanford
% Winter 2016
% PSET 3
%
% Ron Guglielmone

close all
clear

% Vector with h-values:
h = [0.25 0.10 0.05 0.025 0.0125];
% Initial Conditions:
t0 = 0; tf = 2.5; y0 = 0;
% Global Errors:
error = zeros(length(h));

% Cycle through h:
for i = 1 : length(h)
    z = h(i);
    n = 1;
    y(1) = y0;
    t(1) = t0;
    
    % Backwards Euler:
    while t(n) < tf
        t(n+1) = t(n) + z;
        y(n+1) = (y(n) + z*((t(n+1))^3) + ...
            (3*(t(n+1))^2) + (6*t(n+1)) + 6 - ...
            (6*exp(t(n+1))));
        n = n + 1;
        
    end
    
    % Exact Solution:
    why = (t.^3) + (3.*t.^2) + (6.*t) + 6 - (6.*exp(t));
    
    error(i) = norm(y - why) / sqrt (length(t));
end

% Plot Results:
loglog(h,error)
title('LogLog Plot of Global Error vs. h')
xlabel('h vale')
ylabel('error(h)')

