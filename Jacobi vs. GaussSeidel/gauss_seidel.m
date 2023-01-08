function [x] = gauss_seidel(n,A,b,XO,TOL,N)
k = 1;
x = zeros(n,1);
while k <= N
    for i = 1:n
        sum1 = 0;
        for j = 1:i-1
            sum1 = sum1 + A(i,j)*x(j);
        end
        sum2 = 0;
        for j = i+1:n
            sum2 = sum2 + A(i,j)*XO(j);
        end
        x(i) = (b(i)-sum1-sum2)/A(i,i);
    end
    
    if norm(x-XO,Inf)<TOL
        return
    end
    
    k = k+1;
    
    for i = 1:n
        XO(i) = x(i);
    end
end

disp("Max number of iterations exceeded")
return

end

