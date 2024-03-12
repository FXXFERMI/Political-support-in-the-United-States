#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers to prepare for analysis. This includes filtering observations, recoding variables, and selecting relevant data.
# Author: Siqi Fei
# Date: 06 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' package, specifically for data manipulation and writing the cleaned data to a new CSV file.
# Any other information needed? Make sure the raw data file is located at 'data/raw_data/raw_data.csv' before running this script.

#### Workspace setup ####
library(tidyverse) # Load the 'tidyverse' package for data manipulation and visualization tools.

#### Clean data ####
# Load the raw data from a CSV file.
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Clean and prepare the data for analysis.
cleaned_data <-
  raw_data |>
  filter(votereg == 1, CC18_317 %in% c(1, 2)) |> # Filter data for registered voters who voted for Clinton or Trump.
  mutate(
    voted_for = if_else(CC18_317 == 1, "Clinton", "Trump"), # Recode voting choices to 'Clinton' or 'Trump'.
    voted_for = as_factor(voted_for), # Convert 'voted_for' to a factor for categorical analysis.
    gender = if_else(gender == 1, "Male", "Female"), # Recode gender values to 'Male' or 'Female'.
    gender = as_factor(gender), # Convert 'gender' to a factor for categorical analysis.
    income = case_when(
      # Recode family income to categorical labels.
      faminc_new == 1  ~ "Less than $10,000",
      faminc_new == 2  ~ "$10,000 - $19,999",
      # ... additional income levels ...
      faminc_new == 16 ~ "$500,000 or more"
    ),
    income = factor(
      income,
      levels = c(
        "Less than $10,000", "$10,000 - $19,999", "...", "$500,000 or more"
      ),
      ordered = TRUE # Ensure 'income' is treated as an ordered factor.
    )
  ) |>
  select(voted_for, gender, income) # Select only the variables of interest for further analysis.

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv") # Save the cleaned and prepared data to a new CSV file for analysis.
