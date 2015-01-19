function [ z ] = computeLegPoly( x, Q )
%COMPUTELEGPOLY Return the Qth order Legendre polynomial of x
%   Inputs:
%       x: vector (or scalar) of reals in [-1, 1]
%       Q: order of the Legendre polynomial to compute
%   Output:
%       z: matrix where each column is the Legendre polynomials of order 0 
%          to Q, evaluated atthe corresponding x value in the input


%generate legendre polynomial
%x=x';
l(1,:)=x;
l(2,:)=0.5*(3*x(1,:)*x(1,:)'-1);

if Q>=3
    for i=3:Q
        l(i,:)=((2*i-1)/i)*x.*l(i-1,:)-((i-1)/i)*l(i-2,:);
    end
end


x_col=size(x,2);
A=ones(1,x_col);         %order0, l(0,:)=1;

z=[A;l(1:Q,:)];

end

