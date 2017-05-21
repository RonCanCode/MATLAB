% Height:
y1 = 5000;
% |v| at Start:
Vo = 140;
% Mass of Object:
m = 1000;
% Step Size:
h = 0.1;
% K-Value:
K = 1;
% Gravitational Constant:
g = 9.8;
% Initial Velocity:
v1 = [Vo, 0];
% Initialize Variables:
r1 = [0, y1];
r = r1;  
v(1) = v1(1);
t = [0];

% Perform The Euler's Calculations:
stopCycle = 1000;
for counter = 1 : stopCycle

  % Time Step:
  t(counter) = (counter) * h;
  xValues(counter) = r(1);
  yValues(counter) = r(2);
  
  % Acceleration Equations (no drag):
  noDragX(counter) = r1(1) + v1(1) * t(counter);
  noDragY(counter) = r1(2) + (v1(2) * t(counter)) - ((g/2) * t(counter)^2);
  
  % Acceleration Equations (drag): 
  dVdt = ((-K/m) * (((v(1)^2) + (v(2)^2))^(1/2)) * v(1));
  dVdt(2) = (((-K/m) * (((v(1)^2) + (v(2)^2))^(1/2)) * v(2)) - g);
  
  % Euler's Step:
  r = r + h * v;        
  v(counter + 1) = v(counter) + h * dVdt;     
  
  % Hits Ground:
  if( r(2) < 0 )  
    xValues(counter + 1) = r(1);
	yValues(counter + 1) = r(2);
    t(counter + 1) = t(counter);
    break;
  end 
end

% Plot:
plot(t, v);
legend('With Air Drag','Without Air Drag');
title('Height vs. Range');
xlabel('Range');  
ylabel('Height');
