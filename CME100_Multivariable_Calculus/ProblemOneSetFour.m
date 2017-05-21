% CME100, PSET 4
%
% Problem 1: Gradient Iterations
% Name: Ron Guglielmone

clear;
close all;

% Global Values:
A = linspace(1,2,100);
Xmain = linspace(1,2,100);
Ymain = linspace(1,2,100);

for i = 1 : 100
    
    An = A(i);
    
    t = 0.5;
    x = 0;
    y = 0;
    lastX = 9999;
    lastY = 9999;
    partialX = 9999;
    partialY = 9999;
    counter = 1;
    
    for i = 1 : 100000;
        % Check for Accuracy:
        if (abs(lastX - x) < .0001) && (abs(lastY - y) < 0.0001)
            break
        end
        lastX = x;
        lastY = y;
        
        % Partial Derivatives:
        partialX = (-exp(-y).*(An-2.*x));
        partialY = (exp(-y).*(An.*x - (x.^2) + y - 1));
        
        % Step in Direction of Grad:
        y = y - partialY .* t;
        x = x - partialX .* t;
        counter = counter + 1;
    end
    
    % Main Function:
    z = (x.^2 - An.*x - y) .* exp(-y);
    Xmain(i) = x;
    Ymain(i) = y;
    
end

plot(A, Xmain, A, Ymain)
legend('x cordinates', 'y cordinates')
title('A Values vs. Optimum x and y Values')
xlabel('A Values')
ylabel('x and y Values')

% Print:
% fprintf('Minimum x-cord: %g \n',x);
% fprintf('Minimum y-cord: %g \n',y);
% fprintf('Minimum z-value: %g \n',z);
% fprintf('Number of iterations: %g \n',counter);