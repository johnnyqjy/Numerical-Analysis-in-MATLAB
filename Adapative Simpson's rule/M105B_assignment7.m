clear all
%Part 1
%The indefinite integral is 2e^(-x)sin(2x)/5-e^(-x)cos(2x)/5+C
Exact_value = -1/(5*exp(2*pi))+ 1/5

%Part 2
n_list=[10 20 50 100];
simpson_error = [];
simpson_error_estimate = [];
%f^(4)(x)= -24e^-x*sin(2x)-7e^-x*cos(2x), the max is |-14.815| on [0,2*pi]
for n = n_list
    h=2*pi/n;
    simpson_approx = composite_simpson7(0,2*pi,n);
    simpson_error = [simpson_error,abs(simpson_approx-Exact_value)];
    simpson_error_estimate = [simpson_error_estimate,2*pi/180*h^4*14.815];
end
plot(n_list,simpson_error)
xlabel('n')
ylabel('errors')
title('errors vs. n')

simpson_error
simpson_error_estimate

%Part4
S = adaptive_simpson(0,2*pi,0.5*10^-4,20)
h = (0.5*10^-4/14.815/(2*pi/180))^(1/4);
n = 2*pi/h
disp('We need at least 64 quadrature points for the non-adaptive method')