% Problem Set 3
% Problem 1
% EE178 - Stanford 2015
%
% Name: Ron Guglielmone
%
% Simulates number of "heads" 
% in a row for a sequence of
% n coin tosses.

% Number of tosses:
n = 1000;

% Trial results:
nFor0 = 0;
nFor1 = 0;
nFor2 = 0;
nFor3 = 0;


for i = 0:n
    
    toss1 = randi([0 1]);
    toss2 = randi([0 1]);
    toss3 = randi([0 1]);
    toss4 = randi([0 1]);
    toss5 = randi([0 1]);
    
    count = 0;
    
    if toss1 - toss2 == 1
        count = count+1;
    end
    
    if toss2 - toss3 == 1
        count = count+1;
    end
    
    if toss3 - toss4 == 1
        count = count+1;
    end
    
    if toss4 - toss5 == 1
        count = count+1;
    end
    
    if count == 0
        nFor0 = nFor0 + 1;
    end
    if count == 1
        nFor1 = nFor1 + 1;
    end
    if count == 2
        nFor2 = nFor2 + 1;
    end
    if count == 3
        nFor3 = nFor3 + 1;
    end
end

fprintf('Number of 0 results: %g \n',nFor0);
fprintf('Number of 1 results: %g \n',nFor1);
fprintf('Number of 2 results: %g \n',nFor2);
fprintf('Number of 3 results: %g \n',nFor3);
