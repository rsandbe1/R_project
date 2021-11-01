# R project

The dataset is from Kaggle, originally from the World Health Organization.
It contains data from 2000-2015 for every country in the world and has more than 20 features in addition to the average life expectancy of that country from that year.

## EDA

The EDA directory contains exploratory data analysis, including plots of different features versus life expectancy to gain insights into various trends. The most important plot in this folder shows the stark difference between the life expectancy of developed versus developing countries.

## 2000-2014

This directory contains a multiple linear regression model using all of the data from 2000-2014 (2015 had too many missing values).
The model uses step-wise regression with AIC and identified 11 features that are statistically significant and linearly correlated with life expectancy.

## 2000

This directory contains a multiple linear regression model using the data from 2000.
The model uses step-wise regression with AIC and identified 3 features that are statistically significant and linearly correlated with life expectancy.

## 2014

This directory contains a multiple linear regression model using the data from 2014.
The model uses step-wise regression with AIC and identified 4 features that are statistically significant and linearly correlated with life exp
ectancy.

