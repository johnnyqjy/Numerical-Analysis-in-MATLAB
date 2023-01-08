function [S] = adaptive_simpson(a,b,epsilon,N)
S=0;
i=1;
f = @(x) cos(2*x)*exp(-x);

%Initializing lists (N+1 elements just in case)
epsilon_list = zeros(1,N+1);
A = zeros(1,N+1);
h = zeros(1,N+1);
FA = zeros(1,N+1);
FC = zeros(1,N+1);
FB = zeros(1,N+1);
L = zeros(1,N+1);
S_list = zeros(1,N+1);

epsilon_list(i)=10*epsilon;
A(i)=a;
h(i)= (b-a)/2;
FA(i)=f(a);
FC(i)=f(a+h(i));
FB(i)=f(b);
S_list(i)= h(i)*(FA(i)+4*FC(i)+FB(i))/3;
L(i)=1;

while i>0
    FD = f(A(i)+h(i)/2);
    FE = f(A(i)+3*h(i)/2);
    S1 = h(i)*(FA(i)+4*FD+FC(i))/6;
    S2 = h(i)*(FC(i)+4*FE+FB(i))/6;
    v1 = A(i);
    v2 = FA(i);
    v3 = FC(i);
    v4 = FB(i);
    v5 = h(i);
    v6 = epsilon_list(i);
    v7 = S_list(i);
    v8 = L(i);
    
    i = i-1;
    if abs(S1+S2-v7)<v6
        S = S+S1+S2;
    else
        if v8 >= N
            disp('LEVEL EXCEEDED')
            return
        else
            i = i+1;
            A(i)=v1+v5;
            FA(i)=v3;
            FC(i)=FE;
            FB(i)=v4;
            h(i)=v5/2;
            epsilon_list(i)=v6/2;
            S_list(i)=S2;
            L(i)=v8+1;
            
            i=i+1;
            A(i)=v1;
            FA(i)=v2;
            FC(i)=FD;
            FB(i)=v3;
            h(i)=h(i-1);
            epsilon_list(i) = epsilon_list(i-1);
            S_list(i)=S1;
            L(i)=L(i-1);
        end
    end
end

end

