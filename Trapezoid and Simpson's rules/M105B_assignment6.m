clear all
% Part 1
% Integrating by parts we get 1/2x^2*ln(x)-x^2/4
Exact_value = 2*log(2)-3/4

% Part 2
f = @(x) x*log(x);
h=1;
disp('Part 2 answers:')
trapezoid = h/2*(f(1)+f(2))
trapezoid_error = abs(trapezoid-Exact_value)
% f''= 1/x, since this is a decreasing function, the max is 1 on [1,2]
error_estimate1 = h^3/12*1

h= (2-1)/2;
simpson = h/3*(f(1)+4*f(1.5)+f(2))
simpson_error = abs(simpson-Exact_value)
% f^(4)= 2/x^3, decreasing, the max is 2 on [1,2] when x=1
error_estimate2 = h^5/90*2

% Part 4
n_list=[10 20 50 100];
simpson_integral = [];
trapezoid_integral= [];
for n = n_list
    simpson_integral = [simpson_integral,composite_simpson(1,2,n)];%a=1 b=2
    trapezoid_integral = [trapezoid_integral,composite_trapezoid(1,2,n)];
end
subplot(2,1,1)
plot(n_list,simpson_integral,'r',n_list,trapezoid_integral,'b')
xlabel('n')
ylabel('integral values')
title('integral values vs. n')
legend('simpson','trapezoid')

%Part 5
simpson_error1 = [];
trapezoid_error1 = [];
simpson_error_estimate = [];
trapezoid_error_estimate = [];
for n = n_list
    h=1/n;
    simpson_approx = composite_simpson(1,2,n);
    simpson_error1 = [simpson_error1,abs(simpson_approx-Exact_value)];
    simpson_error_estimate = [simpson_error_estimate,1/180*h^4*2]; %Already determined that max of f^(4)(c) is 2 previously.
    
    trapezoid_approx = composite_trapezoid(1,2,n);
    trapezoid_error1 = [trapezoid_error1,abs(trapezoid_approx-Exact_value)];
    trapezoid_error_estimate = [trapezoid_error_estimate,1/12*h^2*1]; %Max of f''(c) is 1.
end

disp('Part 5 answers:')
simpson_error1
simpson_error_estimate

trapezoid_error1
trapezoid_error_estimate

subplot(2,1,2)
plot(n_list,simpson_error1,'r',n_list,trapezoid_error1,'b')
xlabel('n')
ylabel('errors')
title('errors vs. n')
legend('simpson','trapezoid')