% Height:
y1 = input('Initial height (m): ');

% |v| at Start:
Vo = input('Initial Speed (m/s): ');

% Angle of Vo:
a = input('Initial Angle (rad): ');

% Mass of Object:
m = input('Mass of Object (kg): ');

% Step Size:
h = input('H-Step Value (sec): ');

% K-Value:
K = input('Drag Coefficient: (K)');

% Gravitational Constant:
g = 9.8;

% Initial Velocity:
v1 = [Vo*cos(a), Vo*sin(a)];

% Initialize Variables:
r1 = [0, y1];
r = r1;  
v = v1;

% Perform The Euler's Calculations:
emergencybrake = 1000;
for counter = 1 : emergencybrake

  t = (counter - 1) * h;
  xValues(counter) = r(1);
  yValues(counter) = r(2);
  noDragX(counter) = r1(1) + v1(1) * t;
  noDragY(counter) = r1(2) + (v1(2) * t) - ((g/2) * t^2);
  
  % Acceleration Equations: 
  dVdt = ((-K/m) * (((v(1)^2) + (v(2)^2))^(1/2)) * v(1));
  dVdt(2) = (((-K/m) * (((v(1)^2) + (v(2)^2))^(1/2)) * v(2)) - g);
  
  % Euler's Step:
  r = r + h * v;        
  v = v + h * dVdt;     
  
  % Hits Ground:
  if( r(2) < 0 )  
    xValues(counter + 1) = r(1);
	yValues(counter + 1) = r(2);
    break;
  end 
end

% Plot:
plot(xValues,yValues,'o',noDragX,noDragY,'-');
legend('With Air Drag','Without Air Drag');
title('Height Against Range');
xlabel('Range');  
ylabel('Height');
