clear
A = [1,-1,2,-1;2,-2,3,-3;1,1,1,0;1,-1,4,3];
[A_inv,A_Augment_I_RREF] = find_inverse(4,A)
check1 = A*A_inv
check2 = A_inv*A
