function yprime = ODEforPendulum(t, y, m, l, g, mu)

% yprime(1) is DS/dt
% yprime(2) is DI/dt
% yprime(3) is DR/dt

yprime(1) = y(2);
yprime(2) = (-mu*g*cos(y(1))*y(2) - g*sin(y(1)))/l;
end




