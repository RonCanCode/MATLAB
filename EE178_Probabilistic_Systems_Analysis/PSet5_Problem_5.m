% Problem Set 5
% Problem 5
% EE178 - Stanford 2015
%
% Name: Ron Guglielmone

% Number of Coupons:
n = 100;
% Number of Iterations:
iterations = 1000;
% Number of Days Array:
daysTillWin = zeros(1,iterations);
% Unique Coupons:
coupons = 1:1:n;

for i = 1 : iterations
    % Re-initialize:
    matches = 0;
    daysCounter = 0;
    coupons = 1:1:n;
    % Run a Test:
    while matches < n
        daysCounter = daysCounter + 1;
        thisCoupon = randi(n);
        if thisCoupon == coupons(thisCoupon)
            matches = matches + 1;
            coupons(thisCoupon) = -1;
        end
    end
    % Log Test Result:
    daysTillWin(i) = daysCounter;
end

% Plot Results:
histogram(daysTillWin);
titleString = sprintf('Days to Win with %i Coupons',n);
title(titleString);
xlabel('Days');
ylabel('Number of Instances');

% Calculate Average:
x = 0;
for i = 1 : iterations
    x = daysTillWin(i) + x;
end
average = x / iterations;
display(average);
