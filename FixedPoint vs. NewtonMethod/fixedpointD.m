%for part d
function [p] = fixedpointD(p0,N0)
TOL=10^-2;
% s=@(t) 300-0.25*32.17/0.1*t+0.25^2*32.17/0.1^2*(1-exp(-0.1*t/0.25))+t;
% doesn't work
s=@(t) (300-0.25*32.17/0.1*t+0.25^2*32.17/0.1^2*(1-exp(-0.1*t/0.25))+t^3)^(1/3);
%3rd power
i=1;
while i<=N0
    p=s(p0);
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