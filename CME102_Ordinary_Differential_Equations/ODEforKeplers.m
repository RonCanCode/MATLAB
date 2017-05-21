function yprime = ODEforKeplers(t, y)


yprime = zeros(4,1);
yprime(1) = y(3);
yprime(2) = y(4);
yprime(3) = -y(1)*(((y(1))^2) + ((y(2))^2))^(-3/2);
yprime(4) = -y(2)*(((y(1))^2) + ((y(2))^2))^(-3/2);

end






