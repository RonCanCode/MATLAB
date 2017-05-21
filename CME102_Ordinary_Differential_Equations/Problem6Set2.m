% Ron Guglielmone
% Stanford 2016
% CME 102 - Set 2
%
% Problem 7

T = 360; %30 yrs * 12 months
r = 0.003125; %pct per month
P0 = 300000; %US dollars
P = linspace(1, 360, 360);
t = linspace(1,360,360);

for n = 1 : 360
    
P(n) = P0*((1 - exp(-r*(T - t(n)))) ...
    / (1 - exp(-r*T)));

end

plot(t,P);
title('Loan Balance vs Time');
x_label('Time [months]');
y_label('Ballance [$]');



