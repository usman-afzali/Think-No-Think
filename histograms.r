#Usman Afzali
#date: 12/10/2021
#purpose: getting histograms for YBOCS and PCL-C scores

#packages needed:"psych" and "ggplot2"

#read all scores to the R and call it scores.
scores <- read.csv("histos.csv")

#calculate descriptives
library("psych")
describe(scores)

#we create three bins, Lo YBOCS, Middle Scorers, and Hi YBOCS. So, we create a new variables (YBOCS bins) to correspond with that
scores$YBOCSbins = ifelse(scores$ybocs < 9, "Lo YBOCS (n = 81)", ifelse(scores$ybocs < 20, "Middle Scorers (n = 214)", "Hi YBOCS (n = 72)"))

#Now, we make a histogram using ggplot2, and assign a diffent colour to each bin
library(ggplot2)
ggplot(scores, aes(ybocs, fill = YBOCSbins)) + geom_histogram(binwidth = 1) + 
  scale_fill_manual(values = c("Lo YBOCS (n = 81)" = "#CCE0F2",
                               "Middle Scorers (n = 214)" = "grey",
                               "Hi YBOCS (n = 72)" = "#FBD254"))

#The same applies to the PCL-C scale below. Note the bin sizes are different here.
scores$PCLCbins = ifelse(scores$pclc < 28, "Lo PCL-C (n = 80)", ifelse(scores$pclc < 58, "Middle Scorers (n = 218)", "Hi PCL-C (n = 69)"))

#And below is the histogram
library(ggplot2)
ggplot(scores, aes(pclc, fill = PCLCbins)) + geom_histogram(binwidth = 2) + 
  scale_fill_manual(values = c("Lo PCL-C (n = 80)" = "#EFA171",
                               "Middle Scorers (n = 218)" = "grey",
                               "Hi PCL-C (n = 69)" = "#E62E25"))
