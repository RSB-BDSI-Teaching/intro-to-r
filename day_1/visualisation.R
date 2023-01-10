#' This is an introduction to ggplot2, 
#' written by Hadley Wickham following
#' The Grammar of Graphics.

#' import packages
library(tidyverse)

#' Import data
cancer_df <- read_csv("data/Cuzick_2010_breast_cancer_density.csv")
glimpse(cancer_df)

#' Data wrangling
#' create a new variable case_f
cancer_df <- mutate(cancer_df, 
                    case_f = factor(case, 
                                    levels= c("0","1"),
                                    labels= c("control","case")))
table(cancer_df$case,cancer_df$case_f)

#' Exploratory data analysis

ggplot(data = cancer_df, mapping = aes(x= AGE, y = density))+
  geom_point(size = 2, shape = 3, col = "blue")

ggplot(cancer_df, aes(AGE, density))+
  geom_point(col="darkgreen", alpha = .2)

ggsave("outputs/green_plot.png", 
       width = 6, height = 4) #units are inches

?ggsave

Exercise: Create a scatterplot with BMI on x-axis and density 
on y-axis.

ggplot(data = cancer_df, aes(x=BMI, y=density, col=case_f))+
  geom_point()

?geom_point

ggplot(cancer_df, aes(x= case_f, y = density))+
  geom_point()

ggplot(cancer_df, aes(x= case_f, y = density))+
  geom_jitter()

ggplot(cancer_df, aes(x= case_f, y = density, col=case_f))+
  geom_violin()

ggplot(cancer_df, aes(x= case_f, y = density, fill=case_f))+
  geom_violin()

ggplot(cancer_df, aes(x= case_f, y = density, fill=case_f))+
  geom_boxplot()

ggplot(cancer_df, aes(BMI, density))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~case_f)

ggplot(cancer_df, aes(BMI, density))+
  geom_point()+
  geom_smooth(method = "lm")

ggplot(cancer_df,aes(BMI, density, col=case_f))+
  geom_point()+
  geom_smooth()
