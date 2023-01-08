function [inv_A,A_Augment_I_RREF] = find_inverse(n,A)
A = [A,eye(n)]; % Reassign A to be the augmented matrix with identity matrix added
p = 0;

for i=1:n
    for x=i:n
        if A(x,i)~=0
            p=x;
            break
        end
    end
    
    if p == 0 %If we haven't change the value of p.
        disp("not invertible")
        return
    end
    
    if p ~= i
        temp = A(p,:);
        A(p,:) = A(i,:);
        A(i,:) = temp;
    end
    
    loop_array = [1:i-1,i+1:n]; 
    for j = loop_array
        m = A(j,i)/A(i,i);
        A(j,:) = A(j,:)-m*A(i,:);
    end
end

if A(n,n) == 0
    disp("Matrix not invertible")
    return
end

for j = 1:n
    A(j,:) = A(j,:)/A(j,j);
end

A_Augment_I_RREF = A;
inv_A = A(:,[n+1:2*n]);

end