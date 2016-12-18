function [Lambda_pos, mu_pos] = vb_logistic_regression(data, y, maxIter, Lambda_0, mu_0)
if nargin < 4
    Lambda_0 = eye(size(data,2)+1);
end
if nargin < 5
    mu_0 = zeros(size(data,2)+1, 1);
end

% init
data = augment_data(data);
xi = randn(size(data, 1), 1);
xi_vec = zeros(1, maxIter);
mu_vec = zeros(1, maxIter);

% update parameters
for iter = 1:maxIter
    [Lambda_pos, mu_pos] = update_theta_param(Lambda_0, mu_0, xi, data, y);
    xi = update_xi(data, Lambda_pos, mu_pos);
    xi_vec(iter) = sum(xi.^2);
    mu_vec(iter) = sum(mu_pos .^2);
end

plot(xi_vec)
title('The change of \xi')
figure(2)
plot(mu_vec)
title('The change of \mu')
