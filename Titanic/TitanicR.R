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


setwd("~/code/Kaggle-Challenges/Titanic")   #set working directory

#read in training data set
train <- read.csv('~/code/Kaggle-Challenges/Titanic/train.csv')
train$Pclass <- factor(train$Pclass)
View(train)

#read in test data set
test <- read.csv("~/code/Kaggle-Challenges/Titanic/test.csv")
View(test)

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = 'class')

plot(fit)
text(fit)






#fit logistic regression
inv.logit <- function(x){1/(1+exp(-x))}
new.data <- data.frame(Survived=1, Pclass=c(1,2,3))
formula.class <- as.formula(Survived ~ Pclass)
X <- model.matrix(formula.class, data=new.data)

fit <- glm(formula.class, data=train, family=binomial(link = "logit"))
lp.classy <- as.vector(X %*% class.coef)
lp <- predict(fit, new.data, se.fit = TRUE)
coef1 <- coef(fit1)

fit2 <- glm(Survived ~ Pclass + Sex, 
             data = train, family = binomial(link = "logit"))
new.data2 <- data.frame(expand.grid(Survived=1, Pclass=c(1,2,3), Sex=c('male', 'female')))
lp2 <- predict(fit2, new.data2, type="response")
summary(fit2)
cbind(new.data2, lp2)
coef2 <- coef(fit2)


fit3 <- glm(Survived ~ Pclass + Sex + Pclass:Sex, 
            data = train, family = binomial(link = "logit"))
new.data3 <- data.frame(expand.grid(Survived=1, Pclass=factor(c(1,2,3)), Sex=c('male', 'female')))
lp3 <- predict(fit3, new.data3) #, type="response")
summary(fit3)
cbind(new.data3, round(lp3,4))
coef3 <- coef(fit3)



fit.all <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, family=binomial(link = "logit"))
summary(fit_2)

plot(fit)
