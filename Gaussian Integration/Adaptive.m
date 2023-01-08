function [S] = Adaptive(f,a,b,tol,level,N)
    level = level+1;
    One_Gauss = Gauss(f,a,b);
    c = (a+b)/2;
    Two_Gauss = Gauss(f,a,c)+Gauss(f,c,b);
        
    if level>N
        disp('Error: Max Depth Reached')
        return
    else
        if abs(One_Gauss-Two_Gauss)<tol
            S = Two_Gauss;
            zz = '[%f,%f]; contribution=%f ;level=%d\n';
            fprintf(zz,a,b,S,level);
        else
            s1 = Adaptive(f,a,c,tol,level,N);
            s2 = Adaptive(f,c,b,tol,level,N);
            S = s1 + s2;
        end
    end
end

