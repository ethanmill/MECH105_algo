function [root, fx, ea, iter] = NewtonRaphson(func, xi, maxiter, es)
    fx=func;
    syms x;
    dfunc=matlabFunction(diff(func,x));
    disp(dfunc);
    if nargin<3
        maxiter=200;
    end
    if nargin<4
        es=0.01;
    end
    ea=100;
    iter=0;
    while ea>es
        iter=iter+1;
        xold=xi;
        xi=xold-func(xi)/dfunc(xi);
        ea=abs((xi-xold)/xi)*100;
        fprintf('Root Guess=%4.6f\n',xi);
        fprintf('Error=%4.4f\n\n',ea);
        root=xi;
        if iter>=maxiter
            error('Max iterations reached');
            break;
        end
    end
end

