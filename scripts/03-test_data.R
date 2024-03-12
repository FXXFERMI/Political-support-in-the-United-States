#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Siqi Fei
# Date: 06 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####
simulated_data <- read_csv("data/simulated_data/simulated_data.csv")
test_that("Check class", {
  expect_type(simulated_data$education, "character")
  expect_type(simulated_data$gender, "character")
  expect_type(simulated_data$supports_biden, "character")
})

test_that("Check number of observations is correct", {
  expect_equal(nrow(simulated_data), 1000)
})

test_that("Check complete", {
  expect_true(all(complete.cases(simulated_data)))
})
