function [ test_error ] = find_test_error( w, X, y )
%FIND_TEST_ERROR Find the test error of a linear separator
%   This function takes as inputs the weight vector representing a linear
%   separator (w), the test examples in matrix form with each row
%   representing an example (X), and the labels for the test data as a
%   column vector (y). The labels are assumed to be plus or minus one. The
%   function returns the error on the test examples as a fraction. The
%   hypothesis is assumed to be of the form (sign ( [1 x(n,:)] * w )

%d=10;
%w=[0;rand(d,1)];  %create a d+1 dimension weight vector(w)                

w=[0;w]
[N,d]=size(X);
A=ones(N,1);
%B=rand(d,d);
X1=[A,X];       %create test examples in matrix(X) with d*(d+1) dimension

%y=sign(-1+2*rand(d,1)); %create labels for the test data (y),[-1 +1]

s=X1*w;
j=1;
for i=1:N
h1(i)=exp(s(i))/(1+exp(s(i)));
if h1(i)>=0.5           %0.5 divide h from 0 to 1
    h(i)=1;
else
    h(i)=-1;
end
end

j=sum(h(1,:)'~=y(:,1));    %sum of different values between h and y

test_error=1/N*(sum(j));           %return the error on the test examples
 
end

