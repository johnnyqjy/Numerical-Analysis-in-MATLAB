function [x] = jacobi(n,A,b,XO,TOL,N)
k = 1;
x = zeros(n,1);
while k <= N
    for i = 1:n
        sum = 0;
        loop_array = [1:i-1,i+1:n];
        for j = loop_array
            sum = sum + A(i,j)*XO(j);
        end
        x(i) = (b(i)-sum)/A(i,i);
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

