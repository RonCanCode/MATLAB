% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Title:        Roulette Strategy Simulation                %
% Author:       Ron J. Guglielmone Jr.                      %
% Date:         September 1, 2017                           %
%                                                           %
% Description:  Simulates a "winning" strategy for playing  %
%               roulette.  We assume "even money" payout    %
%               for bets on red or black, meaning a bet of  %
%               $5 pays $5 ($10 returned).  We assume 36    %
%               colored numbers, with two green slots       %
%               (0 and 00).  This means the odds of "red"   %
%               or "black" are actually 18/38, or ~47%.     %
%                                                           %
%               The strategy tested below is outlined:      %
%                                                           %
%               1. The first bet is for ammount x on black. %
%               2. If the bet pays, we walk away.  The end. %
%               3. If the bet loses, we tripple our stake.  %
%                  The next bet is 3^N.  Then 3^(N+1), etc. %
%                                                           %
%               Questions to answer:                        %
%                                                           %
%               1. How much money do we need total          %
%                  (amount y = f(x)) to guarantee a 99.99%  %
%                  chance of walking away a winner?         %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

clear all;
close all;

% Global Vars:

numTrials = 1000;                   % number of simulations
moneyEarned = zeros(numTrials,1);   % money won each time
numberOfGames = zeros(numTrials,1); % number of games played
moneySpent = zeros(numTrials,1);    % amount spent per round
initialBet = 5;                     % 1/2 initial bet amount
odds = (1 - (18/38));               % not 50/50...

% Main Loop:

for n = 1 : numTrials
    
    spinOutcome = 0;                % 1 is Red, 0 is black
    N = 1;                          % number of games in test
    moneyDown = 0;                  % per round
    
    while spinOutcome == 0
        
        % Simulate a Spin:
        randNum = rand();           % Random number 0 < n < 1
        
        if randNum > odds
            spinOutcome = 1;
            moneyEarned(n) = (3^N)*initialBet - moneyDown;
            numberOfGames(n) = N;
        end
        
        if randNum < odds
            spinOutcome = 0;
            moneyDown = moneyDown + (3^N)*initialBet;
            moneySpent(n) = (3^N)*initialBet;
        end
        
        N = N + 1;
        
    end
    
    
end

disp(['Max Number of Rounds Played'])
max(numberOfGames)
disp(['Max Money Spent In A Round'])
max(moneySpent)
disp(['Max Money Made In A Round'])
max(moneyEarned)
