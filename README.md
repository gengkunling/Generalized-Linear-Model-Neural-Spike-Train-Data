# Generalized Linear Model (GLM) for Modeling Neural Spike Train Data

The generalized linear modeling (GLM) is a widely used model for neural spike train data analysis. This code uses a
compact approach that utilizes Laguerre basis functions and linear filters to represent
the model dynamics (Marmarelis et al., 2013, 2014; Song et al., 2013), so
the overall number of parameters could be largely reduced.

However, the limitation of
this approach is the “imbalanced class/data problem”.
The imbalanced class problem remains a challenge in machine learning
and in the data mining community, and some approaches, such as sampling
and cost-sensitive methods, are utilized to alleviate this problem. However, it would be difficult to
directly apply these methods for spike train data because of the intrinsic
nonlinear dynamic properties.


The "imbalanced class problem" is caused by the loss function of GLM method, which is termed as cross-entropy function or a log-loss
function in the machine learning field. It should be noted that the parameters estimated by MLE are biased when the sample size is small, and
the bias is magnified by the imbalanced class of the data (King & Zeng,
2001). Here is an intuitive way to understand the imbalanced class problem. By
minimizing the cross-entropy function in equation 2.8, the MLE approach
tries to find a hyperplane that best separates the zeros from ones. In regions
where ones and zeros are non-separable, the hyperplane would prefer to
classify ones as zeros. The reason is straightforward: since the zeros have
a higher density than ones for imbalanced data, classifying ones as zeros
would cause fewer errors and a smaller cross-entropy function. As a result,
the spiking probability is underestimated, and the estimated parameters are biased (King & Zeng, 2001).

In order to overcome the "imbalanced class problem", we have invented the ground-breaking method, i.e. Neuronal Mode Network (NMN) that achieved significanlty better results.

Check out the repo of NMN:

[https://github.com/gengkunling/Neuronal-Mode-Network](https://github.com/gengkunling/Neuronal-Mode-Network)



To learn more about the imbalaneced class problem, you can get more detailed descriptions from the paper:

[Geng, K., Shin, D. C., Song, D., Hampson, R. E., Deadwyler, S. A., Berger, T. W., & Marmarelis, V. Z. (2019). Multi-input, multi-output neuronal mode network approach to modeling the encoding dynamics and functional connectivity of neural systems. Neural computation, 31(7), 1327-1355.](https://www.researchgate.net/publication/333264707_Multi-Input_Multi-Output_Neuronal_Mode_Network_Approach_to_Modeling_the_Encoding_Dynamics_and_Functional_Connectivity_of_Neural_Systems)

## To run this program:

### 1.	1. Generate Binary Spike Train Data
Run [data_gen.m](data_gen.m) to generate the training data [data.mat](data.mat).


### 2.	rain and test the GLM model
Run [GLM_main.m](GLM_main.m ). The program will use the data from [train_data.mat](train_data.mat) and train the GLM model with ‘probit’ link function.  Then it uses the test data from [test_data.mat](test_data.mat) to evaluate the model performance using the ROC curve.




## Some additional code repos you might find useful:
Neuronal Mode Network (NMN) [https://github.com/gengkunling/Neuronal-Mode-Network](https://github.com/gengkunling/Neuronal-Mode-Network)

Laguerre-Volterra-Network [https://github.com/gengkunling/Laguerre-Volterra-Network](https://github.com/gengkunling/Laguerre-Volterra-Network)

Autoregressive-LVN to train Hodgkin-Huxley Equations [https://github.com/gengkunling/ASLVN](https://github.com/gengkunling/ASLVN)


## If you find this code useful, please cite:

[Geng, K., Shin, D. C., Song, D., Hampson, R. E., Deadwyler, S. A., Berger, T. W., & Marmarelis, V. Z. (2019). Multi-input, multi-output neuronal mode network approach to modeling the encoding dynamics and functional connectivity of neural systems. Neural computation, 31(7), 1327-1355.](https://www.researchgate.net/publication/333264707_Multi-Input_Multi-Output_Neuronal_Mode_Network_Approach_to_Modeling_the_Encoding_Dynamics_and_Functional_Connectivity_of_Neural_Systems)
