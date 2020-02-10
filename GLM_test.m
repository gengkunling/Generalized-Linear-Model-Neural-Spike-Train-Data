function ye = GLM_test(X, C, alpha, L)

%% GLM parameters
M = getM(alpha); % memory length for feedforward kernels
R = 1:M;
V =X2V(X, M, L, sqrt(alpha), 2);
V(R,:) = [];

%% GLM prediction
ye = glmval(C, V, 'probit');