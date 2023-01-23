#' Week 2 practice exercises


#' For these practice exercises, we use data from the 
#' General Social Survey, a US-based survey associated with the University
#'  of Chicago. It's part of the forcats package which is loaded 
#'  when you load tidyverse. forcats::gss_cat. 
#'  
#'  Reference: https://r4ds.had.co.nz/factors.html#general-social-survey

library(tidyverse)
library(gtsummary)

survey1 <- gss_cat
glimpse(survey1)

#' Also type ?gss_cat for more information about these data.

#' 1. Create a data summary using the summary function.


#' Choose a single year (e.g. 2010) and create a summary table of the
#' demographic data using the gtsummary package. 


#' This table may still be difficult to read because there are
#' too many categories in most of the demographic variables.
#' Try collapsing categories and re-ordering factor levels, e.g. 
#' Marital status: Married, Widowed/Separated/Divorced, Never married, missing
#' Reported Income: $25000 or more, less than $25000, Not applicable, Other
#' Party ID: Democrat, Republican, Independent, Other
#' Religion: Protestant/Christian, Catholic, Jewish, Other, None
#' 
#' Now re-create the table. Include only the columns
#' Marital status, Reported Income, Party ID and Religion.
#' Re-label the variables in the table and make them bold.


#' 2. Choose multiple years (e.g. 2008, 2012 and 2016) and create
#' a similar table with a column for each year. (hint by=year)


#' 3. Create a graphic in ggplot that shows mean TV hours grouped by religion.
#' Re-arrange the religion factor to be ordered by increasing mean TV hours.


#' 4. Create a new factor age_cat that categorises by age, e.g.
#' 18 - 33, 34 - 45, 46 - 59, 60 and over. Use the cut() function to
#' create these categories. Then use tbl_cross to summarise marital status
#' by age category. How could you visualise this using ggplot?


#' 5. Use group_by() and summarise() functions to summarise 
#' sepal width and sepal length by species using the iris data (base package).
#' Use summary statistics mean and SD.

iris