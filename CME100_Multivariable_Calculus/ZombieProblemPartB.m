% Program for solving the Zombie Problem
% Stanford CME 100, Fall 2015
%
% (Letters a->j represent rooms 1->10)
%
% Name: Ron Guglielmone

% Coefficient Matrix:
A = [0.40 0.00 0.00 0.00 0.00 0.20 0.00 0.00 0.00 0.00;
     0.00 0.40 0.60 0.00 0.00 0.00 0.00 0.00 0.00 0.00;
     0.00 0.60 0.40 0.00 0.00 0.00 0.00 0.00 0.00 0.00;
     0.00 0.00 0.00 0.40 0.00 0.00 0.15 0.00 0.00 0.00;
     0.00 0.00 0.00 0.00 0.40 0.20 0.15 0.00 0.00 0.00;
     0.60 0.00 0.00 0.00 0.30 0.40 0.00 0.00 0.00 0.30;
     0.00 0.00 0.00 0.60 0.30 0.00 0.40 0.30 0.60 0.00;
     0.00 0.00 0.00 0.00 0.00 0.00 0.15 0.40 0.00 0.30;
     0.00 0.00 0.00 0.00 0.00 0.00 0.15 0.00 0.40 0.00;
     0.00 0.00 0.00 0.00 0.00 0.20 0.00 0.30 0.00 0.40;];
 
 % Solution Matrix:
 b = [20; 48; 52; 25; 53; 65; 114; 28; 25; 20];
 
 % Inverse of A:
 z = A\b;
 
 % Solutions:
 a = z(1);
 b = z(2);
 c = z(3);
 d = z(4);
 e = z(5);
 f = z(6);
 g = z(7);
 h = z(8);
 i = z(9);
 j = z(10);
 
% Print Result:
fprintf('I 1: %g \n',a);
fprintf('Number of zombies in room 2: %g \n',b);
fprintf('Number of zombies in room 3: %g \n',c);
