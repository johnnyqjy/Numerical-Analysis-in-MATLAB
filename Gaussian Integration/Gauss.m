function [g] = Gauss(f,a,b)
    y = -sqrt(3)/3;
    g1 = f((y+1)*(b-a)/2 +a);
    g11 = g1 * (b-a)/2;
    g2 = f((-y+1)*(b-a)/2 +a);
    g22 = g2 * (b-a)/2;

    g = g11+g22;
end

