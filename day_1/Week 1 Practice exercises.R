
install.packages("palmerpenguins")

library(tidyverse)
library(gtsummary)
library(palmerpenguins)


data(penguins)

#Exercise: 
#' Summarise these data using tbl_summary in gtsummary package. 
#' How many species were studied? 
#' How many islands? 
#' Did they find all species on every island (hint: try tbl_cross()
#' function in gtsummary package)
#' 
#' Univariate explorations:
#' For each biometric measure, are there difference between the species?
#' 
#' Explore the associations between the biometric measurements bill length, 
#' bill depth, flipper length and body mass. 
#' 
#' Are there differences in these associations between species?

#' For more information about these data, see:
#' https://allisonhorst.github.io/palmerpenguins/
#' 