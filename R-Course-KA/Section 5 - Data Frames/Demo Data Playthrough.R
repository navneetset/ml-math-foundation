library(dplyr)

stats <- read.csv(file="Section 6 - Data Frames/P2-Demographic-Data.csv", stringsAsFactors = T)
stats





#------------------------------------ Exploring Dataset
stats
nrow(stats)
ncol(stats)
head(stats)
glimpse(stats)
tail(stats)
str(stats) #str() runif()
summary(stats)



#------------------------------------ Using the $ sign
stats
head(stats)
stats[3,"Birth.rate"]
stats[3,3]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)




#------------------------------------- Basic Operations with a DF
stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

#Remember how the [] work:
is.data.frame(stats[1,]) #subsetting rows in dataframe remains as dataframes
is.data.frame(stats[,1,drop=F]) #subsetting cols in dataframe drops dimensions by default
#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users


#add column to dataframe
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users #vectorised operation still

#test of knowledge
stats$xyz <- 1:5 #vector is recycled as long as its the same multiple of the rows
head(stats, n=20)
#remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL





#------------------------------------- Filtering Data Frames
head(stats)
filter <- stats$Internet.users < 2
stats[stats$Internet.users < 2,]
stats[filter,]


stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)


stats[stats$Country.Name == "Malta",]





#------------------------------------- Introduction to qplot
library(ggplot2)
?qplot
qplot(data = stats, x = Internet.users)
qplot(data = stats, x = Income.Group, y=Birth.rate)
qplot(data = stats, x = Income.Group, y=Birth.rate, size = I(2), colour=I("blue"))
qplot(data = stats, x = Income.Group, y=Birth.rate, geom="boxplot")





#------------------------------------- Visualising with QPlot: Part 1
qplot(data = stats, x = Internet.users, y=Birth.rate, size = I(2), colour=Income.Group)




#------------------------------------- Building Dataframes
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)
mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset, Region = Regions_2012_Dataset)

head(mydf)
tail(mydf)
summary(mydf)
glimpse(mydf)




#------------------------------------- Merging Data Frames
merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")

merged$Country <- NULL
str(merged)
tail(merged)





#------------------------------------- Visualising with new split

qplot(data = merged, x = Internet.users, y = Birth.rate, colour=Region)

#1. Shapes
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      colour=Region, 
      size=I(3), 
      shape=I(19))

#2. Transparency
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      colour=Region, 
      size=I(3), 
      shape=I(19), 
      alpha =I(0.6))


#3. Title
qplot(data = merged, x = Internet.users, y = Birth.rate, colour=Region, size=I(3), 
      shape=I(19), 
      alpha =I(0.6),
      main ="Birth Rate vs Internet Users"
      )
