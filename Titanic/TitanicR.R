#Titanic
#Ashley Bischof -- 2/20/14
#Analyze a training data set of titanic passangers to predict survival 
#in the test data
#file is a csv file with the following columns:
#passengerID, survived (1=yes, 0=no), Pclass(1-3), name, sex (male, female)
#age (blank is unknown), SibSp (number of siblings/spouse aboard), parch
#ticket, fare, cabin, embarked

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)


setwd("~/code/kaggle challenges/Titanic")   #set working directory

#read in training data set
train <- read.csv('~/code/Kaggle-Challenges/Titanic/train.csv')
View(train)

#read in test data set
test <- read.csv("~/code/Kaggle-Challenges/Titanic/test.csv")
View(test)

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = 'class')

plot(fit)
text(fit)
