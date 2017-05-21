clear all
close all

Nvalues = [1024 8 16 32 64];
for index = 1 : length(Nvalues)
    N = Nvalues(index);
    % Constants:
    V = 1;
    D = 0.1;
    y0 = 0;
    % Boundaries:
    xL = 0;
    xR = 1;
    h = (xR - xL) / (N-1);
    x = linspace(xL, xR, N);
    % Aj relations:
    a(2)  = 0;
    a(3:N) = (0.1/(h^2)) - (1/h);
    a(1:N-2) = a(2:N-1);
    % Bk relations:
    b(2:N-1) = (1/h) - (0.2/(h^2));
    b(N) = (1/h) - (0.3/(h^2));
    b(1:N-2) = b(2:N-1);
    % Cj relations:
    c(2:N-1) = (-0.1)/(h^2);
    c(N) = 0;
    c(1:N-2) = c(2:N-1);
    % Fj relation:
    for j = 2:N
        f(j) = 0.1 .* exp((((j-1)*h) - 0.5)^2);
    end
    % ODE Wrapper:
    y = tridiag(N-2, a, b, c, f);
    y = [y0 y y(N-2)];
    
    hold on
    plot(x(1:N), y(1:N));
    
end
title('River Problem')
xlabel('x')
ylabel('S(x)')
legend('N = 1024','N = 8', 'N = 16', 'N = 32', 'N = 64');