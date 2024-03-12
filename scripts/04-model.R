#### Preamble ####
# Purpose: Models the relationship between voting preference and predictors such as gender and income using logistic regression, implemented with Bayesian methods via the rstanarm package.
# Author: Siqi Fei
# Date: 06 March 2024
# Author: Siqi Fei
# Date: 06 March 2024
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'tidyverse' for data manipulation and 'rstanarm' for performing Bayesian regression.
# Any other information needed? Ensure the analysis_data.csv file is available in the 'data/analysis_data' directory and RStan is properly configured for use with rstanarm.
#                               To install the `rstanarm` package, if it doen't work via console or terminal, try to download directly from url to local and import the file to RStudio.

#### Workspace setup ####
library(tidyverse) # Loads the 'tidyverse' package for data manipulation.
library(rstanarm) # Loads the 'rstanarm' package for Bayesian regression analysis.

#### Read data ####
# Reads the prepared analysis data from a CSV file.
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
# Fits a Bayesian logistic regression model to the analysis data.
political_preferences <-
  stan_glm(
    factor(voted_for) ~ gender + income, # Defines the model formula.
    data = analysis_data, # Specifies the dataset to use.
    family = binomial(link = "logit"), # Indicates the use of logistic regression.
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE), # Sets a normal prior for the coefficients.
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE), # Sets a normal prior for the intercept.
    seed = 123 # Sets a seed for reproducibility of the model fitting.
  )

#### Save model ####
# Saves the fitted model object for future use.
saveRDS(
  political_preferences,
  file = "models/political_preferences_model.rds"
)
