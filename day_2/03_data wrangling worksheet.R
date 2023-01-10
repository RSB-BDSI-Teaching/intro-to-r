
#' Questions to answer for the Cancer Data Set.
#' Please import the Cuzick breast cancer data and
#' answer these 10 questions.

#' Load libraries

library(tidyverse)

#' Import data
 
#' Exercise 1 -- Subset the data to show only the Cases.


#' Exercise 2 -- (a) Get the records of patients at least 70 years old.
#' (b) Get those records with density 50, 55 or 60. 
#' (c) Get those records with any density other than 50, 55 or 60.



#' Exercise 3 -- (a) Arrange by Age (descending).
#'    (b) Arrange by density and then Age (descending).
#'    (c) Select 2 columns: AGE and density.



#' Exercise 4: Extract the records of of patients over age 50 that had density >= 30.
#'  Create a new variable: density_prop = density/100.
#'  Then sort the data by descending age.

#' Exercise 5: How many subjects for each treatment (ARM)?

#' Exercise 6: How many records were there of each combination of ARM and case?


#' Exercise 7: (a) What was the mean age and bmi of individuals with and without cancer?
#'   (b) What proportion of people with density at least 80 who received the placebo
#'    ended up getting cancer?


#' Exercise 8. Which density values had at least 80 records?


#' Exercise 9. Summarise breast density values (Mean and SD) for each ARM (treatment) and Status(Case/Control). Include the number of subjects for each subgroup.



#' Exercise 10. Create age groups - 40 or under, 41 - 60, and over 60 using 
#' the cut() function. Then for each age group, compute the number and proportion
#'  of cases.