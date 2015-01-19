cleveland_test=csvread('cleveland-test.csv',1);
X=cleveland_test(:,1:13);
Y=cleveland_test(:,14);
Y(Y==0)=-1;
max_its=1000000;

[ test_error ] = find_test_error( w, X, Y )