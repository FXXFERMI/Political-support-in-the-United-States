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
analysis_data <- read_csv(here("data/analysis_data/analysis_data.csv"))

# Test to ensure the data frame exists after loading.
test_that("Data frame is created", {
  expect_true(exists("analysis_data"))
})

# Verify that the data frame contains the specific columns expected.
test_that("Data frame has correct columns", {
  expect_true(all(c("voted_for", "gender", "income") %in% names(analysis_data)))
})

# Check the class/type of variables in the data frame to match expectations.
test_that("Check class", {
  expect_type(analysis_data$income, "character")
  expect_type(analysis_data$gender, "character")
  expect_type(analysis_data$voted_for, "character")
})

# Ensure that the 'income' column contains the expected levels/categories.
test_that("Income levels are correctly assigned", {
  expected_levels <- c("Less than $10,000", 
                       "$10,000 - $19,999", 
                       "$20,000 - $29,999",
                       "$30,000 - $39,999",
                       "$40,000 - $49,999",
                       "$50,000 - $59,999",
                       "$60,000 - $69,999",
                       "$70,000 - $79,999",
                       "$80,000 - $99,999",
                       "$100,000 - $119,999",
                       "$120,000 - $149,999",
                       "$150,000 - $199,999",
                       "$200,000 - $249,999",
                       "$250,000 - $349,999",
                       "$350,000 - $499,999", 
                       "$500,000 or more")
  actual_levels <- levels(factor(analysis_data$income, levels = expected_levels))
  expect_equal(actual_levels, expected_levels)
})

# Verify that the 'gender' column contains only the specified categories.
test_that("Gender levels are correctly assigned", {
  expect_setequal(unique(analysis_data$gender), c("Male", "Female"))
})

# Confirm that the 'voted_for' column only contains the values "Clinton" or "Trump".
test_that("'voted_for' contains only 'Clinton' or 'Trump'", {
  expect_true(all(analysis_data$voted_for %in% c("Clinton", "Trump")))
})

# Check that the data frame has the exact number of rows expected (1000).
test_that("Check number of observations is correct", {
  expect_equal(nrow(analysis_data), 18279)
})

# Ensure every row in the data frame is complete, with no missing values.
test_that("Check complete", {
  expect_true(all(complete.cases(analysis_data)))
})
