clear all
f = @(x) exp(x);
a_j = chebyshev_coeff(f,-1,1,8) %Just for testing

% Part 2
% The exact value of the integral is 2.350402387
exact = 2.350402387;

for N=1:20
    a_j = chebyshev_coeff(f,-1,1,N);
    if abs(chebyshev_poly(a_j,N)-exact)<10^-6
        disp("We need N to be:");
        N
        break
    end
end

%Part 3
syms PW(x)
PW(x) = piecewise(x<0,-1,x==0,0,x>0,1);
%Actually the piecewise function is always going to be 1 since it is always positive on [cos(-1),cos(1)]
f1= @(x) 1;
N_list = [2,3,4,5];
exact=2;
error = [];
for N = N_list
    a_j = chebyshev_coeff(f1,-1,1,N);
    error = [error, abs(chebyshev_poly(a_j,N)-exact)];
end
error