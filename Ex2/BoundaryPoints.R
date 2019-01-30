boundary_fct <- function(theta){ 
  u <- seq(-1, 1.5, length = 50) 
  v <- seq(-1, 1.5, length = 50)
  z <- matrix(0, nrow = length(u), length(v))
  
  for (i in 1 : length(u)){
    for (j in 1 : length(v)){
      z[i, j] <- sum(as.matrix(mapFeature(u[i], v[j], 6)) * theta)
    }
  }
  
  u <- rep(u, times = length(u))
  v <- rep(v, each = length(v))
  z <- as.vector(t(z))  # unroll the matrix to have it accepted by ggplot
  
  boundary_grid <- as.data.frame(cbind(u,v,z))
  return(boundary_grid)
}

mapFeature <- function(X1, X2, degree){
  
  out <- as.data.frame(rep(1, length(X1)))
  
  for (i in 1:degree){
    for (j in 0:i){
      out[, ncol(out)+1] <- (X1 ^ (i-j)) * (X2 ^j)
    }
  }
  return(out)
}
