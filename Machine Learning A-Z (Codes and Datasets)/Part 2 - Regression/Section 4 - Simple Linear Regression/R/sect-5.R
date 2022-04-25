# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


# Fitting simple Linear Regression to the Training set

regressor <- lm(data = training_set, formula = Salary ~ YearsExperience)
summary(regressor)


#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)


#Visualising the Training set results
library(ggplot2)




