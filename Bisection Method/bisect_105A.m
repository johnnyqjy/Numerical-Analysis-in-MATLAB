a=-1;
b=1;
Tol = 10^-6;
Nmax=300;
clf
hold on

for i=1:Nmax
    p= (a+b)/2;
    e= abs(b-a);
    if e < Tol
        break
    end
    FP = 6*(exp(p)-p)-7-3*p^2-2*p^3;
    if FP == 0
        break
    end
    FA = 6*(exp(a)-a)-7-3*a^2-2*a^3;
    if FA*FP>0
        a=p;
    else
        b=p;
    end
    if i==Nmax
        i=i+1;
    end
    plot(p,e,'kx');
    title('root value vs. error');
    xlabel('root value');
    ylabel('error');
end

if i == Nmax+1
    disp("Max iterations reached, no solution found.")
else if i<Nmax+1
        p
        e
        i
    end
end