% Program for solving the Zombie Problem
% Stanford CME 100, Fall 2015
%
% (Letters a->j represent rooms 1->10)
%
% Name: Ron Guglielmone

% Initial Conditions:

a = 40;
b = 60;
c = 40;
d = 40;
e = 100;
f = 20;
g = 60;
h = 40;
i = 40;
j = 10;

% System of Equations:

a1 = 0.4*(a) + 0.2*(f);
b1 = 0.4*(b) + 0.6*(c);
c1 = 0.4*(c) + 0.6*(b);
d1 = 0.4*(d) + 0.15*(g);
e1 = 0.4*(e) + 0.2*(f) + 0.15*(g);
f1 = 0.4*(f) + 0.6*(a) + 0.3*(e) + 0.3*(j);
g1 = 0.4*(g) + 0.6*(d) + 0.3*(e) + 0.3*(h) + 0.6*(i);
h1 = 0.4*(h) + 0.15*(g) + 0.3*(j);
i1 = 0.4*(i) + 0.15*(g);
j1 = 0.4*(j) + 0.2*(f) + 0.3*(h);

% Print Result:
fprintf('Number of zombies in room 1: %g \n',a1);
fprintf('Number of zombies in room 2: %g \n',b1);
fprintf('Number of zombies in room 3: %g \n',c1);
fprintf('Number of zombies in room 4: %g \n',d1);
fprintf('Number of zombies in room 5: %g \n',e1);
fprintf('Number of zombies in room 6: %g \n',f1);
fprintf('Number of zombies in room 7: %g \n',g1);
fprintf('Number of zombies in room 8: %g \n',h1);
fprintf('Number of zombies in room 9: %g \n',i1);
fprintf('Number of zombies in room 10: %g \n',j1);
