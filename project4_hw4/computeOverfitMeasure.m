function [ overfit_m ] = computeOverfitMeasure( true_Q_f, N_train, N_test, var, num_expts )
%COMPUTEOVERFITMEASURE Compute how much worse H_10 is compared with H_2 in
%terms of test error. Negative number means it's better.
%   Inputs
%       true_Q_f: order of the true hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       var: variance of the stochastic noise
%       num_expts: number of times to run the experiment
%   Output
%       overfit_m: vector of length num_expts, reporting each of the
%                  differences in error between H_10 and H_2

g=[2 10];
sigma=var^0.5;
for t=1:num_expts
    [train_set test_set]=generate_dataset(true_Q_f,N_train,N_test,sigma);
   for n=1:2
       X_train=train_set(:,1);
       X_train=X_train';
       Y_train=train_set(:,2);
       %Y_train=Y_train';
       Z_train=computeLegPoly(X_train,g(n));
       Z_train=Z_train';
       w=glmfit(Z_train,Y_train,'normal','constant','off');
       H_train=Z_train*w;
       
       X_test=test_set(:,1);
       X_test=X_test';
       Y_test=test_set(:,2);
       %Y_test=Y_test';
       Z_test=computeLegPoly(X_test,g(n));
       Z_test=Z_test';
       H_test=Z_test*w;
       eout(n)=sum((H_test-Y_test).^2)/N_test;
   end
   overfit_m(t)=eout(2)-eout(1);
end      
       

end

