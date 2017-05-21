function [ t,y ] = RK4( f, tspan, y0, h )
% FOURTH ORDER RUNGE-KUTTA
% Accepts:
%      -f, a function
%      -tspan, a vector of time
%      -y0, an initial condition
%      -h, the timestep
%      -beta, an input parameter
%      -gamma, another input parameter

t(1) = tspan(1);
y(1,:) = y0;
n = 1;

while t(n) < tspan(2)
    
    t(n+1) = t(n) + h;
    tm = t(n) + 0.5*h;
    k1 = f(t(n), y(n,:));
    k2 = f(tm, y(n,:) + 0.5*h*k1);
    k3 = f(tm, y(n,:) + 0.5*h*k2);
    k4 = f(t(n+1), y(n,:)+h*k3);
    y(n+1,:) = y(n,:) + (1/6)*h*(k1+2*k2+2*k3+k4);
    n = n+1;
    
    
end

end

