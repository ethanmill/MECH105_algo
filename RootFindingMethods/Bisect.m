function [root, fx, ea, iter] = Bisect(func,xl,xu,es,maxiter)
    bl=xl;
    bu=xu;
    fx=func;
    if nargin<5 % When there is less than 5 arguements assume maxiter is 200
        maxiter=200;
    end
    if nargin<4 %When there is less than 4 arguements just assume es=0.0001
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
        return
    end

    ea=100;
    xg=xl;
    iter=0;
    while ea>es
        iter=iter+1;
        xold=xg;
        xg=(xl+xu)/2; %Bisect
%         xg=xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)); %False position
        if func(xg)<0 %If the middle guess is negative set the lower bound to the middle
            xl=xg;
        elseif func(xg)>0 %If the middle guess is positive set the upper bound to the middle
            xu=xg;
        else
            root=xg; %If it is 0 then you found the root hurray
            return
        end

%         clf; % Just some stuff to watch it as it goes don't post
%         hold on;
%         fplot(func,'blue');
%         fplot(0,'red');
%         plot(xg,func(xg),'ko');
%         axis([bl,bu,-1,2]);
%         hold off;
%         pause(0.001);

        root=xg;
        if iter>=maxiter %Make sure you don't go over the max iterations and display the current root guess
            fprintf('Root Guess=%4.6f\n',xg);
            error('Max iterations reached');
            break;
        end
        ea=abs((xg-xold)/xg)*100;
        fprintf('FValue=%4.2f\n',func(xg));
        fprintf('Root Guess=%4.6f\n',xg);
        fprintf('Error=%4.2f\n\n',ea);
    end
end
