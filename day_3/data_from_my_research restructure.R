
#' Restructure data exercise:

library(tidyverse)
library(readxl)

my_data <- read_excel("data/data from my research.xlsx", skip = 1)

glimpse(my_data)

#' Note: The first column should be Point, with labels 1 to 5, 24 of each 
#' for each hour of the day.

my_data$Point <- rep(1:5, each = 24) %>%
                 factor()

names(my_data)

#' Restructure multiple columns, first with pivot longer
#' then pivot wider.

intermediate1 <- my_data %>%
  pivot_longer(cols = 3:38,
               names_to = c("delta","type"),
               names_sep = '_',
               values_to = "value")

my_data_final <- intermediate1 %>%
  group_by(Hour,delta) %>%
  summarise(value = mean(value, na.rm = TRUE))

#' Note: I can do this in a single chunk just by connecting line 26
#' to 28 with a pipe. I've put it into 2 chunks so that you can
#' understand the intermediate data set.   
