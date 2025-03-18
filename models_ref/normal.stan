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
  array[N*T] real log_lik;

  ypred = normal_rng(alpha + x * beta,
                     sigma);
    // Evaluating log-likelihood for each data point and drawn sample
  for (i in 1:N*T){
   log_lik[i] = normal_lpdf(y[i] | alpha + x[i] * beta,
                     sigma);
  }
}
