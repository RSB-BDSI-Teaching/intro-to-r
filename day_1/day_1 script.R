
#' This is the first R session,

#' Import libraries
library(tidyverse)
library(gtsummary)


#' Import data
cancer_df <- read_csv("data/Cuzick_2010_breast_cancer_density.csv")

str(cancer_df)
glimpse(cancer_df)
cancer_df$AGE
#' Data types: numeric, character, date, factor
head(cancer_df)
head(cancer_df,10)
summary(cancer_df)

#' Introducing gtsummary and the pipe "and then"

tbl_summary(cancer_df)

cancer_df %>%
  select(ARM, AGE, BMI) %>%
  tbl_summary(by = ARM) %>%
  add_overall(last = TRUE) %>%
  add_p()

check1 <- cancer_df %>%
  select(ARM, AGE, BMI)
head(check1)

check2 <- tbl_summary(check1, by=ARM)
check2

check3 <- add_p(check2)
check3


trial %>%
  tbl_summary(include = c(age, grade), by = trt) %>%
  add_overall()
