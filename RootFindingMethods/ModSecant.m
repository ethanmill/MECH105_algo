%Function f(x)=-0.9x^2+1.7x+2.5

function [root, fx, ea, iter] = ModSecant(func,xi,g,maxiter,es)
    fx=func;
    if nargin<4
        maxiter=100;
    end
    if nargin<5
        es=0.01;
    end
    ea=100;
    iter=0;
    while ea>es
        iter=iter+1;
        xold=xi;
        fprintf('f(xi)=%4.6f\n',func(xi));
        fprintf('f(xi+gxi)=%4.6f\n',func(xi+g*xi));
        xi=xi-(func(xi)*g*xi)/(func(xi+g*xi)-func(xi));
        ea=abs((xi-xold)/xi)*100;
        fprintf('Root Guess=%4.6f\n',xi);
        fprintf('Error=%4.2f\n\n',ea);
        root=xi;
        if iter>maxiter
            error('Max iterations reached');
            break;
        end
    end
end