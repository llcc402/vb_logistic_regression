# The variational Bayesian inference for the logistic regresssion

This method is proposed by Tommi S. Jaakkola and Michael I. Jordan in the paper "Bayesian parameter estimation via variational methods", Statistics and Computing, 10(1) p25-37 2000. 

The main difficulty of the Bayesian analysis of logistic regression lies in the fact that the sigmoid funcion does not belong to the exponential family.

To tackle this problem, we change the sigmoid function

                          1
	sigma(x) = ---------------,
                     1 + exp(-x)

to 

	q(x) = sigma(xi) exp((x - xi)/2 - lambda(xi)(x^2 - xi^2))

where xi is the variational parameter, and we can prove that

	sigma(x) >= q(x)

for all x and xi. 

Then we update the parameters of logistic regression using traditional optimization method and update xi by EM algorithm.


## Functions included:

1. data_generate.m : Generate a data set with two classes. 

2. augment_data.m : Add 1 to each of the observation.

3. update_theta_param.m : Update the posterior parameters (mean and precision) of theta.

4. update_xi.m : Update the variational parameter xi.

5. vb_logistic_regresstion.m : The main function. Use this function to implement the logistic regresssion.

6. predict.m : Predict the label for a new observation. By sampling from the posterior of the parameter theta.

## Figures included:

1. data.jpg : The scatter plot of the generated data points.

2. mu_change.jpg : The change of the mean of theta in each iteration.

3. xi_change.jpg : The change of the variational parameter in each iteration.

4. training.jpg : The predicted labels for the training data set.
