datatrain=load('zip.train');[N,d]=size(datatrain);
X=datatrain(:,2:d);
Y=datatrain(:,1);
subsample = datatrain(datatrain(:,1)==3 | datatrain(:,1) == 5,:);
[Nsub,dsub]=size(subsample);
Ysub = subsample(:,1);
Xsub = subsample(:,2:dsub);
datatest=load('zip.test');
[N1,d1]=size(datatest);
subtest=datatest(datatest(:,1)==3 | datatest(:,1) == 5,:);
[Nsub1,dsub1]=size(subtest);
Ysub1 = subtest(:,1);
Xsub1 = subtest(:,2:dsub1);
Ysum=zeros(Nsub1,1);

%%%%%%%% single tree%%%%%%%%%%
% traintree=fitctree(Xsub,Ysub);
% Ytest=predict(traintree,Xsub1);
% error=sum((abs(Ysub1-Ytest))/(5-3));
% test_error=error/Nsub1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%200 times%%%%%%%%%%
for m=1:200
k=1:Nsub1;
k=k';

replacement=true;
i=randsample(Nsub,Nsub,replacement); %generate numbers from 1 to N,replace.
T=Xsub(i,:);     %generate training set T
Ysub2=Ysub(i,:);
traintree=fitctree(T,Ysub2);

Ytest=predict(traintree,Xsub1);
Ytest(Ytest==1)=1;
Ytest(Ytest==3)=-1;

Ysum(k)=Ysum(k)+Ytest;
Ysum1=Ysum;
Ysum1(Ysum1>=0)=1;
Ysum1(Ysum1<0)=3;

error=sum((abs(Ysub1-Ysum1))/(3-1));
test_error=error/Nsub1;


end
%%%%%%%%%%%%%%%%%%%%%%%%%%



