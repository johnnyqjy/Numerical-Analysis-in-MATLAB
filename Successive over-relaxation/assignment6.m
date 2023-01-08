A = [4 -1 0;-1 4 -1;0 -1 4];
b = [-1;4;-5];
XO = zeros(3,1);
n = 3;
N = 25;
TOL = 10^-3;

GS = gauss_seidel(n,A,b,XO,TOL,N)
%a)The exact solution is x1=-0.0714, x2=0.7143, x3=-1.0714

%b)Show that the matrix is symmetric and positive definite
if A.' == A
    disp('Matrix A is symmetric')
end

if GS.'*A*GS >0 %GS is vector x here
    disp('Matrix A is positive definite')
end

D_minus_L = [4 0 0;-1 4 0;0 -1 4];
T_GS = find_inverse(3,D_minus_L)*[0 1 0;0 0 1;0 0 0] %(D-L)_inv*U where the inverse is computed using the function in assignment 4
%c)The eigenvalues for T_GS are 0,(0.125+sqrt(0.0156))/2,(0.125-sqrt(0.0156))/2
%Then the spectral radius of T_GS is (0.125+sqrt(0.0156))/2.
rho_T_GS = (0.125+sqrt(0.0156))/2; 
w_star = 2/(1+sqrt(1-rho_T_GS))
%Thus the optimal value of w is 1.0334.

%d)Based on the formula, the spectral radius of T_w_star is w_star - 1,
%which is 0.0334

%e)
[x,iteration_table] = SOR_iterative(n,A,b,XO,w_star,TOL,N) 
[x1,iteration_table1] = SOR_iterative(n,A,b,XO,w_star/2,TOL,N)
[x2,iteration_table2] = SOR_iterative(n,A,b,XO,w_star*2,TOL,N)
%Using the optimal choice w_star, I was able to get the solution in 5
%iterations.

%Using w_star/2, it converges in 11 iterations, which is roughly 2 times slower
%than w_star as expected. 

%Using 2*w_star, it doesn't converge in 25 iterations or even with a larger
%maximum iteration. It makes sense because 2*w_star is greater than 2. The
%relaxation parameter has to be between 0 and 2 for it to converge based on
%one of the theorems.