cleveland_train=csvread('cleveland-train.csv',1);
X=cleveland_train(:,1:13);
Y=cleveland_train(:,14);
Y(Y==0)=-1;
max_its=10000;
[ w e_in ] = logistic_reg( X, Y, max_its )
