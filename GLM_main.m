clc
clear all
close all

% Train the GLM model
load train_data
L = 5;
alpha = 0.7;
M = getM(alpha);
[ye_train, C] = GLM_train(x_train, y_train, alpha, L);
ye_train(1:M) = [];

% Evaluate the GLM model using the test data
load test_data
ye_test = GLM_test(x_test, C, alpha, L);
y_test(1:M) = [];

% Plot ROC curve for the test data
[fpr, tpr, th, auc] = perfcurve(y_test, ye_test, 1);
figure
plot(fpr, tpr, 'linewidth', 3);
xlim([0 1])
ylim([0 1])
title('ROC of the test data', 'fontsize', 16)
xlabel('False Positive Ratio', 'fontsize', 16)
ylabel('True Positive Ratio', 'fontsize', 16)
set(gca, 'fontsize', 14)
xlim([0, 0.1])
ylim([0. 0.7])
tpr_glm = tpr;
fpr_glm = fpr;

% Plot Prediction results for the test data
figure
t = [1:length(y_test)] *  1000 / fs;
stem(y_test, 'marker', 'none', 'linewidth', 2)
xlabel('Time (ms)')
hold on
plot(ye_test, 'linewidth', 2)
legend('y', 'ye')
title('Model Prediction for the test data')
