function [ oobErr ] = BaggedTrees( X, Y, numBags )
%BAGGEDTREES Returns out-of-bag classification error of an ensemble of
%numBags CART decision trees on the input dataset, and also plots the error
%as a function of the number of bags from 1 to numBags
%   Inputs:
%       X : Matrix of training data
%       Y : Vector of classes of the training examples
%       numBags : Number of trees to learn in the ensemble
%
%   You may use "fitctree" but do not use "TreeBagger" or any other inbuilt
%   bagging function

%inbuilt function fitctree
%tree=fitctree(X,Y)
%returns a classification tree based on the input variables (also known as
%predictors, features, or attributes) X and output (response or labels)Y.
%The returned tree is a binary tree, where each branching node is split 
%based on the values of a column of X.

%tree=fitctree(X,Y,Name,Value)
%fits a tree with additional options specified by one or more name-value
%pair arguments. For example, you can specify the algorithm used to find
%the best split on a categorical predictor, grow a cross-validated tree, 
%or hold out a fraction of the input data for validation.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
datatrain=load('zip.train');
[N,d]=size(datatrain);
X=datatrain(:,2:d);
Y=datatrain(:,1);
numBags=50;

%bigtree=fitctree(X,Y);

%choose number 6 and 8 construct the data set.reasonable representation.
subsample = datatrain(datatrain(:,1)==6 | datatrain(:,1) == 8,:);
[Nsub,dsub]=size(subsample);
Ysub = subsample(:,1);
%Ysub(Ysub==6)=0;
%Ysub(Ysub==8)=1;
Xsub = subsample(:,2:dsub);
km=[];
Ysum=zeros(Nsub,1);

%%%%%%%problem 1 b)%%%%%
% Xsub=X;
% Ysub=Y;
% [Nsub,dsub]=size(Xsub);
% Ysum=zeros(Nsub,1);
%%%%%%%%%%%%%%%%%%%%%%%%

%bagging: sample m dataset of size |D| from D and learn m tree on those.
%extract training sample T ,number is same as D. replacement.
%T=randperm(N) %get a random out-of-order sequence from 1 to N, deal with
%problems without replacement.
for m=1:numBags
replacement=true;
i=randsample(Nsub,Nsub,replacement); %generate numbers from 1 to N,replace.
T=Xsub(i,:);     %generate training set T
Ysub1=Ysub(i,:);
traintree=fitctree(T,Ysub1);

%outBag=[X(1:(i-1),:);X((i+1):Nsub,:)];
%extract out of bag data 
j=unique(i);
n=1:Nsub;
n=n';
k=setdiff(n,j);
km=[km;k];
km=unique(km);
klen=length(km);
outbagdata=Xsub(k,:);
outbagvalue=Ysub(km,:);

Yout=predict(traintree,outbagdata);
Yout(Yout==6)=1;
Yout(Yout==8)=-1;
%vote majority
Ysum(k)=Ysum(k)+Yout;

Yoob=Ysum(km);
Yoob(Yoob>=0)=6;
Yoob(Yoob<0)=8;
% a=abs(outbagvalue-Yoob);
% b=a/2;
% c=sum(b);
error=sum((abs(outbagvalue-Yoob))/(8-6));
oobErr(m)=error/klen;


end
% Ysum(Ysum>=0)=6;
% Ysum(Ysum<0)=8;
% 
% error=sum(abs(Ysub-Ysum))/(8-6);
% oobErr=error/Nsub;

plot(oobErr);
xlabel('number of bag');
ylabel('out of bag error');
title('numBags=100');

end

