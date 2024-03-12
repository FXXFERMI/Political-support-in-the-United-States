#### Preamble ####
# Purpose: Downloads and saves the data from the Cooperative Congressional Election Study (CCES) 2018 survey.
# Author:  Siqi Fei
# Date: 06 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'dataverse' package for data download and the 'tidyverse' package for data manipulation.
# Any other information needed? Ensure you have access to the Harvard Dataverse repository and the R environment is properly set up to use the specified packages.


#### Workspace setup ####
library(dataverse)# Load the 'dataverse' package to access datasets stored in Dataverse repositories.
library(tidyverse)# Load the 'tidyverse' package for data manipulation and visualization.


#### Download data ####

# Downloads the 2018 CCES common dataset from the Harvard Dataverse repository.
ces2018 <-
  get_dataframe_by_name(
    filename = "cces18_common_vv.tab",# The name of the file to download.
    dataset = "10.7910/DVN/ZSBZ7K", # Unique identifier for the dataset within the Dataverse.
    server = "dataverse.harvard.edu", # Specifies the server hosting the dataset (Harvard Dataverse).
    .f = read.delim # Function to read the dataset format correctly (tab-delimited in this case).
  ) |>
  select(votereg, CC18_317, gender, faminc_new) # Selects specific variables of interest from the dataset for further analysis.

#### Save data ####
write_csv(ces2018, "data/raw_data/raw_data.csv") # Saves the filtered dataset as a CSV file in the specified directory.

         
