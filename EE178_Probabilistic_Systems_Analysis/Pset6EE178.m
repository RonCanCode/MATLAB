clear

% Bernoulli p-value:
p = 0.84;

% X-axis:
x = 0:0.001:1;

% Samples:
N = [2, 5, 10, 20, 50, 100, 500, 1000];

for i = 1 : length(N)
    
    % Generate Random #:
    trial = rand();
    
    % Trial Bins:
    success = 0;
    
    % Index:
    n = (N(i));
    
    for j = 1 : n
        
        % Bernoulli Test w/ p:
        if trial < p
            success = success + 1;
        end
    end
    
    % Plot Values:
    plot(x, ((factorial(n+1)) / ...
        (factorial(success) .* factorial(n-success))) ...
        .* ((x.^(success)) .* ((1-x).^(n-success))));
    
    %plot(x, (((x.^success) .* (1-x).^(n - success)) ./ ...
    %    ((factorial(success) .* factorial(n - success))) ./ ...
    %    (factorial(n + 1))));
   
    hold on
end