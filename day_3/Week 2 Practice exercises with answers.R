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
summary(survey1)

#' Choose a single year (e.g. 2010) and create a summary table of the
#' demographic data using the gtsummary package. 

survey1 %>%
  filter(year == 2010)%>%
  select(-year) %>%
  tbl_summary()
#' This table may still be difficult to read because there are
#' too many categories in most of the demographic variables.
#' Try collapsing categories and re-ordering factor levels, e.g. 
#' Marital status: Married, Widowed/Separated/Divorced, Never married, missing
#' Reported Income: $25000 or more, less than $25000, Not applicable, Other
#' Party ID: Democrat, Republican, Independent, Other
#' Religion: Protestant/Christian, Catholic, Jewish, Other, None

survey2 <- survey1 %>%
  mutate(marital = factor(marital, levels = c("No answer", "Never married",
                                              "Separated","Divorced",
                                              "Widowed","Married"),
                          labels = c("Missing", "Never married",
                                     "W/S/D",
                                     "W/S/D",
                                     "W/S/D","Married")),
         relig1 = factor(relig, levels = c("No answer","Don't know",             
                                          "Inter-nondenominational","Native american",        
                                          "Christian","Orthodox-christian",    
                                          "Moslem/islam","Other eastern",          
                                          "Hinduism", "Buddhism",               
                                          "Other","None",                  
                                          "Jewish", "Catholic",               
                                          "Protestant","Not applicable"), 
                        labels = c(".",".",
                                          "Other","Other",
                                          "Protestant/Christian", "Other Christian",
                                          "Eastern","Eastern",
                                          "Eastern","Eastern",
                                          "Other","None",
                                          "Jewish","Other Christian",
                                          "Protestant/Christian","None")),
         relig1 = factor(relig1, levels = c("Protestant/Christian", "Other Christian",
                                            "Eastern", "Jewish",
                                            "Other","None")),
         marital = factor(marital, levels = c("Married","Never married", "W/S/D","Missing"))) %>%
  filter(!marital == "Missing", !relig1 == ".") %>%
  droplevels()

survey3 <- survey1 %>%
  mutate(marital = fct_collapse(marital,
                          Married = c("Married"),
                         `Never Married` = c("Never married"),
                          `W/S/D` = c("Widowed","Separated","Divorced"),
                          Missing = c("No answer")),
       marital= fct_relevel(marital, "Married","W/S/D","Never Married"),
       relig1 = fct_collapse(relig,
                          `Protestant/Christian` = c("Christian","Protestant"),
                          `Other Christian` = c("Catholic","Orthodox-christian"),
                          Eastern = c("Moslem/islam","Buddhism","Hinduism","Other eastern"),
                          Jewish = c("Jewish"),
                          Other = c("Inter-nondenominational","Native american", "Other"),
                          None = c("None"),
                          Missing = c("No answer","Don't know", "Not applicable")),
      relig1 = fct_relevel(relig1,"Protestant/Christian","Other Christian","Jewish",
                         "Eastern","Other","None","Missing"))

#' Now re-create the table. Include only the columns
#' Marital status, Reported Income, Party ID and Religion.
#' Re-label the variables in the table and make them bold.
survey2 %>%
  filter(year == 2010) %>%
  select(marital, relig1) %>%
  tbl_summary(
    label = list(marital ~ "Marital Status",
                 relig1 ~ "Religion")
  ) %>%
  bold_labels()

survey3 %>%
  filter(year == 2010) %>%
  select(marital, relig1) %>%
  tbl_summary(
    label = list(marital ~ "Marital Status",
                 relig1 ~ "Religion")
  ) %>%
  bold_labels()

#' 2. Choose multiple years (e.g. 2008, 2012 and 2016) and create
#' a similar table with a column for each year. (hint by=year)

survey2 %>%
  filter(year %in% c(2008,2010,2012)) %>%
  select(year, marital, relig1) %>%
  tbl_summary( by = year,
    label = list(marital ~ "Marital Status",
                 relig1 ~ "Religion")
  ) %>%
  bold_labels()
#' 3. Create a graphic in ggplot that shows mean TV hours grouped by religion.
#' Re-arrange the religion factor to be ordered by increasing mean TV hours.


survey2 %>%
  filter(relig1 != ".") %>%
  group_by(relig1)%>%
  summarise(N = n(),
            mean_TV_hours = mean(tvhours, na.rm = TRUE),
            se_TV_hours = sd(tvhours, na.rm = TRUE)/sqrt(N) )%>%
  ggplot(aes(x = fct_reorder(relig1, mean_TV_hours), y = mean_TV_hours))+
  geom_point()+
  geom_errorbar(aes(ymin = mean_TV_hours - se_TV_hours,
                    ymax = mean_TV_hours + se_TV_hours))+
  theme(axis.text.x = element_text(angle = 90))+
  xlab("")


#' 4. Create a new factor age_cat that categorises by age, e.g.
#' 18 - 33, 34 - 45, 46 - 59, 60 and over. Use the cut() function to
#' create these categories. Then use tbl_cross to summarise marital status
#' by age category. How could you visualise this using ggplot?

survey2 <- survey2 %>%
  mutate(age_cat = cut(age, breaks = c(18,33,45,59,Inf),right = TRUE,
                       labels = c("18 - 33","34 - 45","46 - 59","60 and over")))

tbl_cross(survey2, row  = marital, col = age_cat)

survey2 %>%
  filter(!is.na(age_cat)) %>%
ggplot(aes(x = age_cat, fill = marital)) +
  geom_bar()

survey2 %>%
  filter(!is.na(age_cat)) %>%
  ggplot(aes(x = age_cat, fill = marital)) +
  geom_bar(position = "fill")

#' 5. Use group_by() and summarise() functions to summarise 
#' sepal width and sepal length by species using the iris data (base package).
#' Use summary statistics mean and SD.

iris
