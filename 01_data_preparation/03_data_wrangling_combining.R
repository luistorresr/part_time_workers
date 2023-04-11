##################### COMBINING DATASETS ##############################

# Standardizing variable names across datasets

## Creating the variable "quarter", "PIWT" for income weight, YEAR, and PWT for population weighs among others

jm18 <- jm18 %>% mutate(year = 2018, quarter = 1, sequence = 1, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj18 <- aj18 %>% mutate(year = 2018, quarter = 2, sequence = 2, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js18 <- js18 %>% mutate(year = 2018, quarter = 3, sequence = 3, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od18 <- od18 %>% mutate(year = 2018, quarter = 4, sequence = 4, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm19 <- jm19 %>% mutate(year = 2019, quarter = 1, sequence = 5, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj19 <- aj19 %>% mutate(year = 2019, quarter = 2, sequence = 6, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js19 <- js19 %>% mutate(year = 2019, quarter = 3, sequence = 7, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od19 <- od19 %>% mutate(year = 2019, quarter = 4, sequence = 8, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm20 <- jm20 %>% mutate(year = 2020, quarter = 1, sequence = 9, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj20 <- aj20 %>% mutate(year = 2020, quarter = 2, sequence = 10, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js20 <- js20 %>% mutate(year = 2020, quarter = 3, sequence = 11, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od20 <- od20 %>% mutate(year = 2020, quarter = 4, sequence = 12, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, 
                        occu1 = SC10MMJ, 
                        occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm21 <- jm21 %>% mutate(year = 2021, quarter = 1, sequence = 13, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj21 <- aj21 %>% mutate(year = 2021, quarter = 2, sequence = 14, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js21 <- js21 %>% mutate(year = 2021, quarter = 3, sequence = 15, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od21 <- od21 %>% mutate(year = 2021, quarter = 4, sequence = 16, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm22 <- jm22 %>% mutate(year = 2022, quarter = 1, sequence = 17, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)

aj22 <- aj22 %>% mutate(year = 2022, quarter = 2, sequence = 18, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)

js22 <- js22 %>% mutate(year = 2022, quarter = 3, sequence = 19, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)

od22 <- od22 %>% mutate(year = 2022, quarter = 4, sequence = 20, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, 
                        occu1 = SC20MMJ, 
                        occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)


# Selecting variables

variables <- c(
       
         # SERIES
       
        "year",
        "quarter",
        "sequence", 
        
        # BASIC FILTERS
        
        "ILODEFR", # Basic economic activity (ILO definition) (not include 4 = under 16)
        "INECAC05", # Basic economic activity (ILO definition) (extended)
        "STAT",  # Employment status (respondents currently in work or who have worked in the last eight years)

        # DEMOGRAPHICS
        
        "COUNTRY",  # Country within UK
        "GOVTOF2", # gov region
        "SEX", # 1 male, 2 female
        "AGE", # age for filtering
        "AGEEUL", # age bands
        "NSEC", # occupational category 
        "ETHUKEUL", # ethnic group

        # MAIN JOB
        
        "STATR", # Employment status in main job (reported)
        "PUBLICR", # Whether working in public or private sector (reported)
        "INDE07M", # Industry section in main job 
        "occu1", # occupation in main job

        ## MAIN JOB - overall work arrangements
        
        ### full vs part time (complement with hours data)
        
        "FTPTWK", # Whether full or part time in main job (1 = full / 2 = part time)        
        "YPTJOB", # Reason for part time job (1 = Student / 2 = Ill or disable / 3 = could not find / 4 = did not want)

        ### work arrangements
        
        "JOBTYP", # Whether job permanent (1 = permanent / 2 = Not permanent in some way)
        "WHYTMP6", # Reason for the job to be temporary 

        # SECOND JOB
        
        "SECJOB", # Whether had second job in reference week
        "Y2JOB", # Whether had 2 jobs because of a change of job in reference week 
        "STAT2", # Employment status for those in regular second jobs
        "occu2", # occupation in second job
        
        ## SECOND JOB - overall work arrangements
        
        "JOBTYP2", # Whether job permanent (1 = permanent / 2 = Not permanent in some way)
       
        # HOURS
        
        ## overall 
        
        "SUMHRS", # Total hours worked in reference week in main and second jobs
        "VARYHR", # Whether weekly hours tend to vary
        
        ### Main job 
        "BUSHR", # Total usual hours excluding overtime (main job)" 
        "BACTHR", # Basic actual hours in main job (per week)- It does not include overtime (paid or unpaid).
        "TTACHR", # Total actual hours including overtime (main job)
        
        ### Second job
        
        "ACTHR2", # Actual hours in second job including overtime (filter by Y2Job=2)
        
        ### Main and second jobs
        
        "SUMHRS", # Total hours worked in reference week in main and second jobs

        # EARNINGS           
       
        "GRSSWK", # Gross weekly pay in main job
        "GRSSWK2", # Gross weekly pay in second job
        
        # QUALIFICATIONS
        
        "higher", # higher degree
        "degree", # degrees
        "quali", # qualification
      
        ## Seeking for work
        "DIFJOB", # Whether looking for different or additional paid job or business
        "ADDJOB", # replace or add present job (filter DIFJOB =1)
        
        "PREFHR", # Preferred working hours in new job being looked for (filer by LOOKM11 =/= 5 or 6)
        
        # UNDER-EMPLOYMENT section on the LFS survey
        
        "UNDEMP", # Whether would like to work longer hours, at current basic rate of pay (filter by DIFJOB = 2)
        "UNDHRS", # Number of extra hours would like to work (filter by UNDEMP = 1)

        # weights
        "PWT", # Person weight
        "PIWT" # Income weight 
        ) 

#### selecting the variables in all dataset and creating temporary datasets

t53 <- jm18 %>% select(all_of(variables))
t54 <- aj18 %>% select(all_of(variables))
t55 <- js18 %>% select(all_of(variables))
t56 <- od18 %>% select(all_of(variables))

t57 <- jm19 %>% select(all_of(variables))
t58 <- aj19 %>% select(all_of(variables))
t59 <- js19 %>% select(all_of(variables))
t60 <- od19 %>% select(all_of(variables))

t61 <- jm20 %>% select(all_of(variables)) 
t62 <- aj20 %>% select(all_of(variables))
t63 <- js20 %>% select(all_of(variables))
t64 <- od20 %>% select(all_of(variables))

t65 <- jm21 %>% select(all_of(variables))
t66 <- aj21 %>% select(all_of(variables))
t67 <- js21 %>% select(all_of(variables))
t68 <- od21 %>% select(all_of(variables))

t69 <- jm22 %>% select(all_of(variables))
t70 <- aj22 %>% select(all_of(variables))
t71 <- js22 %>% select(all_of(variables))
t72 <- od22 %>% select(all_of(variables))

#### combine all temporary datasets

LFS_combined <- rbind(t53, t54, t55, t56, t57, t58, t59, t60,t61, t62, t63, t64, t65, t66, t67, t68, t69, t70, t71, t72) # combined database

save(LFS_combined, file = "data/LFS_combined.rda") # saving combine dataset in working directory

rm(list = ls()) # clean the global environment to save memory

######################### END COMBINING DATASETS ####################################