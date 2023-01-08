%for part d
function [p] = newtonMethodD(p0,N0)
TOL=10^-2;
s=@(t) 300-0.25*32.17/0.1*t+0.25^2*32.17/0.1^2*(1-exp(-0.1*t/0.25));
sprime= @(t) -0.25*32.17/0.1+0.25*32.17/0.1*exp(-0.1*t/0.25);
%Manually computed the derivative.
i=1;
while i<=N0
    p=p0-s(p0)/sprime(p0);
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

