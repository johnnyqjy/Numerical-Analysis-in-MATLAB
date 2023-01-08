function [I] = composite_trapezoid(a,b,n)
h=(b-a)/n;
f = @(x) x*log(x);
I_n = [f(a),0,f(b)];

for j=1:n-1
    x = a+j*h;
    I_n(2) = I_n(2)+f(x);
end

I = h/2*(I_n(1)+2*I_n(2)+I_n(3));

end

