library(tidyverse)
library(ggplot2)
library(car)

df = read.csv('../../Life_Expectancy_Data.csv')

#Omit N/A values (necessary for regression) and filter by desired year
all = na.omit(df)
all = filter(all, Year == 2014)

developing = filter(all, Status == 'Developing')

#Country, Status and Year were excluded because they are not numerical values (Year
#is numerical but it's the same value for all observations since we filtered by year). 
#Under.five.deaths and thinness.5.9.years were excluded because they are likely
#linearly dependent on infant.deaths and thinness..1.19.years, respectively.
developing = developing %>% select(-c('Country', 'Year', 'Status', 
                                      'under.five.deaths','thinness..1.19.years'))

library(MASS)

#Empty model with only beta0 (y-intercept)
model.empty = lm(Life.expectancy ~ 1, data = developing)

#Model with all variables.
model.full = lm(Life.expectancy ~ ., data = developing)
scope = list(lower = formula(model.empty), upper = formula(model.full))

#Stepwise regression using AIC as the criteria (the penalty k = 2).
forwardAIC = step(model.empty, scope, direction = "forward", k = 2)

summary(forwardAIC)
R_squared = summary(forwardAIC)$r.squared
coefficients = summary(forwardAIC)$coefficients[,1]
intercept = coefficients[1]
income_resources = coefficients['Income.composition.of.resources']
adult_mortality = coefficients['Adult.Mortality']
HIV_AIDS = coefficients['HIV.AIDS']
total_expenditure = coefficients['Total.expenditure']
#4 plots to assess the validity of assumptions of linear regression model
plot(forwardAIC)
influencePlot(forwardAIC)
#Verify the variance inflation factors are less than 5
vif(forwardAIC)
#Plot regression lines with one independent variable at a time
avPlots(forwardAIC)
confint(forwardAIC)