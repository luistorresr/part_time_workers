
# IMPORTING DATA

## IMPORTANT: There is no need to run this script as the resulted database is made available for the analysis.

## (1) UK LABOUR FORCE SURVEY

### This and the following scripts are based on the Labour Force Survey - all datasets from 2018 to 2022 (quarters only) 
### To run this script, the UK LFS datasets (quarters only) from 2018 onwards are needed. They are available at https://ukdataservice.ac.uk

### Data files

#### Temporarily set the working directory where the data files are located.

setwd("C:/Users/luist/The University of Nottingham/Underemployment - General/raw_datasets/LFS")

jm18 <- read_spss("8343/UKDA-8343-spss/spss/spss25/lfsp_jm18_eul.sav") # January to March (wave 1)
aj18 <- read_spss("8381/UKDA-8381-spss/spss/spss24/lfsp_aj18_eul.sav") # April to June (wave 2)
js18 <- read_spss("8407/UKDA-8407-spss/spss/spss25/lfsp_js18_eul_pwt18.sav") # July to September (wave 3)
od18 <- read_spss("8447/UKDA-8447-spss/spss/spss24/lfsp_od18_end_user_pwt18.sav") # October to December (wave 4)

jm19 <- read_spss("8485/UKDA-8485-spss/spss/spss24/lfsp_jm19_eul_pwt18.sav") # January to March (wave 1)
aj19 <- read_spss("8563/UKDA-8563-spss/spss/spss24/lfsp_aj19_eul_pwt18.sav") # April to June (wave 2)
js19 <- read_spss("8588/UKDA-8588-spss/spss/spss25/lfsp_js19_eul_pwt18.sav") # July to September (wave 3)
od19 <- read_spss("8614/UKDA-8614-spss/spss/spss25/lfsp_od19_eul.sav") # October to December (wave 4)

jm20 <- read_spss("8639/UKDA-8639-spss/spss/spss25/lfsp_jm20_eul_pwt22.sav") # January to March (wave 1)
aj20 <- read_spss("8671/UKDA-8671-spss/spss/spss25/lfsp_aj20_eul_pwt22.sav") # April to June (wave 2)
js20 <- read_spss("8720/UKDA-8720-spss/spss/spss25/lfsp_js20_eul_pwt22.sav") # July to September (wave 3)
od20 <- read_spss("8777/UKDA-8777-spss/spss/spss25/lfsp_od20_eul_pwt22.sav") # October to December (wave 4)

jm21 <- read_spss("8806/UKDA-8806-spss/spss/spss25/lfsp_jm21_eul_pwt22.sav") # January to March 2021 (wave 1)
aj21 <- read_spss("8826/UKDA-8826-spss/spss/spss25/lfsp_aj21_eul_pwt22.sav") # April to June 2021 (wave 2)
js21 <- read_spss("8872/UKDA-8872-spss/spss/spss25/lfsp_js21_eul_pwt22.sav") # July to September (wave 3)
od21 <- read_spss("8915/UKDA-8915-spss/spss/spss25/lfsp_od21_eul_pwt22.sav") # October to December (wave 4)

jm22 <- read_spss("8957/UKDA-8957-spss/spss/spss25/lfsp_jm22_eul_pwt22.sav") # January to March (wave 1)
aj22 <- read_spss("8999/UKDA-8999-spss/spss/spss25/lfsp_aj22_eul_pwt22.sav") # April to June (wave 2)
js22 <- read_spss("9027/UKDA-9027-spss/spss/spss25/lfsp_js22_eul_pwt22.sav") # July to September (wave 3)
od22 <- read_spss("9052/UKDA-9052-spss/spss/spss25/lfsp_od22_eul_pwt22.sav") # October to December (wave 4) 

##### Set the working directory back to where your computer folder where you created the R-Studio project

setwd("C:/Users/luist/OneDrive - The University of Nottingham/NUBS UK/4 - Research/Projects/TimeWise/part_time_workers")

##### Save LFS imported datasets

save(jm18,aj18,js18,od18,jm19,aj19,js19,od19,jm20,aj20,js20,od20,jm21,aj21,
     js21,od21,jm22,aj22,js22,od22, file = "data/LFS_base.rda")

# Load database (in case it is not in the workspace)

load("data/LFS_base.rda")

######################## END IMPORTING DATA ####################################