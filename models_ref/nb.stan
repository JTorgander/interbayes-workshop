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
  real<lower=0> gamma;
}

transformed parameters {
  vector[N*T] lambda = exp(alpha + x * beta);
}

model {
  alpha ~ normal(0, 5);
  beta ~ std_normal();
  gamma ~ cauchy(0, 5);
  y ~ neg_binomial_2(lambda, gamma);
}

generated quantities {
  array[N*T] int ypred = neg_binomial_2_rng(lambda, gamma);
}
