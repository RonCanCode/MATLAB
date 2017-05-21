function yprime = ODEforEpidemic ( t, y, beta, gamma)

% yprime(1) is DS/dt
% yprime(2) is DI/dt
% yprime(3) is DR/dt

yprime(1) = -beta*y(1)*y(2);
yprime(2) = beta*y(1)*y(2) - gamma*y(2);
yprime(3) = gamma*y(2);


end




