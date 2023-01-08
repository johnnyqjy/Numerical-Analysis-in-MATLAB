function [F] = Newton_divided_dif(X,Y)
n = length(X);
F = zeros(n,n); 
F(:,1)=Y'; %The first column will contain degree 0 polynomials, or constants
for j = 2:n %We will start from the second column to denote degree 1 polynomials
    for i=1:n-j+1
        F(i,j)= (F(i+1,j-1)-F(i,j-1))/(X(i+j-1)-X(i)); %Changing indices to fit the recursion
    end
end

end
