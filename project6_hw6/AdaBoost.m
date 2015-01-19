function [ train_err, test_err ] = AdaBoost( X_tr, y_tr, X_te, y_te, n_trees )
%AdaBoost: Implement AdaBoost using decision stumps learned
%   using information gain as the weak learners.
%   X_tr: Training set
%   y_tr: Training set labels
%   X_te: Testing set
%   y_te: Testing set labels
%   n_trees: The number of trees to use

datatrain=load('zip.train');
datatest=load('zip.test');

m=1;n=3;
subsample_train=datatrain(datatrain(:,1)==m | datatrain(:,1)==n,:);
subsample_test=datatest(datatest(:,1)==m | datatest(:,1)==n,:);
[N1,d1]=size(subsample_train);
[N2,d2]=size(subsample_test);


y_tr=subsample_train(:,1);
x_tr=subsample_train(:,2:d1);
y_te=subsample_test(:,1);
x_te=subsample_test(:,2:d2);
n_trees=30;

%[N3,d3]=size(subsample_train);

distr=ones(1,N1)/N1;
o=1:N1;
in=zeros(n_trees,1);
 
for t=1:n_trees
%get the whole HS
%y=zeros(N3,1);
y=y_tr;
y(y==m)=1;
y(y==n)=0;
p=distr(t,:)*y;
p1=1-p;
HS=-p*log2(p)-p1*log2(p1);
HS(isnan(HS))=0;
% if HS==NaN
%     HS=0;
% end
%Ing=0;
%Ingmax=[];
%calculate information gain for each feature
for i=1:(d1-1)
   
    x1=unique(x_tr(:,i));
    x1=sort(x1);
    len1=size(x1,1);     %r=size(A,1)returns row number, size(A,2) column.
%choose split value in the range 1:len1  
    lent(i)=len1;
    Ing=0;
%for j=1:len1
for j=1:(len1-1)
    %spl_val=x1(j);
    spl_val(j)=(x1(j)+x1(j+1))/2;
     x_tr1=zeros(N1,1);
     x_tr2=zeros(N1,1);
     %index1=zeros(N1,1);
     %index2=zeros(N1,1);
     
     index1=find(x_tr(:,i)<spl_val(j));
     index2=find(x_tr(:,i)>=spl_val(j));
    
     %Split the data into two parts
     x_tr1(index1,1)=1;
     x_tr2(index2,1)=1;
     wx_tr1=distr(t,:)*x_tr1;
     wx_tr2=distr(t,:)*x_tr2;
     y_tr1=y_tr(index1);
     y_tr2=y_tr(index2);
     
     %calculate hs1 for the first part
     %y2=zeros(N3,1);
     y2=y_tr1;
     y2(y2==m)=1;
     y2(y2==n)=0;
     
%      distmp=distr(t,index1);
%      stmp=sum(distmp);
%      distmp=distmp./stmp;
     
     p2=distr(t,index1)*y2;
     %p2=distr(t,:)*y2;
     %p2=distr(t,:)*x_tr1;
%      y3=zeros(N3,1);
%      y3=y_tr1;
%      y3(y3==n)=1;
%      y3(y3==m)=0;
%      p3=distr(index1)*y3;  
     y8=y_tr1;y8(y8==m)=0;y8(y8==n)=1;
     p3=distr(t,index1)*y8;
     HS1=-p2*log2(p2)-p3*log2(p3);
     HS1(isnan(HS1))=0;
%      if HS1==NaN
%          HS1=0;
%      end
     
     %calculate hs2 for the second part
     %y4=zeros(N3,1);
     y4=y_tr2;
     y4(y4==m)=1;
     y4(y4==n)=0;
     p4=distr(t,index2)*y4;
%      y5=zeros(N3,1);
%      y5=y_tr2;
%      y5(y5==n)=1;
%      y5(y5==m)=0;
%      p5=distr(index2)*y5; 
   y9=y_tr2;y9(y9==m)=0;
   y9(y9==n)=1;
     p5=distr(t,index2)*y9;
     HS2=-p4*log2(p4)-p5*log2(p5);
     HS2(isnan(HS2))=0;
%      if HS2==NaN
%          HS2=0;
%      end
     
     Ing(j)=HS-(wx_tr1*HS1+wx_tr2*HS2);
    
end

% [Ingmax jmax]=max(Ing1);
[Ingmax(i,1) indmax(i,1)]=max(Ing);
%show the split value
splitval(i,1)=spl_val(indmax(i,1));
[finalmax(t) imax(t)]=max(Ingmax);

end

y_pre(:,t)=zeros(N1,1);
y_pre(find(x_tr(:,imax(t))>=splitval(imax(t))),t)=m;
y_pre(find(x_tr(:,imax(t))<splitval(imax(t))),t)=n;
errnum=find(y_pre(:,t)~=y_tr);
error(t)=size(errnum,1)/N1;
ee(t)=sum(distr(t,errnum));
if ee(t)>0.5
    in(t)=1;
    L1=size(y_pre(:,t),1);
    v=unique(y_pre(:,t));
    i1=find(y_pre(:,t)==v(1));
    i2=find(y_pre(:,t)==v(2));
    y_pre(i1,t)=v(2);
    y_pre(i2,t)=v(1);
    errnum=find(y_pre(:,t)~=y_tr);
    error(t)=size(errnum,1)/N1;
end

ee(t)=sum(distr(t,errnum));
alpha(t)=log((1-ee(t))/ee(t))/2
t1=t+1;
distr(t1,errnum)=distr(t,errnum)*exp(alpha(t));
distr(t1,setdiff(o,errnum))=distr(t,setdiff(o,errnum))*exp(-1*alpha(t));
z(t)=1/sum(distr(t1,:));
distr(t1,:)=distr(t1,:)*z(t);

y_vote=zeros(N1,1);
y_pre(find(y_pre(:,t)==m),t)=1;
y_pre(find(y_pre(:,t)==n),t)=-1;
ut=repmat(alpha,N1,1);
y_pre1=y_pre.*ut;
y_vote=sum(y_pre1,2);
yfinal=sign(y_vote);
yfinal(find(yfinal==1))=m;
yfinal(find(yfinal==-1))=n;
train_err(t)=sum(yfinal~=y_tr)/N1

%test the data

%y_tespre(:,t)=zeros(N2,1);
if in(t)==0
y_tespre(find(x_te(:,imax(t))>=splitval(imax(t))),t)=m;
y_tespre(find(x_te(:,imax(t))<splitval(imax(t))),t)=n;
end
if in(t)==1
y_tespre(find(x_te(:,imax(t))>=splitval(imax(t))),t)=n;
y_tespre(find(x_te(:,imax(t))<splitval(imax(t))),t)=m;    
end
%errnum1=find(y_tespre(:,t)~=y_te);
% error1=size(errnum1,1)/N2;
% y_tespre1=y_tespre;
% if error1>0.5
%     in(t)=1;
%     L11=size(y_tespre(:,t),1);
%     v1=unique(y_tespre(:,t));
%     y_tespre1=zeros(L11,1);
%     i11=find(y_tespre(:,t)==v1(1));
%     i21=find(y_tespre(:,t)==v1(2));
%     y_tespre1(i11,1)=v1(2);
%     y_tespre1(i21,1)=v1(1);
%     %errnum1=find(y_tespre(:,t)~=y_te);
%     %error1(t)=size(errnum1,1)/N2;
%     y_tespre(:,t)=y_tespre1;
% end
y_vote1=zeros(N2,1);
ut1=repmat(alpha,N2,1);
y_tespre(find(y_tespre(:,t)==m),t)=1;
y_tespre(find(y_tespre(:,t)==n),t)=-1;
y_tespre2=y_tespre.*ut1;
y_vote1=sum(y_tespre2,2);
yfinal1=sign(y_vote1);
yfinal1(find(yfinal1==1))=m;
yfinal1(find(yfinal1==-1))=n;
test_err(t)=sum(yfinal1~=y_te)/N2

end

figure;
plot(train_err);
xlabel('number of trees');
ylabel('training error');
title('3-vs-5 number of trees=30');

figure;
plot(test_err);
xlabel('number of trees');
ylabel('test error');
title('3-vs-5 number of trees=30');


end

