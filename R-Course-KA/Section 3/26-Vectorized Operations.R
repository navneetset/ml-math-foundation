

x <- rnorm(5)

#R speicifc programming loop
for(i in x) {
  print(i)
}


#conventional programming loop
for(j in 1:5) {
  print(x[j])
}


#---------------- 2nd Part


N <- 100
a <- rnorm(N)
b <- rnorm(N)


#Vectorised approach
c <- a*b

#Devectorised approach
d <- rep(NA, N)
for(i in 1:N) {
  d[i] <- a[i] * b[i]
}
