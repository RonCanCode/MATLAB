
% Given Data Values:
amps = [0.0 0.5 1.0 1.5 2.0 2.5 2.7 2.8 2.9 3.0];
volts = [12.0 11.5 11.0 10.5 10.0 9.5 8.5 7.0 4.0 0.0];

% Different Load Values:
R1 = 2;
R2 = 5;
R3 = 10;
R4 = 15;

% Kirchoff's Functions:
VR1 = amps * R1;
VR2 = amps * R2;
VR3 = amps * R3;
VR4 = amps * R4;

% Plot:
figure;
plot (amps, volts, amps, VR1, amps, VR2, amps, VR3, amps, VR4);
grid on;
xlabel ('Amps');
ylabel ('Volts');