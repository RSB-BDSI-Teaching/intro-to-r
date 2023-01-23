#' Week 3 practice exercises


#' The following exercises will test your data wrangling and 
#' data visualisation skills from the last 3 weeks.

library(tidyverse)


#' 1. Using the iris data set, re-structure the data using pivot_longer
#' by putting all biometric measures Sepal.Length,Sepal.Width, Petal.Length
#' and Petal.Width in a single column. Label the names column "Measure". Call 
#' the new data set iris_long. 
names(iris)


#' 2. Using iris_long, create a graphic using ggplot() showing the distribution of each biometric measure by 
#' species (col = Species). Create a separate panel for each measure using
#' facet_wrap()


#' 3. Suppose instead of a single column for all biometric measure, we decide to
#' restructure the data to create 2 columns: one for Petal and one for Sepal.
#' The final data set (call it iris_tissue) should have 300 rows.
 



#' 4. The ToothGrowth data set reports on an experiment in 60 guinea pigs on 
#' the effect of vitamin C on tooth growth. Each animal received either 
#' 0.5, 1 or 2 mg/day of Vitamin C via one of two delivery methods: 
#' orange juice (OJ) or ascorbic acid (VC).

tooth <- ToothGrowth

#' Create a few graphics in ggplot() to assess differences in tooth growth by treatment.
#' Discuss any patterns you observe: is there a dose-response? Is one
#' delivery method more effective than the other?
 


#' 5. Use group_by() and summarise() functions to summarise a data set that
#' you are working with.


