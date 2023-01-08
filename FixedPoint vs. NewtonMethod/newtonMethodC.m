%for part c
function [p] = newtonMethodC(p0,N0)
TOL=10^-5;
f=@(x) -x/2+1/x;
% -x/2 because we needed to subtract x from the original equation to make it
% find the fixed point
fprime=@(x)-1/2-1/(x^2);
% manually computed the derivative
i=1;
while i<=N0
    p=p0-f(p0)/fprime(p0);
    if abs(p-p0)<TOL
        i %Prints out the number of iteration
        return
    end
    i=i+1;
    p0=p;
end
output=sprintf('The method failed after N0 iterations, N0=%f',N0);
disp(output)
end

