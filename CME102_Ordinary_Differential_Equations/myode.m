% Stores an ODE for Problem 3, Set 4
% CME 102 - Stanford - Winter 2016

function yprime = bugOde(t,y)

% Constants:
R = 0.5;  % Constant
Q = 8;    % Constant

if y > 0
    yprime = -((r0^2) * ((2*g)^(1/2))) / ...
        (2 * R * (y^(1/2)) - (y^(3/2)));
    
elseif y < 0
    yprime = 0;
end

end



