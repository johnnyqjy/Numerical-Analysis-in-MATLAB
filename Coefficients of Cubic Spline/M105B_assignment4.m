clear
X=[-2.4061 -1.0830 -0.6440 -0.4068 -0.2448 -0.1158 0 0.1158 0.2448 0.4068 0.6440 1.0830 2.4061];
Y=[-0.3984 -0.7611 -0.9688 -0.9791 -0.7899 -0.4397 0 0.4397 0.7899 0.9791 0.9688 0.7611 0.3984];
n = length(X)-1;
[a,b,c,d] = coeff_of_cubic_spline(X,Y);
z=linspace(-2,2,10);
S = []; %Later we store S(z) into this list

subplot(3,1,1)
for j = 1:n
    %Plotting the cubic spline using blue
    X_temp = linspace(X(j),X(j+1),100); %100 points per interval
    S_x = @(x) a(j)+b(j)*(x-X(j))+c(j)*(x-X(j))^2+d(j)*(x-X(j))^3;
    Y_temp=[];
    for i=X_temp
        Y_temp= [Y_temp,S_x(i)];
    end
    plot(X_temp,Y_temp,'linewidth',2,'color','b')
    hold on
    
    %Plotting the points (x, s(x)) using black circles
    plot(X(j),Y(j),'ko');
    if j==n
        plot(X(j+1),Y(j+1),'ko'); %The end point.
    end
    hold on
    
    %Plotting the points (z, s(z)) using red circles
    for i=z
        if i >= X(j) && i < X(j+1)
            plot(i,S_x(i),'ro')
            hold on
        end
    end
end
title('Cubic Spline')
legend('Curve','x','z')

subplot(3,1,2)
for j=1:n
    %Plotting the cubic spline using blue
    X_temp = linspace(X(j),X(j+1),100);
    S_x = @(x) a(j)+b(j)*(x-X(j))+c(j)*(x-X(j))^2+d(j)*(x-X(j))^3;
    Y_temp=[];
    for i=X_temp
        Y_temp= [Y_temp,S_x(i)];
    end
    plot(X_temp,Y_temp,'linewidth',2,'color','b')
    hold on
    
    %Plotting the points (z, s(z)) using blue circles
    for i=z
        if i >= X(j) && i < X(j+1)
            S=[S,S_x(i)];
            plot(i,S_x(i),'bo')
            hold on
        end
    end
    
end

X_temp = linspace(-2.4061,2.4061,1200); %1200 points to match our 100 pts per interval previously.
Y_temp = [];
for i = X_temp
    Y_temp= [Y_temp, f_lagrange(X,Y,i)];
end
%Plotting the Lagrange polynomial using red
plot(X_temp,Y_temp,'linewidth',2,'color','r')
hold on

%Plotting the points (z, P(z)) using red circles 
for i=z
    plot(i,f_lagrange(X,Y,i),'ro')
end
title('Cubic Spline(blue) vs. Lagrange(red)')
axis([-2.5 2.5 -10 10])

% Only 4 points of z for Lagrange polynomial match with the cubic spline interpolant in the middle. 
% Other than the middle part, the Lagrange polynomial
% seems to be very inaccurate near both ends of the interval, where it
% spikes to around +2000 and -2000.

subplot(3,1,3)
for j=1:n
    %Plotting the cubic spline using blue
    X_temp = linspace(X(j),X(j+1),100);
    S_x = @(x) a(j)+b(j)*(x-X(j))+c(j)*(x-X(j))^2+d(j)*(x-X(j))^3;
    Y_temp=[];
    for i=X_temp
        Y_temp= [Y_temp,S_x(i)];
    end
    plot(X_temp,Y_temp,'linewidth',2,'color','b')
    hold on
    
    %Plotting the points (z, s(z)) using blue circles
    for i=z
        if i >= X(j) && i < X(j+1)
            plot(i,S_x(i),'bo')
            hold on
        end
    end
    
end

f = @(x) x/(1/4+x^2);
X_temp = linspace(-2.4061,2.4061,1200); %1200 points to match our 100 pts per interval previously.
Y_temp = [];
for i = X_temp
    Y_temp= [Y_temp,f(i)];
end
%Plotting the actual function using red
plot(X_temp,Y_temp,'linewidth',2,'color','r')
hold on

%Plotting the points (z, f(z)) using red circles 
for i=z
    plot(i,f(i),'ro')
end
title('Cubic Spline(blue) vs. Actual Function(red)')
%The actual function covers up the cubic spline function, that means they
%match exactly.

error = [];
for i=1:10
    error= [error, abs(f(z(i))-S(i))];
end
maximum_error = max(error)

%The 4th derivative of f is -1536x(-16x^4+40x^2-5)/((4x^2+1)^5)
%The maximum is 312+180*sqrt(3) on [-2,2]
M = 312+180*sqrt(3);
theoretical_error = 5*M/384*(2.4061-1.083)^4
