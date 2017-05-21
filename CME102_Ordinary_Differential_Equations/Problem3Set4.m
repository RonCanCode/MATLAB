% Ron Guglielmone
% CME 102 - Stanford
% Pset 4, Problem 3

% Initialize:
R = 0.5;  % Constant
Q = 8;    % Constant
t0 = 0;   % Time [days]?
tf = 150; % Time [days]?

u0 = [0.01 2.5 2.53 4 6];

for i=1 : length(u0)
    [T, Y] = ode45(@bugOde, [t0, tf], u0(i));
 
    plot(T,Y)
    hold on
end

title('du/dt = Ru(1 - u/Q) - u^2 / 1+u^2')
xlabel('Time')
ylabel('Population')
legend('0.01', '2.5', '2.53', '4', '6')
