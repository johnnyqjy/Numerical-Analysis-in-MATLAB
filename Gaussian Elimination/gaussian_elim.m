function [x] = gaussian_elim(n,A)
%initial values:
x = zeros(1,n);
p = 0;
sum = 0; %Summation in step 9 later

for i=1:n-1
    for x=i:n
        if A(x,i)~=0
            p=x;
            break
        end
    end
    
    if p == 0 %If we haven't change the value of p.
        disp("no unique solution")
        return
    end
    
    if p ~= i
        temp = A(p,:);
        A(p,:) = A(i,:);
        A(i,:) = temp;
    end
    
    for j = i+1:n
        m = A(j,i)/A(i,i);
        A(j,:) = A(j,:)-m*A(i,:);
    end
end

if A(n,n) == 0
    disp("no unique solution exists")
    return
end

x(n) = A(n,n+1)/A(n,n); %We replace the zero in the n-th entry of X by this value.

for i=n-1:-1:1
    for j = i+1:n
        sum = sum + A(i,j)*x(j);
    end
    x(i)=(A(i,n+1) - sum)/A(i,i);
    sum=0; %This resets the sum for each for loop.
end

A %displays the reduced matrix after gaussian elimination
end

