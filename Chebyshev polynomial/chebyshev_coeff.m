function [a_j] = chebyshev_coeff(f,a,b,N)
% phi_j = @(x,j) cos(j*acos(x));
% w_x = @(x) 1/sqrt(1-x^2);
% we sub in x = cos(theta)
    a_j = zeros(1,N+1);
    
    for j=0:N
        % numerator_funct = @(x) 1/sqrt(1-cos(x)^2)*cos(j*acos(cos(x)))*f(cos(x))*-sin(x);
        % Then it can be simplified to:
        numerator_funct = @(x) -cos(j*x)*f(cos(x));
        numerator = composite_simpson(numerator_funct,acos(a),acos(b),50); %50 subintervals
        
        %denominator_funct = @(x) 1/sqrt(1-cos(x)^2)*(cos(j*acos(cos(x))))^2*-sin(x);
        denominator_funct = @(x) -cos(j*x)^2;
        denominator = composite_simpson(denominator_funct,acos(a),acos(b),50);
        
        a_j(j+1) = numerator/denominator;
    end
end
