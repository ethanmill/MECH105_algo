%Function f(x)=-0.9x^2+1.7x+2.5
%f1,h f2,h f3,h f1,v f2,v f3,v
function [root, fx, ea, iter] = Secant(func,x0,x1,es,maxit)
    fx=func;
    if nargin<5
        maxit=100;
    end
    if nargin<4
        es=0.01;
    end
    ea=100;
    iter=0;
    while ea>es
        iter=iter+1;
        xold=x0;
        xg=x1-func(x1)*(x1-x0)/(func(x1)-func(x0));
        ea=abs((xg-xold)/xg)*100;
        fprintf('f(x0)=%4.6f\n',func(x0));
        fprintf('f(x1)=%4.6f\n',func(x1));
        fprintf('Root Guess=%4.6f\n',xg);
        fprintf('Error=%4.2f\n\n',ea);
        root=xg;
        x0=x1;
        x1=xg;
        if iter>maxit
            error('Max iterations reached');
            break;
        end
    end
end