function [L, U, P] = luFactor(A)
    P=eye(length(A));
    L=zeros(length(A));
    U=A;
    if length(A)~=height(A)
        error('Not a square matrix')
    end
    for j=0:height(A)-2
        pivot=0;
        diff=0;
        for k=2:height(A)-j               
            if abs(U(k+j,1+j))-abs(U(1+j,1+j))>0 && abs(U(k+j,1+j))-abs(U(1+j,1+j))>diff
                pivot=k+j;
                diff=abs(U(k+j,1+j))-abs(U(1+j,1+j));
            end
        end 
        TempU=U;
        TempP=P;
        TempL=L;
        if pivot~=0
            U(1+j,:)=TempU(pivot,:);
            U(pivot,:)=TempU(1+j,:);
            P(1+j,:)=TempP(pivot,:);
            P(pivot,:)=TempP(1+j,:);
            if j>0
                L(1+j,:)=TempL(pivot,:);
                L(pivot,:)=TempL(1+j,:);
            end
        end   
        for i=2:length(U)-j
            if U(1+j,1+j)~=0
                L(i+j,1+j)=U(i+j,1+j)/U(1+j,1+j);
                U(i+j,:)=U(i+j,:)-U(1+j,:)*L(i+j,1+j);
            end
        end
    end
    for i=1:length(L)
        L(i,i)=1;
    end
end