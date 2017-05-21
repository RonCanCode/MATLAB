% Program to simulate stock strategy
% for shares distributed ~N(100,5)
%
% Stanford, CME 100, Fall 2015
% Name: Ron Guglielmone

clear

% Trial Data:
numberOfTrials = 100;
fullProfit = 0;
price = 0;
cashOnDayX = zeros(1, 250);
sharesOnDayX = zeros(1, 250);
priceOnDayX = zeros(1, 250);
time = 1:1:250;

for n = 1 : numberOfTrials
    
    % Global Vars:
    cashOnHand = 0;
    sharesOwned = 0;
    businessDays = 250;
    
    % One Test Year:
    for i = 1 : businessDays
        % Cycle Vars:
        price = normrnd(100,5);
        % Adjust Average Cash Index:
        if cashOnDayX(i) == 0
            cashOnDayX(i) = cashOnHand;
        else 
            cashOnDayX(i) = ((cashOnDayX(i) +cashOnHand) / 2);
        end
        % Adjust Average Price Index:
        if priceOnDayX(i) == 0
            priceOnDayX(i) = price;
        else
            priceOnDayX(i) = ((priceOnDayX(i) + price) / 2);
        end
        % Adjust Average Shares Index:
        if sharesOnDayX(i) == 0
            sharesOnDayX(i) = sharesOwned;
        else
            sharesOnDayX(i) = ((sharesOnDayX(i) + sharesOwned) / 2);
        end
        brokerFee = 0;
        % Sell Low:
        if price < 100
            % Buy Shares:
            sharesOwned = sharesOwned + 50;
            cashOnHand = cashOnHand - (50 * price);
            % Broker Fee:
            cashOnHand = cashOnHand - 40;
        end
        % Sell High:
        if price > 105
            % Sell Shares:
            cashOnHand = sharesOwned * price;
            % Broker Fee:
            feeByShare = sharesOwned * 0.06;
            if feeByShare > 40
                brokerFee = feeByShare;
            else brokerFee = 40;
            end
            cashOnHand = cashOnHand - brokerFee;
            sharesOwned = 0;
        end
    end
    % SubTotals for One Year:
    trialProfit = cashOnHand + (sharesOwned*price);
    fullProfit = fullProfit + trialProfit;
end

finalResult = fullProfit / numberOfTrials

%figure;
%plot(time, cashOnDayX);
%title('Cash On Day X');
%xlabel('Time [in days]');
%ylabel('Cash In Account [$]');

%figure;
%plot(time, sharesOnDayX);
%title('Shares On Day X');
%xlabel('Time [in days]');
%ylabel('Shares Owned [#]');

%figure;
%plot(time, priceOnDayX);
%title('Price On Day X');
%xlabel('Time [in days]');
%ylabel('Price Of Stock [$]');