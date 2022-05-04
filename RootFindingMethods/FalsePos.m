function [root, fx, ea, iter] = FalsePos(func,xl,xu,es,maxit,varargin)
    if nargin<5 % When there is less than 4 arguements assume maxiter is 200
        maxit=200;
    end
    if nargin<4 %When there is less than 5 arguements just assume es=0.0001
        es=0.0001;
    end
    if xl>=xu % Check if the dumbass put the same number for both or the lower bound if greater than the upper bound
        error('Lower bound must be lower than upper bound');
    end
    if func(xl)*func(xu)==0 % Check if one bound is actually the root and display the correct bound for the root
        if func(xl)==0
            root=xl;
            return
        else
            root=xu;
            return
        end
    elseif func(xl)*func(xu)>0 % Check for a sign change if there isn't one that means there isn't a root between the bounds
        error('Bounds do not contain root');
    end

    ea=100;
    xg=xl;
    iter=0;
    done=0;
    while ea>=es && done~=1
        iter=iter+1;
        xold=xg;
        xg=xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)); %False position
        if func(xg)<0 %If the middle guess is negative set the lower bound to the middle
            xl=xg;
        elseif func(xg)>0 %If the middle guess is positive set the upper bound to the middle
            xu=xg;
        else
            done=1; %If it is 0 then you found the root hurray
        end

        if iter>=maxit %Make sure you don't go over the max iterations and display the current root guess
            fprintf('Root Guess=%4.6f\n',xg);
            print()
            done=1;
        end
        ea=abs((xg-xold)/xg)*100;
        fprintf('FValue=%4.6f\n',func(xg));
        fprintf('Root Guess=%4.6f\n',xg);
        fprintf('Error=%4.2f\n\n',ea);
    end
    root=xg;
    fx=func(root);
end
