%Problem 1:
A = [2 -1 1;2 2 2;-1 -1 2];
b = [-1;4;-5];
XO = zeros(3,1);
n = 3;
N = 25;
TOL = 10^-3;

J = jacobi(n,A,b,XO,TOL,N)
GS = gauss_seidel(n,A,b,XO,TOL,N)
%The Jacobian method didn't converge in 25 iterations, but the
%Gauss-Seidel method did

T_J = [1/2 0 0;0 1/2 0;0 0 1/2]*[0 1 -1;-2 0 -2;1 1 0] %D_inv*(L+U)
D_minus_L = [2 0 0;2 2 0;-1 -1 2];
T_GS = find_inverse(3,D_minus_L)*[0 1 -1;0 0 -2;0 0 0] %(D-L)_inv*U
%a)The exact solution is x1=1, x2=2, x3=-1

%b)The eigenvalues are 2,2+sqrt(5)*i,2-sqrt(5)*i
% For lambda=2, the eigenvector is [-1;1;1]
% For lambda=2+sqrt(5)*i, the eigenvector is [2-sqrt(5)*i;-2-sqrt(5)*i;3]
% For lambda=2-sqrt(5)*i, the eigenvector is [2+sqrt(5)*i;-2+sqrt(5)*i;3]

%c)The eigenvalues of T of the jacobi method are 0,sqrt(5)*i/2,-sqrt(5)*i/2
% Then the spectral radius is the maximum of the eigenvalues, which is sqrt(5)*i/2
% The eigenvalues of T of the gauss seidel method are 0,-0.49999999,-0.5
% The spectral radius of T_GS is 0.5

%Problem 2:
A2 = [1 2 -2;1 1 1;2 2 1];
b2 = [7;2;5];

J_2 = jacobi(n,A2,b2,XO,TOL,N)
GS_2 = gauss_seidel(n,A2,b2,XO,TOL,N)
%The Jacobian method converged under 25 iterations, but the Gauss-Seidel
%method did not.

T_J_2 = [1 0 0;0 1 0;0 0 1]*[0 -2 2;-1 0 -1;-2 -2 0] %D_inv*(L+U)
D_minus_L_2 = [1 0 0;1 1 0;2 2 1];
T_GS_2 = find_inverse(3,D_minus_L_2)*[0 -2 2;0 0 -1;0 0 0] %(D-L)_inv*U
%a) The exact solution is x1=1, x2=2, x3=-1

%b) The eigenvalue is 1 with multiplicity of 3
% The eigenvector is [-1;1;1]

%c) The eigenvalue of T_J is 0, then the spectral radius is 0
% The eigenvalues of T_GS are 0 and 2, then the spectral radius is 2
