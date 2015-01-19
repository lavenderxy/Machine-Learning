function [ train_set test_set ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair


%generate uniform input dataset
X_train=unifrnd(-1,1,1,N_train);
X_test=unifrnd(-1,1,1,N_test);

%generate aq, independently from a standard nomal
aq_train=randn(1,Q_f+1);
aq_test=randn(1,Q_f+1);

%normalize f
for q=0:Q_f
    N_tmp(q+1)=1/(2*q+1);
end
N=(sum(N_tmp))^0.5;
aq_train=aq_train/N;
aq_test=aq_test/N;

%generate Lq(x)
Z_train=computeLegPoly(X_train,Q_f);
Z_test=computeLegPoly(X_test,Q_f);

%calculate target function
fx_train=aq_train*Z_train;
fx_test=aq_test*Z_test;

%generate en, standard normal random variates
en_train=randn(1,N_train);
en_test=randn(1,N_test);

%calculate yn
yn_train=fx_train+sigma*en_train;
yn_test=fx_test+sigma*en_test;

%generate output value
X_train=X_train';
X_test=X_test';
yn_train=yn_train';
yn_test=yn_test';

train_set=[X_train yn_train];
test_set=[X_test yn_test];

end

