clear
n=3;
X=linspace(1,2.9,n);
Y=1./X;
f = @(x) 1/x;
p3 = f_lagrange(X,Y,3);
difference = f(3)-p3
%2)-0.0124 is the difference f(3)-P(3).

%3)The plot of |f(3)-P(3)| versus n
subplot(2,1,1)

absolute_difference = [];
temp_list = [3,4,5,6];
for n = temp_list
    X=linspace(1,2.9,n);
    Y=1./X;
    absolute_difference = [absolute_difference, abs(f(3)-f_lagrange(X,Y,3))];
end
plot(temp_list,absolute_difference,'O')
title ('Difference |f(3)-P(3)| Versus n')
xlabel (' n')
ylabel ('|f(3)-P(3)| ')


%4)The plot showing the exact function and the Lagrange interpolants using n=3, 4 and 6.
subplot(2,1,2)

N = [3 4 6];
for q = N
    X = linspace(1,2.9,q);
    Y = 1./X;
    x = linspace(1,3,100);
    for i = 1:100
        y(i) = f_lagrange(X,Y,x(i));
    end  
    if q == 3
        plot(x,y,'linewidth',2,'color','b')
        hold on
    end
    if q == 4
        plot(x,y,'linewidth',2,'color','g')
        hold on
    end
    if q == 6
        plot(x,y,'linewidth',2,'color','k')
        hold on
    end
end

plot(x,1./x,'-r','linewidth',2)
legend('n=3','n=4','n=6','actual');
title('The Exact Function f(x)=1/x and the Lagrange Interpolants');
xlabel('x');
ylabel('function values');
