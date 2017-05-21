% Ron Guglielmone
% CME 102, Winter '15-16
% Stanford University
%
% Problem Set 2, #3
% RL Circuit

% Constants:
t0 = 0;
tf = 6;
I0 = 6;
L = 0.5;
R = 10;
E0 = 3;
w = 2;

t = linspace(t0, tf, 900);
n = length(t);
i = zeros(n);

for T = 1 : n
    
i(T)=((E0*L*R*sin(w*t(T))) - ((E0*L^2*w*cos(w*t(T))))...
    / (L^2*w^2*R^2)) + E0*exp(-R*t(T)/L);

end

plot(t,i);
title('Driven RL Circuit');
xlabel('time [s]');
ylabel('current [A]');








