function y_hat = predict(data, Lambda_pos, mu_pos)
data = augment_data(data);
m = size(data, 1);
y_hat = ones(m,1);

for i = 1:m
    % generate theta
    theta = mvnrnd(mu_pos, Lambda_pos^(-1), 1000);
    p = theta * data(i,:)';
    p = sum(p > 0);
    if p < 500
        y_hat(i) = 0;
    end
end