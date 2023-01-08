function [a,b,c,d] = coeff_of_cubic_spline(X,Y)
n = length(X)-1;
a = Y;

for i = 1:n %The looping index needs to be changed.
    h(i) = X(i+1)-X(i);
end

for i = 1:n-1
    A(i) = 3/h(i+1)*(a(i+2)-a(i+1)) - 3/h(i)*(a(i+1)-a(i)); %Here A denotes alpha. I shifted every index +1 instead of changing the looping index
end

l(1)=1;
u(1)=0;
z(1)=0;

for i=2:n
    l(i) = 2*(X(i+1)-X(i-1))-h(i-1)*u(i-1);
    u(i) = h(i)/l(i);
    z(i) = (A(i-1)-h(i-1)*z(i-1))/l(i);
end

l(n+1)=1;
z(n+1)=0;
c(n+1)=0;

for j=n:-1:1
    c(j)=z(j)-u(j)*c(j+1);
    b(j)=(a(j+1)-a(j))/h(j)-h(j)*(c(j+1)+2*c(j))/3;
    d(j)=(c(j+1)-c(j))/(3*h(j));
end

end

