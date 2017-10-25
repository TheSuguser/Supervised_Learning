clear;

my_seed = 12323;
s = RandStream('mt19937ar', 'seed', my_seed);
RandStream.setGlobalStream(s)


% Question a
nDims = 1;
nPoints = 600;

w = randn(nDims,1);
X = randn(nPoints, nDims);
n = randn(nPoints, 1);

y = X * w + n;

train_data_size = 100
test_data_size = 500

% Split the data set
X_train = X(1:train_data_size, nDims);
y_train = y(1:train_data_size, nDims);

X_test = X(train_data_size + 1: nPoints, nDims);
y_test = y(train_data_size + 1: nPoints, 1);

% Question b
w_star = (X_train.' * X_train) \ (X_train.' * y_train);

mean_square_train = (X_train * w_star - y_train).' * (X_train * w_star - y_train)/train_data_size; 
mean_square_test = (X_test * w_star - y_test).' * (X_test * w_star - y_test) / test_data_size;  

% Question c
train_data_size_s = 10;
X_train_small = X(1:train_data_size_s, nDims);
y_train_small = y(1:train_data_size_s, 1);

w_star_s = (X_train_small.' * X_train_small) \ (X_train_small.' * y_train_small);

mean_square_train_s = (X_train_small * w_star_s).' * (X_train_small * w_star_s)/train_data_size_s;
mean_square_test_s = (X_test * w_star_s).' * (X_test * w_star_s) / test_data_size;
