#Test the Law of Large Numbers for N random normally distributed numbers with 
#mean = 0, stdev = 1:

#Create an R script that will count how many of these numbers fall between
# -1 and 1 and devide the total quantify of N

# You know that E(X) = 68.2%

# Check that Mean (Xn) -> E(X) as you rerun your script while increasing N


#count <- 0

#while(i < 100000) {
#  current <- rnorm(1)
#  
#  if(current >=-1 & current <= 1) {
#    count <- count+1
#  }
#  i <- i +1
#}

index <- 0
count <- 0
N <- 1000000
for (i in rnorm(N)) {
  if(i >=-1 & i <= 1) {
    count <- count+1
  }
  index <- index +1
}

count


mean(rnorm(N))


