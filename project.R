library(tidyverse)
library(ggplot2)

df = read.csv('Life_Expectancy_Data.csv')
summary(df)

grouped = df %>% group_by()
#KLjl

grouped$Year = as.factor(grouped$Year)

g = ggplot(data = grouped)
g + geom_boxplot(aes(x = Year, y = Life.expectancy, color = Status))

year_2014 = filter(df, Year == 2014)
summary(year_2014)
year_2014_filtered = year_2014 %>% select(-c('Country','Status','Year',
                        'Alcohol','Total.expenditure','percentage.expenditure'))

year_2000 = filter(df, Year == 2000)
summary(year_2000)
year_2000_filtered = year_2000 %>% select(-c('Country', 'Status','Year','Alcohol'
                                             ,'Total.expenditure','percentage.expenditure'))

omitted_2014 = na.omit(year_2014_filtered)
omitted_2000 = na.omit(year_2000_filtered)

model.saturated = lm(Life.expectancy ~ . - under.five.deaths - thinness.5.9.years, 
                     data = year_2000_filtered)

summary(model.saturated) #Many predictor variables are not significant, yet the
#overall regression is significant.

plot(model.saturated) #Assessing the assumptions of the model.

library(car) #Companion to applied regression.
influencePlot(model.saturated)

vif(model.saturated) #Assessing the variance inflation factors for the variables
#in our model.

model.saturated = lm(Life.expectancy ~ . - under.five.deaths - thinness.5.9.years, 
                     data = year_2015_filtered)


model.empty = lm(Life.expectancy ~ 1, data = omitted_2000) #The model with an intercept ONLY.
model.full = lm(Life.expectancy ~ .- under.five.deaths - thinness.5.9.years,
                data = omitted_2000) #The model with ALL variables.
scope = list(lower = formula(model.empty), upper = formula(model.full))

library(MASS) #The Modern Applied Statistics library.

#Stepwise regression using AIC as the criteria (the penalty k = 2).
forwardAIC = step(model.empty, scope, direction = "forward", k = 2)
backwardAIC = step(model.full, scope, direction = "backward", k = 2)
bothAIC.empty = step(model.empty, scope, direction = "both", k = 2)
bothAIC.full = step(model.full, scope, direction = "both", k = 2)

summary(forwardAIC)
plot(forwardAIC)
influencePlot(forwardAIC)
vif(forwardAIC)
avPlots(forwardAIC)
confint(forwardAIC)

