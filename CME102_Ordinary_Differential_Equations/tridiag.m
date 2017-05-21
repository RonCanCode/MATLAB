function x = tridiag(n, a, b, c, f)

    for j = 2:n
        temp = a(j)/b(j-1);
        b(j) = b(j) - temp*c(j-1);
        f(j) = f(j) - temp*f(j-1);
    end
    
    x(n) = f(n)/b(n);

    for j=n-1 : -1 : 1
       x(j) = (f(j)-c(j)*x(j+1))/b(j); 
    end
  
end





