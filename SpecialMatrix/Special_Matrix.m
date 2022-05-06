function [A] = Special_Matrix(n,m)
if nargin ~=2
    error('Needs 2 inputs');
end
A = zeros(n,m);
A(1,:)=1:m;
A(:,1)=1:n;
for i=2:m
    for j=2:n
        A(j,i)=A(j-1,i)+A(j,i-1);
    end
end 
end
