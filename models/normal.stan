data {
  int N;
  int T;
  int K;
  matrix[N*T, K] x;
  vector[N*T] y;
}
parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}
model {
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
  sigma ~ normal(0, 10);
}
generated quantities {
  array[N*T] real ypred;
  ypred = normal_rng(alpha + x * beta,
                     sigma);
}
