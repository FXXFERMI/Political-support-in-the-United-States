#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Siqi Fei
# Date: 06 March 2024
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
###########################待改！！！！######################
set.seed(853)

num_obs <- 1000

us_political_preferences <- tibble(
  education = sample(0:4, size = num_obs, replace = TRUE),
  gender = sample(0:1, size = num_obs, replace = TRUE),
  support_prob = ((education + gender) / 5),
) |>
  mutate(
    supports_biden = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    education = case_when(
      education == 0 ~ "< High school",
      education == 1 ~ "High school",
      education == 2 ~ "Some college",
      education == 3 ~ "College",
      education == 4 ~ "Post-grad"
    ),
    gender = if_else(gender == 0, "Male", "Female")
  ) |>
  select(-support_prob, supports_biden, gender, education)
###########################待改！！！！######################

write.csv(us_political_preferences, "data/simulated_data/simulated_data.csv")
