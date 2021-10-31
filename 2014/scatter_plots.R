library(tidyverse)
library(ggplot2)
library(car)

df = read.csv('../../Life_Expectancy_Data.csv')

#Omit N/A values (necessary for regression) and filter by desired year
all = na.omit(df)
all = filter(all, Year == 2014)

developing = filter(all, Status == 'Developing')
