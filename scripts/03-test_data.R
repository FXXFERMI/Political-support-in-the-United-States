#### Preamble ####
# Purpose: Tests the integrity and consistency of simulated data for a political preference survey, ensuring it meets expected criteria such as correct columns, data types, specific value ranges, and completeness.
# Author: Siqi Fei
# Date: 06 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' for data manipulation, 'testthat' for unit testing, and 'here' for path handling.
# Any other information needed? Ensure the 'simulated_data.csv' file exists within the 'data/simulated_data' directory.

#### Workspace setup ####
library(tidyverse) # Loads the 'tidyverse' packages for data manipulation.
library(testthat) # Loads the 'testthat' package for testing our data.
library(here) # Loads the 'here' package for easy file path construction.

#### Test data ####
# Read in the simulated data from a specific directory.
simulated_data <- read_csv(here("data/simulated_data/simulated_data.csv"))

# Test to ensure the data frame exists after loading.
test_that("Data frame is created", {
  expect_true(exists("simulated_data"))
})

# Verify that the data frame contains the specific columns expected.
test_that("Data frame has correct columns", {
  expect_true(all(c("supports_trump", "income", "gender") %in% names(simulated_data)))
})

# Check the class/type of variables in the data frame to match expectations.
test_that("Check class", {
  expect_type(simulated_data$income, "character")
  expect_type(simulated_data$gender, "character")
  expect_type(simulated_data$supports_trump, "character")
})

# Ensure that the 'income' column contains the expected levels/categories.
test_that("Income levels are correctly assigned", {
  expected_levels <- c("Under $30,000", "$30,000-$49,999", "$50,000-$99,999", 
                       "$100,000-$199,999", "$200,000-$249,999", "$250,000 or more")
  actual_levels <- levels(factor(simulated_data$income, levels = expected_levels))
  expect_equal(actual_levels, expected_levels)
})

# Verify that the 'gender' column contains only the specified categories.
test_that("Gender levels are correctly assigned", {
  expect_setequal(unique(simulated_data$gender), c("Male", "Female"))
})

# Confirm that the 'supports_trump' column only contains the values "yes" or "no".
test_that("'supports_trump' contains only 'yes' or 'no'", {
  expect_true(all(simulated_data$supports_trump %in% c("yes", "no")))
})

# Check that the data frame has the exact number of rows expected (1000).
test_that("Check number of observations is correct", {
  expect_equal(nrow(simulated_data), 1000)
})

# Ensure every row in the data frame is complete, with no missing values.
test_that("Check complete", {
  expect_true(all(complete.cases(simulated_data)))
})
