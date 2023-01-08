clear
X = [1 2 3];
Y = [1.105170918 1.491824698 2.459603111];
YP = [0.2210341836 0.5967298792 1.475761867];
[Q,Z] = Hermite_divided_diff(X,Y,YP)

H5_x = @(x) Q(1,1) + Q(2,2)*(x-Z(1)) + Q(3,3)*(x-Z(1))*(x-Z(2)) + Q(4,4)*(x-Z(1))*(x-Z(2))*(x-Z(3))+ Q(5,5)*(x-Z(1))*(x-Z(2))*(x-Z(3))*(x-Z(4))+Q(6,6)*(x-Z(1))*(x-Z(2))*(x-Z(3))*(x-Z(4))*(x-Z(5));
H5 = H5_x(1.25)

X_new = [1 2]; %Only x_0 and x_1
Y_new = [1.105170918 1.491824698];
YP_new = [0.2210341836 0.5967298792];
[Q1,Z1] = Hermite_divided_diff(X_new,Y_new,YP_new)

H3_x = @(x) Q1(1,1) + Q1(2,2)*(x-Z1(1)) + Q1(3,3)*(x-Z1(1))*(x-Z1(2)) + Q1(4,4)*(x-Z1(1))*(x-Z1(2))*(x-Z1(3));
H3 = H3_x(1.25)

f = @(x) exp(0.1*x^2);
abs_error_H5 = abs(f(1.25)-H5)
abs_error_H3 = abs(f(1.25)-H3)

H5_error_bound = (1.25-1)^2 * (1.25-2)^2 * (1.25-3)^2;
% Sixth derivative: f(6)(x) = 0.2(0.00032e^{0.1x^2}x^6+0.024e^{0.1x^2}x^4+0.36e^{0.1x^2}x^2+0.6e^{0.1x^2})
% Since it's an increasing function in [1,3], the max value is y=2.96 when x=3.
H5_error_bound = H5_error_bound*2.96/factorial(6)

H3_error_bound = (1.25-1)^2 * (1.25-2)^2;
% Fourth derivative: f(4)(x) = 0.2(0.008e^{0.1x^2}x^4+0.24e^{0.1x^2}x^2+0.6e^{0.1x^2})
% Since it's increasing in [1,2], the max value is y=0.50364 when x=2.
H3_error_bound = H3_error_bound*0.50364/factorial(4)