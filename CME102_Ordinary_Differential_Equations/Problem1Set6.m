% Main Function:
% CME 102 - Winter
% Ron Guglielmone
% Problem 1, Set 6

close all
clear all

ecct = [0.3 0.9 .0];

for i = 1 : length(ecct)
    
    % Initial Conditions:
    x0 = (1 - ecct(i));
    y0 = 0;
    xprime0 = 0;
    yprime0 = sqrt((1 + ecct(i))/(1 - ecct(i)));
    tspan = [0 12*pi];
    
    [t,z] = ode45(@ODEforKeplers, [0 12*pi], ...
        [x0 y0 xprime0 yprime0]);
    
    hold on
    plot(z(:,1),z(:,2));
    
end

title('X vs Y');
xlabel('X');
ylabel('Y');
legend('0.0', '0.5', '0.9')


