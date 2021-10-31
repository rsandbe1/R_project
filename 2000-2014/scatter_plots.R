library(tidyverse)
library(ggplot2)

df = read.csv('../Life_Expectancy_Data.csv')

#Omit N/A values (necessary for regression) and filter by desired year
df[df==0] <- NA

all = na.omit(df)
all = filter(all, Year != 2015)

developing = filter(all, Status == 'Developing')


g_1 = ggplot(data = all, aes(x = Income.composition.of.resources, 
                           y = Life.expectancy))
g_1 + geom_point(aes(color = Status)) + scale_color_manual(values = c('blue', 'red')) +
  geom_abline(intercept = 51.50, slope = 9.049, color = 'red') +
  geom_abline(intercept = 51.98, slope = 10.43, color = 'black') +
  labs(x = 'Income composition of resources', y = 'Life expectancy (years)')

ggsave('income_composition_resources.png', dpi=300)

g_2 = ggplot(data = all, aes(x = Adult.Mortality, 
                             y = Life.expectancy))
g_2 + geom_point(aes(color = Status)) + scale_color_manual(values = c('blue', 'red')) +
  geom_abline(intercept = 48.474517, slope = -0.017539, color = 'red') +
  geom_abline(intercept = 47.614113, slope = -0.017949, color = 'black') +
  labs(x = 'Adult Mortality (people/1000 people)', y = 'Life expectancy (years)')

ggsave('adult_mortality.png', dpi=300)

g_3 = ggplot(data = all, aes(x = HIV.AIDS, 
                             y = Life.expectancy))
g_3 + geom_point(aes(color = Status)) + scale_color_manual(values = c('blue', 'red')) +
  geom_abline(intercept = 48.474517, slope = -0.893979, color = 'red') +
  geom_abline(intercept = 47.614113, slope = -0.844894, color = 'black') +
  labs(x = 'HIV/AIDS (deaths/1000 people)', y = 'Life expectancy (years)')

ggsave('HIV_AIDS.png', dpi=300)

g_4 = ggplot(data = all, aes(x = Total.expenditure, 
                             y = Life.expectancy))
g_4 + geom_point(aes(color = Status)) + scale_color_manual(values = c('blue', 'red')) +
  geom_abline(intercept = 48.474517, slope = 0.378334, color = 'red') +
  geom_abline(intercept = 47.614113, slope = 0.355162, color = 'black') +
  labs(x = 'Health/Total Expenditure (%)', y = 'Life expectancy (years)')

ggsave('total_expenditure.png', dpi=300)




