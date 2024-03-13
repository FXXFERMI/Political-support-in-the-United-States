#### Preamble ####
# Purpose: Simulates political preferences among US citizens based on income and gender.
# Author: Siqi Fei
# Date: 06 March 2024
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: R environment, `tidyverse` package
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####

# Ensure reproducibility of random data generation.
set.seed(123)

# Set the number of observations for the simulated dataset.
num_obs <- 1000

# Create a tibble with simulated data on US political preferences.
us_political_preferences <- tibble(
  income = sample(0:5, size = num_obs, replace = TRUE),# Randomly assign income levels to individuals.
  gender = sample(0:1, size = num_obs, replace = TRUE),# Randomly assign gender to individuals.
  support_prob = ((income + gender) / 6), # Calculate support probability based on income and gender.
) |>
  mutate(
    supports_trump = if_else(runif(n = num_obs) < support_prob, "yes", "no"),# Determine support for Trump based on calculated probability.
    income = case_when(
      income == 0 ~ "Under $30,000", # Recode income levels to categorical labels.
      income == 1 ~ "$30,000-$49,999",
      income == 2 ~ "$50,000-$99,999",
      income == 3 ~ "$100,000-$199,999",
      income == 4 ~ "$200,000-$249,999",
      income == 5 ~ "$250,000 or more"
    ),
    gender = if_else(gender == 0, "Male", "Female")# Recode gender to categorical labels.
  ) |>
  select(-support_prob, supports_trump, income, gender)# Finalize dataset by selecting and rearranging columns.

#### Save data ####
write.csv(us_political_preferences, "data/simulated_data/simulated_data.csv")# Save the simulated dataset to a CSV file.
