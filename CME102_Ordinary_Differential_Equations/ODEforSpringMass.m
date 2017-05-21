function yprime = ODEforSpringMass(t, y)

Y0 = 1;
gamma = 30;
m1 = 1.5;
m2 = 0.3;
k1 = 600;
k2 = 120;
beta = 5.0;

yprime = zeros(4,1);
yprime(1) = y(3);
yprime(2) = y(4);
yprime(3) = (beta/m1)*Y0*gamma*cos(gamma*t) + ...
            (k1/m1)*Y0*sin(gamma*t) - ...
            (beta/m1)*y(3) - ...
            ((k1 + k2)/m1)*y(1) + ...
            (k2/m1)*y(2);
yprime(4) = -(k2/m2)*y(2) + ...
            (k2/m2)*y(1);

end






