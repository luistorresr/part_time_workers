
########################### Load packages ##############################################

### R version 4.2.3

#### packages needed
if(!require(tidyverse)) install.packages("tidyverse", repos = "http://cran.us.r-project.org")
if(!require(haven)) install.packages("haven", repos = "http://cran.us.r-project.org")
if(!require(sjlabelled)) install.packages("sjlabelled", repos = "http://cran.us.r-project.org")
if(!require(DT)) install.packages("DT", repos = "http://cran.us.r-project.org")
if(!require(Hmisc)) install.packages("Hmisc", repos = "http://cran.us.r-project.org")
if(!require(sjPlot)) install.packages("sjPlot", repos = "http://cran.us.r-project.org")
if(!require(gridExtra)) install.packages("girdExtra", repos = "http://cran.us.r-project.org")
if(!require(corrr)) install.packages("corrr", repos = "http://cran.us.r-project.org")
if(!require(ggthemes)) install.packages("ggthemes", repos = "http://cran.us.r-project.org")
if(!require(ggtext)) install.packages("ggtext", repos = "http://cran.us.r-project.org")
if(!require(ggrepel)) install.packages("ggrepel", repos = "http://cran.us.r-project.org")
if(!require(doBy)) install.packages("doBy", repos = "http://cran.us.r-project.org")
if(!require(sjmisc)) install.packages("sjmisc", repos = "http://cran.us.r-project.org")
if(!require(plotly)) install.packages("plotly", repos = "http://cran.us.r-project.org")
if(!require(scales)) install.packages("scales", repos = "http://cran.us.r-project.org")
if(!require(ggalt)) install.packages("ggalt", repos = "http://cran.us.r-project.org")
if(!require(janitor)) install.packages("janitor", repos = "http://cran.us.r-project.org")

library(tidyverse) # several tools for data manipulation
library(haven) # read SPSS, Stata, and SAS data
library(sjlabelled) # get_labels function
library(Hmisc) # many functions useful for data analysis
library(DT) # formatting tables 
library(sjPlot) # create a html with variable and value labels
library(gridExtra) # arrange multiple grid-based plots on a page
library(corrr) # for correlations correlate()
library(sjmisc) # useful to set Na's
library(ggthemes) # themes for ggplot2
library(ggtext) # fancy text
library(ggrepel) # help with the position of the labels on ggplot2 graph
library(doBy) # 'do' something to data stratified 'by' some variables
library(plotly) # interactive plots
library(scales) # add scale symbols and colour to axis
library(ggalt) # contingency table
library(janitor) # add totals to tables

########################### END  ##############################################
