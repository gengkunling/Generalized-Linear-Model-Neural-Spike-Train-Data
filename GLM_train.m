function [ye, C] = GLM_train(X, y, alpha, L)

%% parameters
M = getM(alpha); % memory length for feedforward kernels
alpha = sqrt(alpha);
R = 1:M;

%% feedforward V
V = X2V(X, M, L, alpha, 2);

%% cut the first memory of each segement
y = y(:);
y(R) = [];
V(R,:) = [];

%% GLM fit with probit link function
C = glmfit(V, [y, ones(size(y))], 'binomial','link', 'probit');

%% Model prediction
ye = glmval(C, V, 'probit');

