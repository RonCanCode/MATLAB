% Variables:

 Vx = 140;     % X-velocity
 Vy = 0;     % Y-velocity
 Xpos = 9,607;   % X-position
 Ypos = 18027;   % Y-position
 r = [Xpos, Ypos];  % Displacement
 time = [0];   % Time
 h = 0.1;    % Time step
 K = 1;      % Drag coefficient
 M = 1000;      % Mass of particle
 g = 9.8;    % Gravitational constant
 
 % Relationships:
 
 dxdt = Vx;
 dydt = Vy;
 dVxdt = ((-K/M) * (((Vx^2) + (Vy^2))^(1/2)) * Vx);
 dVydt = (((-K/M) * (((Vx^2) + (Vy^2))^(1/2)) * Vy) - g);
 
 while Ypos >= 0
     time = time + h;
     Vx = Vx + dVxdt * h;
     Vy = Vy + dVydt * h;
     Xpos = Xpos + (Vx * h);
     Ypos = Ypos + (Vy * h);
     r(1) = Xpos;
     r(2) = Ypos;
     
 end
 
 plot (time, r, 'o');
 