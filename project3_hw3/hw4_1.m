data=csvread('cleveland-train.csv',1);

[N,d_all]=size(data);
d=d_all-1;
X=data(:,1:d);
Y=data(:,d_all);
Y(Y==0)=-1;
X=zscore(X);
[ w e_in t1] = logistic_regHW4( X, Y);
[ test_error ] = test_error( w, X, Y );


% %train model by glmfit
% Y2=data(:,d_all);
% B=glmfit(X,Y2,'binomial');
% for n=1:N
%     h(n,:)=sign([1 X(n,:)]*B);
% end
% errinB=sum(h~=Y)/N