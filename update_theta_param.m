%% Input:
%     xi          A column vector.
%     y           A column vector of the labels
%     data        Data matrix, rows correspond to observations.
%     mu_0        A column vector.
%     Lambda_0    A square matrix.
%% Output:
%     Lambda_pos  A square matrix.
%     mu_pos      A column vector.

function [Lambda_pos, mu_pos] = update_theta_param(Lambda_0, mu_0, xi, data, y)
n = size(data, 2);

% update Lambda_pos
xi = tanh(xi / 2) ./ xi / 4;
xi = repmat(xi, 1, n);
Lambda_pos = Lambda_0 + 2 * data' * (data .* xi);

% update mu_pos
mu_pos = sum(repmat(y - 1/2, 1, n) .* data); 
mu_pos = mu_pos' + Lambda_0 * mu_0;
mu_pos = Lambda_pos \ mu_pos;