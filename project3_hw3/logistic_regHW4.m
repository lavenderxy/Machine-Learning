function [ w e_in t1] = logistic_regHW4( X, Y)
ita=0.0001;
thres=0.00001;

[N,d]=size(X);

A=ones(N,1);
X=[A,X];
t=1;
gt(1,:)=ones(1,d+1);
termi=sum(abs(gt(1,:))>thres);
d=d+1;

w(:,1)=zeros(d,1);       %initialize w , w(0) is a zero vector



while(termi)
Y1=repmat(Y,1,d);
tmp1=X.*Y1;
tmp2=(Y1.*X)*w(:,1);
tmp3=1+exp(tmp2);
a=repmat(tmp3,1,d);
tmp=tmp1./(a);
tmpein=log(1+exp(-tmp2));

gt(1,:)=-1/N*sum(tmp);        %calculate the gradient
vt(1,:)=-gt(1,:);             %set the direction to move
e_in=1/N*sum(tmpein);         %calculate Ein
w1=w';
w1(1,:)=w1(1,:)+ita*vt(1,:);  %update the weight
w=w1';

t=t+1;
%if gt<0.001
%    break;
%end
termi=sum(abs(gt(1,:))>thres);

end
%w=w(:,1)
t1=t;

end