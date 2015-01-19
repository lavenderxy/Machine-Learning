%load the zip.train data, predict the probability that an image is a "1"
zip_train=load('zip.train');
[N,d]=size(zip_train);
Y=zip_train(:,1);
X=zip_train(:,2:d);
A=ones(N,1);
Y(Y~=1)=0;
w=glmfit(X,Y,'binomial');     %compute the weight vector w
X=[A,X];
s=X*w;
b=exp(s);
theta=b./(1+b);  %compute the probability
% if theta(i)>=0.5
%     theta(i)=1;
% else
%     theta(i)=0;
% end

%classify the data in zip.train and zip.test
p=theta;
p(p>=0.5)=1;
p(p<0.5)=0;

j=sum(p~=Y);
class_error=j/N

%for zip.test data
zip_test=load('zip.test');
[N1,d1]=size(zip_test);
Y1=zip_test(:,1);
X1=zip_test(:,2:d1);
Y1(Y1~=1)=0;
A1=ones(N1,1);
X1=[A1,X1];
s1=X1*w;
b1=exp(s1);
theta1=b1./(1+b1);
p1=theta1;
p1(p1>=0.5)=1;
p1(p1<0.5)=0;

j1=sum(p1~=Y1);
class_error1=j1/N1

%for features.train
features_train=load('features.train');
[N2,d2]=size(features_train);
Y2=features_train(:,1);
X2=features_train(:,2:d2);
Y2(Y2~=1)=0;
w2=glmfit(X2,Y2,'binomial');
A2=ones(N2,1);
X2=[A2,X2];
s2=X2*w2;
b2=exp(s2);
theta2=b2./(1+b2);
p2=theta2;
p2(p2>=0.5)=1;
p2(p2<0.5)=0;

j2=sum(p2~=Y2);
class_error2=j2/N2

%for features.test
features_test=load('features.test');
[N3,d3]=size(features_test);
Y3=features_test(:,1);
X3=features_test(:,2:d3);
Y3(Y3~=1)=0;
A3=ones(N3,1);
X3=[A3,X3];
s3=X3*w2;
b3=exp(s3);
theta3=b3./(1+b3);
p3=theta3;
p3(p3>=0.5)=1;
p3(p3<0.5)=0;

j3=sum(p3~=Y3);
class_error3=j3/N3





