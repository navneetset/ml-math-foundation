movies <- read.csv("P2-Movie-Ratings.csv", stringsAsFactors = T)
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

movies$Year <- factor(movies$Year)
str(movies)




# Aesthetics --------------------------------------------------------------
library(ggplot2)

#add geometry
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) +
  geom_point()


#add colour
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre)) +
  geom_point()


#add size

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre, size= BudgetMillions)) +
  geom_point()
#>>> This is #1 (we will improve it)



# Plotting with Layers ----------------------------------------------------

p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre, size= BudgetMillions)) 

p
p + geom_point()
p + geom_line()
p + geom_line() + geom_point()



# Overriding Aesthetics ---------------------------------------------------


q <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()

#overriding aesthetics
#example 1
q + geom_point(aes(size = CriticRating))

#example 2
q + geom_point(aes(colour=BudgetMillions))


#example 3
q + geom_point(aes(x = BudgetMillions)) +
  xlab("Budget Millions $$$")

#reduce line size
q + geom_line(size = 1) + geom_point()




# Mapping vs Setting ------------------------------------------------------

r <-  ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
r + geom_point()

#Add Colour
#1. Mapping (what we've done so far)
r + geom_point(aes(colour = Genre))

#2. Setting:
r + geom_point(colour = "DarkGreen")

#ERROR
#r + geom_point(aes(colour = "DarkGreen"))


#1. Mapping
r + geom_point(aes(size= BudgetMillions))

#2. Setting
r + geom_point(size = 10)





# Histograms and Density Charts -------------------------------------------


s <- ggplot(data = movies, aes(x = BudgetMillions))
s + geom_histogram(binwidth = 10)


#add colour
s + geom_histogram(binwidth = 10, aes(fill = Genre))

#add border
s + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")
#>>> 3 (we will improve it)


#sometimes you may need density charts
s + geom_density(aes(fill = Genre))
s + geom_density(aes(fill = Genre), position = "stack")
