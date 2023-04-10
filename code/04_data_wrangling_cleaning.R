
##################### LFS Data wrangling ##############################

# Load LFS combined dataset

load("data/LFS_combined.rda")

# Create a working dataset to clean

LFS_clean <- LFS_combined # working dataset

view_df(LFS_clean, show.id = FALSE)  # check variables and labels

rm(LFS_combined) # remove to save memory

# Cleaning the working dataset 

LFS_clean <- LFS_clean %>% 
        set_na(na = c(-8, -9), drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for: does not apply(-9), no answer(-8)

LFS_clean <- LFS_clean %>% 
        set_na(na = c(ACTHR2 = 99, OVHRS = 99), 
               drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for specific variable labels

# Recording and creating variables based on existing ones

## adding label to year 

set_label(LFS_clean$year) <- "Year" # set variable label

## adding labels to quarter

set_label(LFS_clean$quarter) <- "Calendar quarter" # add variable label
LFS_clean$quarter <- set_labels(LFS_clean$quarter, 
                                labels = c("Jan/Mar" = 1, "Apr/Jun" = 2, "Jul/Sep" = 3, "Oct/Dec" = 4))

## changing male and female

LFS_clean$SEX <- replace_labels(LFS_clean$SEX, 
                                labels = c("Men" = 1, "Women" = 2)) 

set_label(LFS_clean$SEX) <- "Sex" # set variable label

get_labels(LFS_clean$SEX, values = "n")


## Labeling and creating age bands variable

LFS_clean <- LFS_clean %>% 
  mutate(AGEEUL2 = recode_factor(factor(AGEEUL),
                    `1`="Below 18", `2`="Below 18", `3`="Below 18", `4`="Below 18", `5`="Below 18", `6`="Below 18",
                    `7`="18-24", `8`="18-24", `9`="18-24", `10`="18-24", `11`="18-24", `12`="18-24", `13`="18-24", 
                    `14`="25-29", 
                    `15`="30-34", 
                    `16`="30-39", 
                    `17`="40-44", 
                    `18`="45-49",
                    `19`="50-54", 
                    `20`= "55-59", 
                    `21`= "60-64",
                    `22`="Above 64", `23` = "Above 64", `24`= "Above 64", `25`= "Above 64", `26` = "Above 64", `27`= "Above 64", `28`= "Above 64")) %>% 
  as_numeric(., keep.labels = TRUE)

LFS_clean$AGEEUL <- NULL # delete old variable

set_label(LFS_clean$AGEEUL2) <- "Age" # add variable label

## Ethnicity 

LFS_clean$ETHUKEUL <- remove_all_labels(LFS_clean$ETHUKEUL)
set_label(LFS_clean$ETHUKEUL) <- "Ethnicity" # add variable label
LFS_clean$ETHUKEUL <- set_labels(LFS_clean$ETHUKEUL, labels = c(
  "White" = 1,
  "Mixed/Multiple ethnic groups" = 2,
  "Indian" = 3,
  "Pakistani" = 4,
  "Bangladeshi" = 5,
  "Chinese" = 6,
  "Any other Asian background" = 7,
  "Black/African/Caribbean/Black British" = 8,
  "Other ethnic group" = 9))

get_labels(LFS_clean$ETHUKEUL, values = "n")


LFS_clean <- LFS_clean %>% mutate(ETHUKEUL2 = recode_factor(factor(ETHUKEUL), # create a white vs ethnic minority variable
                                                             `1` = "White",
                                                             `2` = "Minority-ethnic", `3` = "Minority-ethnic", 
                                                             `4` = "Minority-ethnic", `5` = "Minority-ethnic",
                                                             `6` = "Minority-ethnic",`7` = "Minority-ethnic",
                                                             `8` = "Minority-ethnic",`9` = "Minority-ethnic")) %>% 
  as_numeric(., keep.labels = TRUE)


set_label(LFS_clean$ETHUKEUL2) <- "White and Minority-ethnic" # add variable label

get_labels(LFS_clean$ETHUKEUL2, values = "n")


## changing ILO value labels 
LFS_clean$ILODEFR <- replace_labels(LFS_clean$ILODEFR, 
                                    labels = c("In employment" = 1, "Not employed" = 2, "Inactive" = 3, "Under 16" = 4)) 

get_labels(LFS_clean$ILODEFR, values = "n")

set_label(LFS_clean$ILODEFR) <- "Basic economic activity (ILO definition) (reported)" # add variable label

## labeling INECAC05 (basic economic activity)

LFS_clean$INECAC05 <- remove_all_labels(LFS_clean$INECAC05)
set_label(LFS_clean$INECAC05) <- "Basic economic activity (ILO definition) (reported)" # add variable label
LFS_clean$INECAC05 <- set_labels(LFS_clean$INECAC05, labels = c(
  "Employee" = 1,
  "Self-employed" = 2,
  "Government employment & training programmes" = 3,
  "Unpaid family worker" = 4,
  "ILO unemployed" = 5,
  "Inactive - seeking, unavailable, student" = 6,
  "Inactive - seeking, unavailable, looking after family, home" = 7,
  "Inactive - seeking, unavailable, temporarily sick or injured" = 8,
  "Inactive - seeking, unavailable, long-term sick or disabled" = 9,
  "Inactive - seeking, unavailable, other reason" = 10,
  "Inactive - seeking, unavailable, no reason given" = 11,
  "Inactive - not seeking, would like work, waiting results of job application" = 12,
  "Inactive - not seeking, would like work, student" = 13,
  "Inactive - not seeking, would like work, looking after family, home" = 14,
  "Inactive - not seeking, would like work, temporarily sick or injured" = 15,
  "Inactive - not seeking, would like work, long term sick or disabled" = 16,
  "Inactive - not seeking, would like work, believes no jobs available" = 17,
  "Inactive - not seeking, would like work, not yet started looking" = 18,
  "Inactive - not seeking, would like work, does not need or want employment" = 19,
  "Inactive - not seeking, would like work, retired from paid work" = 20,
  "Inactive - not seeking, would like work, other reason" = 21,
  "Inactive - not seeking, would like work, no reason given" = 22,
  "Inactive - not seeking, not like work, waiting results of job application" = 23,
  "Inactive - not seeking, not like work, student" = 24,
  "Inactive - not seeking, not like work, looking after family, home" = 25,
  "Inactive - not seeking, not like work, temporarily sick or injured" = 26,
  "Inactive - not seeking, not like work, long term sick or disabled" = 27,
  "Inactive - not seeking, not like work, believes no jobs available" = 28,
  "Inactive - not seeking, not like work, not yet started looking" = 29,
  "Inactive - not seeking, not like work, does not need or want employment" = 30,
  "Inactive - not seeking, not like work, retired from paid work" = 31,
  "Inactive - not seeking, not like work, other reason" = 32,
  "Inactive - not seeking, not like work, no reason given" = 33,
  "Under 16" = 34))

get_labels(LFS_clean$INECAC05, values = "n")


## Labeling STAT (Employment status)

LFS_clean$STAT <- remove_all_labels(LFS_clean$STAT) # Overall 
set_label(LFS_clean$STAT) <- "Employment status" # add variable label
LFS_clean$STAT <- set_labels(LFS_clean$STAT, labels = c(
  "Employee" = 1,
  "Self-employed" = 2, 
  "Government scheme" = 3,
  "Unpaid family worker" = 4))

LFS_clean$STATR <- remove_all_labels(LFS_clean$STATR) # main job
set_label(LFS_clean$STATR) <- "Employment status (main job)" # add variable label
LFS_clean$STATR <- set_labels(LFS_clean$STATR, labels = c(
  "Employee" = 1,
  "Self-employed" = 2, 
  "Government scheme" = 3,
  "Unpaid family worker" = 4))

LFS_clean$STAT2 <- remove_all_labels(LFS_clean$STAT2) # main job
set_label(LFS_clean$STAT2) <- "Employment status (second job)" # add variable label
LFS_clean$STAT2 <- set_labels(LFS_clean$STAT2, labels = c(
  "Employee" = 1,
  "Self-employed" = 2))

## Adding labels to GOVTOF2 (Government office regions)

LFS_clean$GOVTOF2 <- remove_all_labels(LFS_clean$GOVTOF2) # main job
set_label(LFS_clean$GOVTOF2) <- "Government office regions" # add variable label
LFS_clean$GOVTOF2 <- set_labels(LFS_clean$GOVTOF2, labels = c(
  "North East" = 1,
  "North West" = 2, 
  "Yorkshire and Humberside" = 4,
  "East Midlands" = 5, 
  "West Midlands" = 6, 
  "Eastern" = 7,
  "London" = 8, 
  "South East" = 9,
  "South West" = 10,
  "Wales" = 11,
  "Scotland" = 12,
  "Northern Ireland" = 13))

## Recoding "Scotland North Caledonian Canal" for Scotland

LFS_clean <- LFS_clean %>% mutate(COUNTRY2 = recode_factor(factor(COUNTRY), 
                                                   `1` = "England",
                                                   `2` = "Wales",
                                                   `3` = "Scotland", 
                                                   `4` = "Scotland",
                                                   `5` = "Northern Ireland")) %>% 
                                                as_numeric(., keep.labels = TRUE)

LFS_clean$COUNTRY <- NULL # delete old variable

set_label(LFS_clean$COUNTRY2) <- "Country within UK" # add variable label

get_labels(LFS_clean$COUNTRY2, values = "n")


## Adding labels to PUBLICR (Whether working in public or private sector (reported))

LFS_clean$PUBLICR <- remove_all_labels(LFS_clean$PUBLICR) # main job
set_label(LFS_clean$PUBLICR) <- "Whether working in public or private sector (reported)" # add variable label
LFS_clean$PUBLICR <- set_labels(LFS_clean$PUBLICR, labels = c(
  "Private sector" = 1,
  "Public sector" = 2))

  
## recoding NSEC
LFS_clean <- LFS_clean %>% 
        mutate(NSEC2 = recode_factor(factor(NSEC), 
                          `1` = "Management & professional",
                          `2` = "Management & professional",
                          `3` = "Intermediate", 
                          `4` = "Small employers & own account",
                          `5` = "Lower supervisory & technical",
                          `6` = "Routine & semi-routine",
                          `7` = "Routine & semi-routine", 
                          `8` = "Never worked, unemployed, and nec")) %>% 
        as_numeric(., keep.labels = TRUE)

set_label(LFS_clean$NSEC2) <- "NS-SEC major group" # add variable label


LFS_clean <- LFS_clean %>% 
  mutate(NSEC_3 = recode_factor(factor(NSEC), 
                                `1` = "Non-working class",
                                `2` = "Non-working class",
                                `3` = "Non-working class", 
                                `4` = "Small employers & own account",
                                `5` = "Non-working class",
                                `6` = "Working class",
                                `7` = "Working class", 
                                `8` = "Never worked, unemployed, and nec")) %>% 
  as_numeric(., keep.labels = TRUE)


LFS_clean$NSEC <- NULL # delete old variable


# Industry section

LFS_clean$INDE07M <- remove_all_labels(LFS_clean$INDE07M) # main job
set_label(LFS_clean$INDE07M) <- "Industry section (main job)" # add variable label
LFS_clean$INDE07M <- set_labels(LFS_clean$INDE07M, labels = c(
                             "Agriculture, forestry and fishing" = 1,
                             "Energy and water" = 2,
                             "Manufacturing" = 3,
                             "Construction" = 4,
                             "Distribution, hotels and restaurants" = 5,
                             "Transport and communication" = 6,
                             "Banking and finance" = 7,
                             "Public admin, education and health" = 8,
                             "Other services" = 9))


LFS_clean$INDS07S <- remove_all_labels(LFS_clean$INDS07S) # second job
set_label(LFS_clean$INDS07S) <- "Industry section (Second job)" # add variable label
LFS_clean$INDS07S <- set_labels(LFS_clean$INDS07S, labels = c("Agriculture, forestry and fishing" = 1,
                                                        "Mining and quarrying" = 2,
                                                        "Manufacturing" = 3,
                                                        "Electricity, gas, steam and air conditioning supply" = 4,
                                                        "Water supply, sewerage, waste management and remediation activities" = 5,
                                                        "Construction" = 6,
                                                        "Wholesale and retail trade; repair of motor vehicles and motorcycles" = 7,
                                                        "Transportation and storage" = 8,
                                                        "Accommodation and food service activities" = 9,
                                                        "Information and communication" = 10,
                                                        "Financial and insurance activities" = 11,
                                                        "Real estate activities" = 12,
                                                        "Professional, scientific and technical activities" = 13,
                                                        "Administrative and support service activities" = 14,
                                                        "Public administration and defence; compulsory social security" = 15,
                                                        "Education" = 16,
                                                        "Human health and social work activities" = 17,
                                                        "Arts, entertainment and recreation"  = 18,
                                                        "Other service activities" = 19,
                                                        "Activities of households as employers; undifferentiated goods- and services producing activities of households for own use" = 20,
                                                        "Activities of extraterritorial organisations and bodies" = 21))


## add value labels to Occupation

LFS_clean$occu1 <- remove_all_labels(LFS_clean$occu1) # main job
set_label(LFS_clean$occu1) <- "Major occupation group (main job)" # add variable label
LFS_clean$occu1 <- set_labels(LFS_clean$occu1, labels = c(
  "Managers, Directors And Senior Officials" = 1,
  "Professional Occupations" = 2,
  "Associate Professional Occupations" = 3,
  "Administrative And Secretarial Occupations" = 4,
  "Skilled Trades Occupations" = 5,
  "Caring, Leisure And Other Service Occupations" = 6,
  "Sales And Customer Service Occupations" = 7,
  "Process, Plant And Machine Operatives" = 8,
  "Elementary Occupations" = 9))

LFS_clean$occu2 <- remove_all_labels(LFS_clean$occu2) # main job
set_label(LFS_clean$occu2) <- "Major occupation group (second job)" # add variable label
LFS_clean$occu2 <- set_labels(LFS_clean$occu2, labels = c(
  "Managers, Directors And Senior Officials" = 1,
  "Professional Occupations" = 2,
  "Associate Professional Occupations" = 3,
  "Administrative And Secretarial Occupations" = 4,
  "Skilled Trades Occupations" = 5,
  "Caring, Leisure And Other Service Occupations" = 6,
  "Sales And Customer Service Occupations" = 7,
  "Process, Plant And Machine Operatives" = 8,
  "Elementary Occupations" = 9))

## adding value labels to FTPTWK

LFS_clean$FTPTWK <- remove_all_labels(LFS_clean$FTPTWK) # main job
set_label(LFS_clean$FTPTWK) <- "Whether full or part time in main job" # add variable label
LFS_clean$FTPTWK <- set_labels(LFS_clean$FTPTWK, labels = c(
  "Full-time" = 1,
  "Part-time" = 2))

## adding value labels to YPTJOB

LFS_clean$YPTJOB <- remove_all_labels(LFS_clean$YPTJOB)
set_label(LFS_clean$YPTJOB) <- "Reason for part time job" # add variable label
LFS_clean$YPTJOB <- set_labels(LFS_clean$YPTJOB, labels = c(
  "Student/still at school" = 1,
  "Ill/disabled" = 2,
  "Could not find full-time job" = 3,
  "Did not want full-time job" = 4))

## adding value labels to JOBTYP main and second job

LFS_clean$JOBTYP <- remove_all_labels(LFS_clean$JOBTYP)
set_label(LFS_clean$JOBTYP) <- "Whether job permanent" # add variable label
LFS_clean$JOBTYP <- set_labels(LFS_clean$JOBTYP, labels = c(
  "Permanent" = 1,
  "Not permanent in some way" = 2))

get_labels(LFS_clean$JOBTYP, values = "n") # check value labels 

LFS_clean$JOBTYP2 <- remove_all_labels(LFS_clean$JOBTYP2)
set_label(LFS_clean$JOBTYP2) <- "Permanency of second job" # add variable label
LFS_clean$JOBTYP2 <- set_labels(LFS_clean$JOBTYP2, labels = c(
  "Permanent" = 1,
  "Not permanent in some way" = 2))

get_labels(LFS_clean$JOBTYP2, values = "n") # check value labels 

## adding value labels to WHYTMP6

LFS_clean$WHYTMP6 <- remove_all_labels(LFS_clean$WHYTMP6)
set_label(LFS_clean$WHYTMP6) <- "Reason for part time job" # add variable label
LFS_clean$WHYTMP6 <- set_labels(LFS_clean$WHYTMP6, labels = c(
  "Contract which includes period of training" = 1,
  "Had a contract for probationary period" = 2,
  "Could not find a permanent job" = 3,
  "Did not want a permanent job" = 4,
  "Some other reason" = 5))

get_labels(LFS_clean$WHYTMP6, values = "n") # check value labels 


## adding value labels to SECJOB

LFS_clean$SECJOB <- remove_all_labels(LFS_clean$SECJOB)
set_label(LFS_clean$SECJOB) <- "Whether had second job in reference week" # add variable label
LFS_clean$SECJOB <- set_labels(LFS_clean$SECJOB, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$SECJOB, values = "n") # check value labels 

##  adding value labels to Y2JOB

LFS_clean$Y2JOB <- remove_all_labels(LFS_clean$Y2JOB)
set_label(LFS_clean$Y2JOB) <- "Whether had 2 jobs because of a change of job in reference week" # add variable label
LFS_clean$Y2JOB <- set_labels(LFS_clean$Y2JOB, labels = c(
  "Yes (changed jobs during week)" = 1,
  "No" = 2))

get_labels(LFS_clean$Y2JOB, values = "n") # check value labels 

##  adding value labels to VARYHR

LFS_clean$VARYHR <- remove_all_labels(LFS_clean$VARYHR)
set_label(LFS_clean$VARYHR) <- "Whether weekly hours tend to vary" # add variable label
LFS_clean$VARYHR <- set_labels(LFS_clean$VARYHR, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$VARYHR, values = "n") # check value labels 

## adding variable labels to hours 

set_label(LFS_clean$BUSHR) <- "Total usual hours excluding overtime (main job)" # add variable label
set_label(LFS_clean$BACTHR) <- "Total actual hours excluding overtime (main job)"  # add variable label
set_label(LFS_clean$TTACHR) <- "Total actual hours including overtime (main job)" # add variable label

set_label(LFS_clean$ACTHR2) <- "Actual hours in second job including overtime" # add variable label

set_label(LFS_clean$SUMHRS) <- "Total hours worked in reference week in main and second jobs"


## adding labels to education variables

LFS_clean$higher <- remove_all_labels(LFS_clean$higher) # higher education 
set_label(LFS_clean$higher) <- "Type of higher degree" # add variable label
LFS_clean$higher <- set_labels(LFS_clean$higher, labels = c(
  "Doctorate" = 1,
  "Masters" = 2,
  "Postgraduate Certificate in Education" = 3,
  "Other postgraduate degree or professional qualification" = 4,
  "Don’t know" = 5))

get_labels(LFS_clean$higher, values = "n") # check value labels 

LFS_clean$degree <- remove_all_labels(LFS_clean$degree) # first degree education
set_label(LFS_clean$degree) <- "Type of degree already held" # add variable label
LFS_clean$degree <- set_labels(LFS_clean$degree, labels = c(
  "A higher degree (including PGCE)" = 1,
  "A first degree" = 2,
  "A foundation degree" = 3,
  "A graduate membership of a professional institution" = 4,
  "Other" = 5,
  "Don’t know" = 6))

get_labels(LFS_clean$degree, values = "n") # check value labels 

LFS_clean$quali <- remove_all_labels(LFS_clean$quali) # any general qualifications  
set_label(LFS_clean$quali) <- "Highest qualification" # add variable label
LFS_clean$quali <- set_labels(LFS_clean$quali, labels = c(
  "Degree or equivalent)" = 1,
  "Higher education" = 2,
  "GCE, A-level or equivalent" = 3,
  "GCSE grades A*-C or equivalent" = 4,
  "Other qualifications" = 5,
  "No qualification" = 6,
  "Don’t know" = 7))

get_labels(LFS_clean$quali, values = "n") # check value labels 


##  adding value labels to DIFJOB

LFS_clean$DIFJOB <- remove_all_labels(LFS_clean$DIFJOB)
set_label(LFS_clean$DIFJOB) <- "Whether looking for different or additional paid job or business" # add variable label
LFS_clean$DIFJOB <- set_labels(LFS_clean$DIFJOB, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$DIFJOB, values = "n") # check value labels 


##  adding value labels to ADDJOB

LFS_clean$ADDJOB <- remove_all_labels(LFS_clean$ADDJOB)
set_label(LFS_clean$ADDJOB) <- "Whether seeking replacement or additional job" # add variable label
LFS_clean$ADDJOB <- set_labels(LFS_clean$ADDJOB, labels = c(
  "A new job to replace your present (main) job" = 1,
  "An additional job" = 2))

get_labels(LFS_clean$ADDJOB, values = "n") # check value labels 


##  adding value labels to PREFHR

LFS_clean$PREFHR <- remove_all_labels(LFS_clean$PREFHR)
set_label(LFS_clean$PREFHR) <- "Preferred working hours in new job being looked for" # add variable label
LFS_clean$PREFHR <- set_labels(LFS_clean$PREFHR, labels = c(
  "Longer" = 1,
  "Shorter" = 2,
  "The same" = 3,
  "Don’t know, no preference" = 4))

get_labels(LFS_clean$PREFHR, values = "n") # check value labels 


##  adding value labels to UNDEMP

LFS_clean$UNDEMP <- remove_all_labels(LFS_clean$UNDEMP)
set_label(LFS_clean$UNDEMP) <- "Whether would like to work longer hours, at current basic rate of pay, given the opportunity" # add variable label
LFS_clean$UNDEMP <- set_labels(LFS_clean$UNDEMP, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$UNDEMP, values = "n") # check value labels 

# check variables and labels

view_df(LFS_clean, show.id = FALSE, file = "./data/variable_view.html", max.len = 40) 

### saving the clean dataset

save(LFS_clean, file = "./data/LFS_clean.rda")

rm(list = ls()) # clean the global environment

######################### END WORKING WITH ORIGINAL DATASETS ##############################