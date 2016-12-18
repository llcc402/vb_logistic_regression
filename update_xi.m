function xi = update_xi(data, Lambda_pos, mu_pos)

xi = sum((data / Lambda_pos) .* data, 2) + (data * mu_pos) .^2;
xi = sqrt(xi);
