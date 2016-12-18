%% Input
%     data      A matrix, rows are corresponding to observations, and
%               columns are corresponding to features.
%% Output
%     data      A matrix with an addition column is added into data.
function data = augment_data(data)
m = size(data, 1);
data = [data, ones(m,1)];