function [ w e_in ] = logistic_reg( X, Y, max_its )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix
%       Y : data labels (plus or minus 1)
%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)
    
%d=10;N=15;
ita=0.00001;
%max_its=100;
%X=rand(N,d);                %create data matrix X. each row is a example

%Y=sign(-1+2*rand(N,1));  %create data labels (plus or minus 1)

[N,d]=size(X);

w(:,1)=zeros(d,1);       %initialize w , w(0) is a zero vector

t=1;

while(t<max_its)
%     for i=1:N
%         tmp1(i,:)=Y(i)*X(i,:);
%         tmp2(:,i)=1+exp(Y(i)*X(i,:)*w(:,t));
%         tmp(i,:)=tmp1(i,:)/tmp2(i);
%         tmpein(:,i)=log(1+exp(-Y(i)*X(i,:)*w(:,t)));
%      end
Y1=repmat(Y,1,13);
tmp1=X.*Y1;
tmp2=(Y1.*X)*w(:,1);
tmp3=1+exp(tmp2);
a=repmat(tmp3,1,13);
tmp=tmp1./(a);
tmpein=log(1+exp(-tmp2));
%tmp
%sum(tmp(:,1))
%tmpein
gt(1,:)=-1/N*sum(tmp);        %calculate the gradient
vt(1,:)=-gt(1,:);             %set the direction to move
e_in=1/N*sum(tmpein);         %calculate Ein
w1=w';
w1(1,:)=w1(1,:)+ita*vt(1,:);  %update the weight
w=w1';

t=t+1;
if gt<0.001
    break;
end

end
w=w(:,1)

end

