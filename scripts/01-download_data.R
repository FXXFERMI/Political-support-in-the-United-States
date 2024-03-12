#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author:  Siqi Fei
# Date: 06 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(dataverse)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
###########################待改！！！！######################
###########################年份！！！！ Link!!!!! reference!!!! Variable !!!!######################
ces2020 <-
  get_dataframe_by_name(
    filename = "CES20_Common_OUTPUT_vv.csv",
    dataset = "10.7910/DVN/E9N6PH",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, CC20_410, gender, educ)

###########################待改！！！！######################

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(ces2020, "data/raw_data/raw_data.csv") 

         
