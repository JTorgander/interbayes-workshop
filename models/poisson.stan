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
  # TODO: WRITE YOUR CODE HERE
}

model {
   # TODO: WRITE YOUR CODE HERE
  alpha ~ normal(0, 5);
  beta ~ normal(0, 1);
  
}

generated quantities {
  # TODO: WRITE YOUR CODE HERE
}
