function [Px] = f_lagrange(X,Y,x)
n = length(X);
Px = 0;
for i=1:n
    product_sum=1; %Initialize the product sum and reset it each time
    loop_array = [1:i-1,i+1:n]; %Eliminates the k, or i in our case
    for j=loop_array
        product_sum = product_sum * (x-X(j))/(X(i)-X(j));
    end
    Px = Px + Y(i)*product_sum;
end
end

