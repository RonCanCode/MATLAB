% Problem 5, Pset 4
% EE 178, Stanford
%
% Name: Ron Guglielmone

%Initial Values:
n = 1000000;
p = 0.3;
maindatapoints = zeros(1,35);
finalDataPoints = zeros(1,35);

% Generate Values:
for i = 1 : n
    index = 1;
    value = rand();
    while value <= (1 - p)
        value = rand();
        index = index + 1;
    end
    if index > 35
        index = 35;
    end
    
    maindatapoints(index) = maindatapoints(index) + 1;
end

% Divide by n:
for i = 3:35
    if index > 3
    finalDataPoints(i) = maindatapoints(i) / n;
    end
end

% Plot:
bar(1:35, finalDataPoints)
title('Problem 5')
        