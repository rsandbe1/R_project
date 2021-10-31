library(tidyverse)
library(ggplot2)

df = read.csv('../Life_Expectancy_Data.csv')
summary(df)

grouped = df %>% group_by()

grouped$Year = as.factor(grouped$Year)

g1 = ggplot(data = grouped)
g1 + geom_boxplot(aes(x = Status, y = Life.expectancy, color = Year)) +
  labs(x = 'Country status', y = 'Life expectancy (years)')
ggsave('life_expectancy_country_status_boxplots.png', dpi=300)

g2 = ggplot(data = df)
g2 + geom_point(aes(x = Schooling, y = Life.expectancy, color = Status)) + 
  scale_color_manual(values = c('blue', 'red')) +
  labs(x ='Schooling', y = 'Life expectancy (years)')
ggsave('life_expectancy_schooling.png', dpi=300)

g3 = ggplot(data = df)
g3 + geom_point(aes(x = log(Population), y = Life.expectancy, color = Status)) +
  scale_color_manual(values = c('blue', 'red')) +
  labs(x ='log(Population)', y = 'Life expectancy (years)')
ggsave('life_expectancy_log_population.png', dpi=300)

g4 = ggplot(data = df)
g4 + geom_point(aes(x = GDP, y = Life.expectancy, color = Status)) +
  scale_color_manual(values = c('blue', 'red')) +
  labs(x ='GDP', y = 'Life expectancy (years)')
ggsave('life_expectancy_GDP.png', dpi=300)

g5 = ggplot(data = df)
g5 + geom_point(aes(x = BMI, y = Life.expectancy, color = Status)) +
  scale_color_manual(values = c('blue', 'red')) +
  labs(x ='BMI', y = 'Life expectancy (years)')
ggsave('life_expectancy_BMI.png', dpi=300)

g6 = ggplot(data = df)
g6 + geom_point(aes(x = Alcohol, y = Life.expectancy, color = Status)) +
  scale_color_manual(values = c('blue', 'red')) +
  labs(x ='Alcohol consumption (per capita)', y = 'Life expectancy (years)')
ggsave('life_expectancy_alcohol.png', dpi=300)
