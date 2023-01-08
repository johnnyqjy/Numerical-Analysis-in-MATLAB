function [app] = chebyshev_poly(aj,N)
app = 0;

for j=0:N
    poly = @(x) aj(j+1)*cos(j*acos(x));
    term = composite_simpson(poly,-1,1,50);
    app = app + term;
end

end

