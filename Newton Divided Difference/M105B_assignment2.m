clear
X = [0 0.1 0.3 0.6 1];
Y = [-6 -5.89483 -5.65014 -5.17788 -4.28172];
F = Newton_divided_dif(X,Y)

P4_x = @(x) F(1,1)+F(1,2)*(x-X(1))+F(1,3)*(x-X(1))*(x-X(2))+F(1,4)*(x-X(1))*(x-X(2))*(x-X(3))+F(1,5)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4));
% This is the fourth degree Lagrange interpolating polynomial
% I tried to put it in an actual function but didn't work out. So I'm typing
% it manually into a function handle.
y_4 = P4_x(0.05)

P3_x = @(x) F(1,1)+F(1,2)*(x-X(1))+F(1,3)*(x-X(1))*(x-X(2))+F(1,4)*(x-X(1))*(x-X(2))*(x-X(3)); %Using the first 4 nodes
% This is the third degree Lagrange interpolating polynomial
y_3 = P3_x(0.05)

format long
abs_error = abs(y_4 - y_3)
format short

X1 = [X,1.1]; %X1 denotes the new list with the new point added
Y1 = [Y,-3.99583];
F1 = Newton_divided_dif(X1,Y1)

P5_x = @(x) F1(1,1)+ F1(1,2)*(x-X1(1))+F1(1,3)*(x-X1(1))*(x-X1(2))+F1(1,4)*(x-X1(1))*(x-X1(2))*(x-X1(3))+F1(1,5)*(x-X1(1))*(x-X1(2))*(x-X1(3))*(x-X1(4))+F1(1,6)*(x-X1(1))*(x-X1(2))*(x-X1(3))*(x-X1(4))*(x-X1(5));
y_5 = P5_x(1.05)

P4_x_new = @(x) F1(1,1)+ F1(1,2)*(x-X1(1))+F1(1,3)*(x-X1(1))*(x-X1(2))+F1(1,4)*(x-X1(1))*(x-X1(2))*(x-X1(3))+F1(1,5)*(x-X1(1))*(x-X1(2))*(x-X1(3))*(x-X1(4));
y_4_new = P4_x_new(1.05)

format long
abs_error_new = abs(y_5 - y_4_new)