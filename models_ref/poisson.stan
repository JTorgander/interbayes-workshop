data {
  int N;
  int T;
  int K;
  matrix[N*T, K] x;
  array[N*T] int y;
}

parameters {
  real alpha;
  vector[K] beta;
}

transformed parameters {
  vector[N*T] lambda = exp(alpha + x * beta);
}

model {
  alpha ~ normal(0, 5);
  beta ~ normal(0, 1);
  y ~ poisson(lambda);
}

generated quantities {
  array[N*T] real log_lik;
  array[N*T] int ypred = poisson_rng(lambda);

  // Evaluating log-likelihood for each data point and drawn sample
  for (i in 1:N*T){
   log_lik[i] = poisson_lpmf(y[i] | lambda[i]);
  }
}
