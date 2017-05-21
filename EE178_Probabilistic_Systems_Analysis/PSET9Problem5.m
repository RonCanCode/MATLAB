% Problem Set 9
% Problem 5
% EE178 - Stanford 2015
%
% Name: Ron Guglielmone

% Initialize:
low = 0;
high = 0;
values = zeroes(10^7, 1);

% Generate Variables:
for i = 1 : 10^7
    y = rand();
    if (y <= .5)
        x = (-1 * (log(2 * y))^(1/3)) * -1;
        if x< low
            low = x;
        end
    else
        x = (-1 * log(2 * (1 - y)))^(1/3);
        if x > high
            high = x;
        end
    end
end

% Plot:
bins = low : 0.05 : high;
[f,x] = hist(values, bins);
bar(x,f);
