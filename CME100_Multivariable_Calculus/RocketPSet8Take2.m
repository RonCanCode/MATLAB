% Problem 1

% Parameter g:
g = linspace(0,1,100);
% Constants C:
C1 = 3000;
C2 = 2775;
C3 = 2545;
% Constants n:
n1 = 3.0;
n2 = 2.8;
n3 = 2.6;
% Time Vectors:
t1 = 0.1*C1*((g.^(n1-1)/(n1-1))+(g.^(n1+1)/(n1+1)));
t2 = 0.1*C2*((g.^(n2-1)/(n2-1))+(g.^(n2+1)/(n2+1)));
t3 = 0.1*C3*((g.^(n3-1)/(n3-1))+(g.^(n3+1)/(n3+1)));
% X Vectors:
x1 = 0.2*C1^2*((g.^(2*n1-1)/(2*n1-1))+(g.^(2*n1+1)/(2*n1+1)));
x2 = 0.2*C2^2*((g.^(2*n2-1)/(2*n2-1))+(g.^(2*n2+1)/(2*n2+1)));
x3 = 0.2*C3^2*((g.^(2*n3-1)/(2*n3-1))+(g.^(2*n3+1)/(2*n3+1)));
% Y Vectors:
y1 = 0.1*C1^2*((g.^(2*n1-2)/(2*n1-2))+(g.^(2*n1+2)/(2*n1+2)));
y2 = 0.1*C1^2*((g.^(2*n2-2)/(2*n2-2))+(g.^(2*n2+2)/(2*n2+2)));
y3 = 0.1*C1^2*((g.^(2*n3-2)/(2*n3-2))+(g.^(2*n3+2)/(2*n3+2)));
% Air Density:
p1 = 1.2*exp(-y1/8000);
p2 = 1.2*exp(-y2/8000);
p3 = 1.2*exp(-y3/8000);
% Vehicle Frontal Area:
A = 2;
% Drag Coefficient:
cd = 0.2;

%Part a: 
 plot(x1,y1,x2,y2,x3,y3);
 title('Rocket Trajectory');
 legend('Case 1', 'Case 2', 'Case 3');
 xlabel('Horizontal Displacement');
 ylabel('Vertical Displacement');

% Part b:
speed1 = gradient(g,t1).*sqrt(gradient(x1,g).^2+gradient(y1,g).^2);
speed2 = gradient(g,t2).*sqrt(gradient(x2,g).^2+gradient(y2,g).^2);
speed3 = gradient(g,t3).*sqrt(gradient(x3,g).^2+gradient(y3,g).^2);

 plot(t1,speed1,t2,speed2,t3,speed3);
 title('Rocket Speed as a Funcion of time');
 legend('Speed 1', 'Speed 2', 'Speed 3');
 xlabel('Time');
 ylabel('Speed in meters/second');
 
% Part c:
% Drag Force:
F1 = 0.5*p1.*((speed1).^2)*A*cd;
F2 = 0.5*p2.*((speed2).^2)*A*cd;
F3 = 0.5*p3.*((speed3).^2)*A*cd;

 plot(t1,F1,t2,F2,t3,F3);
 title('Drag Force Acting on Rocket');
 legend('Drag 1', 'Drag 2', 'Drag 3');
 xlabel('Time');
 ylabel('Drag Force');
 
% Part D:

% Work:
f1 = -(F1.*speed1);
f2 = -(F2.*speed2);
f3 = -(F3.*speed3);
W1 = trapz(f1,t1);
W2 = trapz(f2,t2);
W3 = trapz(f3,t3);
W1 =
   1.5869e+09
W2 =
   1.1536e+09
W3 =
   9.0240e+08
