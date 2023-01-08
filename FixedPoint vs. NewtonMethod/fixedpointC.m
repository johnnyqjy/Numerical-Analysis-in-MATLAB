%for part c
function [p] = fixedpointC(p0,N0)
TOL=10^-5;
g=@(x) x/2+1/x;
i=1;
while i<=N0
    p=g(p0);
    if abs(p-p0)<TOL
        i %Prints out the number of iteration
        return
    end
    i=i+1;
    p0=p;
end
output=sprintf('The method failed after N0 iterations, N0=%f',N0);
disp(output);
end