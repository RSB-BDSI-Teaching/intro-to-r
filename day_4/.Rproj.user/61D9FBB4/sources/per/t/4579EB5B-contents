library(tidyverse)
library(readxl)
library(janitor)
library(lmerTest)

#'  I have a question concerning data from my experiment that I am currently analysing.
#' I did an assay in which I tried to measure the growth of cells by taking absorbance measurement
#' Because absorbance only measures turbidity and cannot tell me the number of viable cells, I did dilutions corresponding to the absorbance measurement and then counted viable cells that grew.
#'The absorbance measurement was done in triplicates and then I used excel to determine the mean value for each replicate, created a new sheet (called “Data for export”) inside which I also created a column for the viable cells/ml.
#' I want to create a plot of viable cells/ml(labelled “CFU…”) against the absorbance measurement (labelled “OD…”)
#' Then fit a quadratic model from which I want to obtain an equation that I will use to model subsequent absorbance measurements.
#' I have tried to fit a linear model but it doesn’t look good to me.

#' Can you please have a quick look at my raw data and the script attached and help me out with what I am missing?
  

#Data import
#curve_fitting <- read_xlsx("../fldAs and LytB.Fd-FNR.xlsx", sheet = "Data for export") %>% 
#  mutate(Dilutions=factor(Dilutions)) %>% 
#  clean_names()

curve_fitting <- read_xlsx("Akuh malaria experiment/fldAs and LytB.Fd-FNR.xlsx", 
                           sheet = "fldAs",
                           range = "A27:M35")  %>%
                clean_names() %>%
                rename(position = "x")

#' The data curve_fitting has 1 row per position (well). For each
#' well, OD was measured over 12 cycles. 
#'  
#' Restructure the data to have 1 row per well-cycle. 
curve_long <- curve_fitting %>%
  pivot_longer(cols = -1, names_to = "cycle",
                          names_prefix = "x",
                          values_to = "OD") %>%
  mutate(cycle = as.numeric(cycle))
 
#Quick summary
glimpse(curve_fitting)

# Data visualization
plot1 <- ggplot(curve_fitting, aes(od_fd_fnr,cfu_fd_fnr))+geom_point()+
  geom_smooth(method = "lm")+
  ylab("Viable cells, *10^10 (cells/ml)")+
  xlab("OD 600nm")

#' This plot shows OD levels for each well across the 12 cycles. 
ggplot(curve_long, aes(cycle, OD, col = position))+
  geom_line(aes(group = position)) +
  scale_x_continuous(breaks = 1:12)
  
# Model fit
lm1 <- lm(cfu_fd_fnr~od_fd_fnr, data = curve_fitting)
lm1
extract_(lm1)

hist(curve_fitting$cfu_fd_fnr)

plot(cfu_fd_fnr~od_fd_fnr, data = curve_fitting)


