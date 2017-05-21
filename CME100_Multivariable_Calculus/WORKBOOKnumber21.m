close all

% The average of the daily
% amount is done over a year:
for i = 1:365
    
    % Create a vector whose components
    % are the speed of each car
    % taking the freeway:
    x = randn(8000,1)*10 + 55;
    
    % Initialize the amount     
    % collected each day:
    S(i) = 0;
    
    % Initialize the number
    % of speeders (rand > 65):
    Speeders(i) = 0;
    
    % Test the speed of each vehicle.
    % If it's greater than 80,
    % add 150 to S:
    for k = 1 : length(x)
        
        if x(k) > 80
            S(i) = S(i) + 150;
            
        end
        
        % Add test for our assignment:
        if x(k) > 65
            Speeders(i) = Speeders(i) + 1;
        end
    end
end

% Compute the average of vector S 
% containing the amount collected 
% each day during a year:
Savg = mean(S);

% Compute average:
cumulative = 0;
for i = 1 : length(Speeders)
    cumulative = cumulative + Speeders(i);
end

% Compute percentage:
dailyAverageNumber = cumulative / 365;
totalNumber = 8000 * 365;
percentage = dailyAverageNumber / totalNumber