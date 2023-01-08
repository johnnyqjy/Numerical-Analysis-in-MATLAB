function [Q,Z] = Hermite_divided_diff(X,Y,YP)
n = length(X)-1;
Q = zeros(n+1,n+1); 
Z = zeros(1,2*n+2);

for i=0:n
    Z(2*i+1) = X(i+1); %Z(1) is the z_0 in the original problem. I'm adding 1 to every index in the following steps. 
    Z(2*i+2) = X(i+1);
    Q(2*i+1,1) = Y(i+1); %The first column will be degree 0, second column will be degree 1 etc.
    Q(2*i+2,1) = Y(i+1);
    Q(2*i+2,2) = YP(i+1);
    
    if i~= 0
        Q(2*i+1,2) = (Q(2*i+1)-Q(2*i))/(Z(2*i+1)-Z(2*i));
    end
end

for i=2:2*n+1
    for j=2:i
        Q(i+1,j+1) = (Q(i+1,j)-Q(i,j))/(Z(i+1)-Z(i-j+1));
    end
end

end

