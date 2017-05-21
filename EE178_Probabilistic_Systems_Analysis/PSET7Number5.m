% Problem Set 7
% Problem 5
% EE178 - Stanford 2015
%
% Name: Ron Guglielmone

% Global Vars:
p = 0.84;
numberOfTrials = 1000;
trials = zeros(numberOfTrials);

% Generate Binomial Trials:
for i = 1 : numberOfTrials
    val = rand();
    if (val < p)
        trials(i) = 1;
    end
end

% Estimate and Graph:
    for n = 2 : numberOfTrials
        x_n = sum(trials(1:n));
        plot(n,(((1 - 2 + 16)/((2^n)*(n^2 - n + 1)))...
            *(x_n - n/2) + p), '+');
        hold on
    end
