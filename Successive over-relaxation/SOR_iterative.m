function [x,iteration_table] = SOR_iterative(n,A,b,XO,w,TOL,N)
k = 1;
x = zeros(n,1);
iteration_table =[];
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
        x(i) = (1-w)*XO(i)+w/A(i,i)*(b(i)-sum1-sum2);
    end
    
    iteration_table = [iteration_table,x];
    
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

