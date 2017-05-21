% Height:
y1 = 5000;
% |v| at Start:
vx = 140;
vy = 0;
t = 1;
% Mass of Object:
m = 1000;
% Step Size:
h = 0.1;
% K-Value:
K = 1;
% Gravitational Constant:
g = 9.8;

% Initialize Variables:
r1 = [0, y1];
r = r1;  

% Perform The Euler's Calculations:
emergencybrake = 1000;
for counter = 1 : emergencybrake
    
  xValues(counter) = r(1);
  yValues(counter) = r(2);
  noDragX(counter) = r1(1) + v1(1) * t(counter);
  noDragY(counter) = r1(2) + (v1(2) * t(counter)) - ((g/2) * t(counter)^2);
  
  % Acceleration Equations: 
  dVdtx = ((-K/m) * (((vx(counter)^2) + (vx(counter)^2))^(1/2)) * vx(counter));
  dVdty = (((-K/m) * (((vy(counter)^2) + (vy(counter)^2))^(1/2)) * vy(counter)) - g);
  
  % Euler's Step:
  r(1) = r(1) + h * vx(counter);
  r(2) = r(2) + h * vy(counter);
  vx(counter + 1) = v(counter) + h * dVdtx; 
  vy(counter + 1) = v(counter) + h * dVdty; 
  t(counter + 1) = t(counter) * h;
  
  % Hits Ground:
  if( r(2) < 0 )  
    xValues(counter + 1) = r(1);
	yValues(counter + 1) = r(2);
    break;
  end 
end

 plot(t, vx, 'x');

