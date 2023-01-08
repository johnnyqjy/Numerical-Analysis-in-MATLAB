clear
f = @(x) 1./(1+x.^2);

%Part 1
subplot(7,1,1)
n=11;
h=10/n; % h is only positive here
forward_diff = @(x) (f(x+h)-f(x))/h;
backward_diff = @(x) (f(x)-f(x-h))/h; 
central_diff = @(x) (f(x+h)-f(x-h))/(2*h); 
X = linspace(-5,5,n);
X = X(2:end-1); %This is to avoid extrapolation

plot(X,forward_diff(X),'linewidth',2,'color','b')
hold on

plot(X,backward_diff(X),'linewidth',2,'color','g')
hold on

plot(X,central_diff(X),'linewidth',2,'color','r')
title('n=11')
legend('forward','backward','central','location','Northeast Outside')
axis([-5 5 -0.6 0.6]) %OCD

subplot(7,1,2)
n=21;
h=10/n;
forward_diff = @(x) (f(x+h)-f(x))/h;
backward_diff = @(x) (f(x)-f(x-h))/h; 
central_diff = @(x) (f(x+h)-f(x-h))/(2*h); 
X = linspace(-5,5,n);
X = X(2:end-1); %This is to avoid extrapolation

plot(X,forward_diff(X),'linewidth',2,'color','b')
hold on

plot(X,backward_diff(X),'linewidth',2,'color','g')
hold on

plot(X,central_diff(X),'linewidth',2,'color','r')
title('n=21')
legend('forward','backward','central','location','Northeast Outside')

subplot(7,1,3)
n=51;
h=10/n;
forward_diff = @(x) (f(x+h)-f(x))/h;
backward_diff = @(x) (f(x)-f(x-h))/h; 
central_diff = @(x) (f(x+h)-f(x-h))/(2*h); 
X = linspace(-5,5,n);
X = X(2:end-1); %This is to avoid extrapolation

plot(X,forward_diff(X),'linewidth',2,'color','b')
hold on

plot(X,backward_diff(X),'linewidth',2,'color','g')
hold on

plot(X,central_diff(X),'linewidth',2,'color','r')
title('n=51')
legend('forward','backward','central','location','Northeast Outside')

subplot(7,1,4)
n=101;
h=10/n;
forward_diff = @(x) (f(x+h)-f(x))/h;
backward_diff = @(x) (f(x)-f(x-h))/h; 
central_diff = @(x) (f(x+h)-f(x-h))/(2*h); 
X = linspace(-5,5,n);
X = X(2:end-1); %This is to avoid extrapolation

plot(X,forward_diff(X),'linewidth',2,'color','b')
hold on

plot(X,backward_diff(X),'linewidth',2,'color','g')
hold on

plot(X,central_diff(X),'linewidth',2,'color','r')
title('n=101')
legend('forward','backward','central','location','Northeast Outside')

%Part 2
f_prime = @(x) -2*x./((1+x.^2).^2);
n_list = [11 21 51 101];
max_error1 = [];
max_error2 = [];
max_error3 = [];

for n = n_list
    h=10/n;
    X = linspace(-5,5,n);
    X = X(2:end-1);
    
    forward_diff = @(x) (f(x+h)-f(x))/h;
    abs_errors = abs(f_prime(X)-forward_diff(X));
    max_error1 = [max_error1, max(abs_errors)];
    
    backward_diff = @(x) (f(x)-f(x-h))/h;
    abs_errors = abs(f_prime(X)-backward_diff(X));
    max_error2 = [max_error2, max(abs_errors)];
    
    central_diff = @(x)(f(x+h)-f(x-h))/(2*h);
    abs_errors = abs(f_prime(X)-central_diff(X));
    max_error3 = [max_error3, max(abs_errors)];
end

subplot(7,1,5)
plot(n_list,max_error1,'ko',n_list,max_error2,'g*',n_list,max_error3,'rx')
title("F'(x) error")
legend('forward','backward','central','location','Northeast Outside')
xlabel('n')
ylabel('Max Error')


% Error Estimate
% F''(x) = -2*(-3*x^2+1)/((1+x^2)^3)
% The max on the interval [-5,5] is |-2|=2

max_f_doubleprime = 2;
error_estimate = [];
for n = n_list
    h=10/n;
    error_estimate = [error_estimate,h/2*2];
end

max_error1 %Forward and Backward
error_estimate
disp('The actual error is about the same size as the error estimate, and it is less than the error estimate as expected.')

%Part 3
subplot(7,1,6)
for n = n_list
    h = 10/n;
    X = linspace(-5,5,n);
    X = X(2:end-1);
    f_second_deri_midpt = @(x) 1/h^2*(f(x-h)-2*f(x)+f(x+h));
    plot(X,f_second_deri_midpt(X))
    hold on
end
legend('n=11','n=21','n=51','n=101','location','Northeast Outside')
title("f''(x) using central difference")

%Part 4
f_double_prime = @(x) -2*(-3*x.^2+1)./((1+x.^2).^3);

max_error = [];
for n = n_list
    h = 10/n;
    X = linspace(-5,5,n);
    X = X(2:end-1);
    f_second_deri_midpt = @(x) 1/h^2*(f(x-h)-2*f(x)+f(x+h));

    abs_errors = abs(f_double_prime(X) - f_second_deri_midpt(X));
    max_error = [max_error, max(abs_errors)];
end

subplot(7,1,7)
plot(n_list,max_error,'ko')
xlabel('n')
ylabel('Max Error')
title("f''(x) Error")

%Error Estimate:
%F^(4)(x) = 24(5x^4-10x^2+1)/((x^2+1)^5)
%The max on the interval [-5,5] is 24 when x=0
error_estimate = [];
for n = n_list
    h=10/n;
    error_estimate = [error_estimate,h^2/12*24];
end
max_error
error_estimate
disp("The actual error is about the same size as the error estimate, and it is less than the error estimate as expected.")

%Part 5
N_list = [1 2 5 10 20 40];
D_N_list = [];

for N = N_list
    D_N = (f(10^(-N))-f(0))/(10^(-N));
    D_N_list = [D_N_list,D_N];
end
D_N_list
disp("As n increases, DN f(0) converges to 0 by the forward difference formula. This agrees with our actual value at f'(0).")
