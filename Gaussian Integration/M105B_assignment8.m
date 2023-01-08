clear all
%Part 1
f = @(x) sin(10/x)/x;
gauss = Gauss(f,1,3)

level = 0;
sum = 0;
tol = 10^-7;
Adaptive(f,1,3,tol,level,100)
