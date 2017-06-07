% % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Author: Ron Guglielmone                               %
%                                                       %                   
% EE65 - Modern Physics                                 %
% Stanford University                                   %
% Spring, 2017                                          %
%                                                       %
% Problem Set 9                                         %
%                                                       %
% Characterizing a photovoltaic system.                 %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %

clear all;
close all;

% Given:
Is = 1*(10^-6);           % Saturation current [A]
Egap = 1;                 % Bandgap energy [eV]
T = 293;                  % Temperature [K]
Ip = 1*(10^-2);           % Photocurrent [A]
Reff = 100;               % Effective resistance [ohm]
Kb = 1.3807*10^-23;       % Boltzman Const. [J/K]
elec = 1.6023*10^-19;     % Electron charge [C]

% _____________________________________________________ %
% Part A: Graph I-V Characteristic
% _____________________________________________________ %

V = 0:0.001:0.3;          % Voltage [V]
I = (Is .* (exp((elec .* V) ./ ...
               (Kb .* T) ) - 1)) - Ip;
figure(1);
plot(V,I);
xlabel('Voltage [volts]');
ylabel('Current [amps]');
title('Current vs. Voltage for Photodiode');

% _____________________________________________________ %
% Part B: Graph Power
% _____________________________________________________ %

P = -I .* V;               % Power [watts]
[M, index] = max(P);       % Find maximum
figure(2)
plot(V,P);
hold on;
plot(V(index),M,'x');
xlabel('Voltage [volts]');
ylabel('Power [watts]');
title('Current vs. Power (Max = 0.0021 W)');

% _____________________________________________________ %
% Part C: Calculate Maxima
% _____________________________________________________ %

Vmax =  0.2320;            % [Volts]
Imax = -0.0090;            % [Amps]
Pmax =  0.0021;            % [Watts]

% _____________________________________________________ %
% Part D: Calculate Resistor Value
% _____________________________________________________ %

% Use: V = I*R with the above values.
R = abs(Vmax/Imax);        % R = 25.7778 ohms

% _____________________________________________________ %
% Part E: Light Beam Power
% _____________________________________________________ %

Ephoton = 1;               % Photon Energy [eV]
EphoJ = 1.6022*10^-19;     % Photon Energy [J]

 % Notes:
 %
 % Coulombs / second = amperes
 % One electron charge = elec = -1.6023*10^-19 C
 % We know photocurrent = Ip = 1*(10^-2) A
 % We know Ephoton = 1 eV = 1.6022×10^-19 J
 % We know each electron maps to 1 photon

photonCount = Ip/elec;
energy = photonCount * EphoJ;
efficiency = M/energy

% Power of light: 10 mW
% Power in circuit: 2.1 mW
% -------------------------
% 21% efficiency

% _____________________________________________________ %
% Part F: New Light Energy
% _____________________________________________________ %

% Suppose light now has photon energy = 1.5eV
Ephoton = 1;               % Photon Energy [eV]
EphoJ = 2.4*10^-19;        % Photon Energy [J]
photonCount = Ip/elec;
energy = photonCount * EphoJ;
efficiency = M/energy

% Power of light: 15 mW
% Power in circuit: 2.1 mW
% -------------------------
% 14% efficiency

% _____________________________________________________ %
% Part G: New Saturation Current Value
% _____________________________________________________ %

% If instead Is = 10 nA = 1*(10^-6) A
% does efficiency increase or decrease?
 
% Efficiency goes down.  In the case of
% Part F, it decreases from 14% to 10%.
% In the case of Part E, it decreases
% from 21% to 15.7%.
