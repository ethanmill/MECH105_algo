function [I] = Simpson(x,y)
    if length(x)~=length(y)
        error('inputs must be same length');
    end
    if abs(ones(1,length(x)-1)-(x(2:length(x))-x(1:length(x)-1))/(x(2)-x(1)))<1e-14;else
        error('All x values must be uniformly spaced');
    end
    truex=x;
    truey=y;
    if mod(length(truex),2)==0 && length(x)>2 %If there is an odd # of intervals
        x=x(1:length(truex)-1);
        y=y(1:length(truey)-1);
    end
    I=0;
    if length(x)==2 || length(truex)~=length(x) %Trapaziod rule
        warning('Using trapazoid rule for this data set');
        I=(truex(length(x))-truex(length(x)-1))*(truey(length(x))+truey(length(x)-1))/2;
    end
    if length(x)==3
        I=(x(length(x))-x(1))*(y(1)+4*y(2)+y(3))/6;
    end
    if length(x)>3 %Composite Simpson 1/3
        I=I+(x(length(x))-x(1))*(y(1)+4*sum(y(2:2:length(x)-1))+2*sum(y(3:2:length(x)-1))+y(length(x)))/(3*(length(x)-1));
    end
end