function [I] = composite_simpson(a,b,n)
h=(b-a)/n;
f = @(x) x*log(x);
I_n = [f(a)+f(b),0,0];

for i=1:n-1
    x = a+i*h;
    if mod(i,2)==0
        I_n(3)=I_n(3)+f(x);
    else
        I_n(2)=I_n(2)+f(x);
    end
end

I = h/3*(I_n(1)+2*I_n(3)+4*I_n(2));
end
