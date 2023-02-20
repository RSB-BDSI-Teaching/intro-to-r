#' Week 3 practice exercises


#' The following exercises will test your data wrangling and 
#' data visualisation skills from the last 3 weeks.

library(tidyverse)
library(ggbeeswarm)


#' 1. Using the iris data set, re-structure the data using pivot_longer
#' by putting all biometric measures Sepal.Length,Sepal.Width, Petal.Length
#' and Petal.Width in a single column. Label the names column "Measure". Call 
#' the new data set iris_long. 
names(iris)

iris_long <- iris %>%
  pivot_longer(cols = -Species, names_to = "Measure", values_to = "value")


#' 2. Using iris_long, create a graphic using ggplot() showing the distribution of each biometric measure by 
#' species (col = Species). Create a separate panel for each measure using
#' facet_wrap()

iris_long %>%
  ggplot(aes(x = Species, y = value, col = Species))+
  geom_beeswarm()+
  facet_wrap(~Measure, scales = "free")+
  theme_bw()


#' 3. Suppose instead of a single column for all biometric measure, we decide to
#' restructure the data to create 2 columns: one for Petal and one for Sepal.
#' The final data set (call it iris_tissue) should have 300 rows.
 
iris_tissue  <- iris %>%
  mutate(sample = 1:nrow(iris)) %>%
  pivot_longer(cols = -c(sample,Species), names_to = c("tissue","measure"),
               names_pattern = "([A-Za-z]+).([A-Za-z]+)",
               values_to = "value") %>%
  pivot_wider(names_from = "tissue",values_from = "value")


#' 4. The ToothGrowth data set reports on an experiment in 60 guinea pigs on 
#' the effect of vitamin C on tooth growth. Each animal received either 
#' 0.5, 1 or 2 mg/day of Vitamin C via one of two delivery methods: 
#' orange juice (OJ) or ascorbic acid (VC).

tooth <- ToothGrowth

#' Create a few graphics in ggplot() to assess differences in tooth growth by treatment.
#' Discuss any patterns you observe: is there a dose-response? Is one
#' delivery method more effective than the other?
 
ggplot(tooth,aes(x = factor(dose), y = len, col = supp))+
  geom_boxplot()+
  geom_point(position = position_dodge(width = 0.75))

ggplot(tooth,aes(x = supp, y = len, col = factor(dose)))+
  geom_boxplot()+
  geom_point(position = position_dodge(width = 0.75))

#' 5. Use group_by() and summarise() functions to summarise a data set that
#' you are working with.

library(palmerpenguins)
penguins %>%
  group_by(species,year) %>%
  summarise(n = n(),across(c(bill_length_mm:body_mass_g), list(~mean(.x,na.rm = TRUE), ~sd(.x,na.rm = TRUE))))



            