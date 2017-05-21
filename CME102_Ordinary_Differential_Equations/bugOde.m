% Stores an ODE for Problem 3, Set 4
% CME 102 - Stanford - Winter 2016

function yprime = bugOde(t,u)

% Constants:
R = 0.5;  % Constant
Q = 8;    % Constant

if u > 0
    yprime = R*u*(1 - u/Q) - (u^2/(1 + u^2));
    
elseif u < 0
    yprime = 0;
end

end
