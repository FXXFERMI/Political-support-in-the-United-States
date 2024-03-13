# Income and Gender: Forecasting the American Voters' Choices in 2018

# Overview
This repository contains all materials related to the paper "Income and Gender: Forecasting the American Voters' Choices in 2018," authored by Siqi Fei. The study examines the predictive power of income and gender on the voting behavior in the 2018 US elections using the Cooperative Congressional Election Study (CCES) 2018 dataset.

## File Structure

- `data/`:
  - `raw_data/`:
    - `raw_data.csv`: Original CCES 2018 data downloaded from Harvard Dataverse.
  - `analysis_data/`:
    - `analysis_data.csv`: Data cleaned and prepared for analysis, including transformations and filtering based on income and     gender.
  - `simulated_data`:
    - `simulated_data.csv`: Contains datasets generated through simulations.
    
- `models/`: 
  - `political_preferences_model.rds`: Bayesian logistic regression models saved as RDS files, detailing the effects of income and gender on voter choice.
  
- `paper/`: 
  - `references.bib`: Bibliography file containing all the citation information used within the paper.
  - `paper.qmd`: Quarto source file for the main paper document. This markdown file includes all text, code, and commands to compile the paper.
  - `paper.pdf`: The compiled and formatted version of the paper, ready for distribution or publication.
  - `datasheet.qmd`: Quarto source file containing detailed data descriptions, metadata, and other relevant information that supports the paper's content.
  - `datasheet.pdf`: Compiled version of the datasheet, providing an accessible format for readers who wish to understand the data in greater depth.

- `scripts/`: 
  - `00-simulate_data.R`: Script to generate simulated datasets. This is typically used to create data that matches the characteristics of the original data, allowing for testing and validation of the analysis methods.
  - `01-download_data.R`: Script to automate the downloading of the raw data from the specified data source, ensuring a reproducible data retrieval process.
  - `02-data_cleaning.R`: Script for cleaning and preprocessing the raw data. This may include handling missing values, filtering data, and making transformations necessary for analysis.
  - `03-test_data.R`: Script containing tests to ensure the integrity and validity of the data after the cleaning process. This could involve checks for consistency, correctness, and completeness.
  - `04-model.R`: Script for building and validating the statistical model(s) used in the analysis. This involves specifying the model, fitting it to the data, and possibly performing some model diagnostics.

- `other/`: 
  - `sketches/`:
    - `dataset.jpg`:An image file depicting the initial organization and structure of the dataset used in the research.
    - `graph.jpg`: A visual draft or preliminary version of a graph that was likely refined for inclusion in the final paper.
  - `llm/`: 
    - `usage.txt`: A detailed log file documenting the usage of language model tools throughout the research process.
  
## Data Source

The primary dataset used in this study is the CCES 2018, available at [Harvard Dataverse](https://doi.org/10.7910/DVN/ZSBZ7K). The dataset was accessed and utilized under the terms provided by Harvard Dataverse.


## How to Use

1. Clone or download this repository to your local machine.
2. Ensure you have R and the necessary packages installed (tidyverse, rstanarm, here, and others as specified in the `scripts/` directory).
3. Run the scripts in the `scripts/` directory to reproduce the data cleaning process, analysis, and model fitting.
4. Explore the `paper/` directory to view or modify the Quarto document and compile it to produce the final paper.

## License

This project is licensed under the MIT License. See the LICENSE file in the repository root for more information.

## Acknowledgments

Thanks to Brian Schaffner, Stephen Ansolabehere, and Sam Luks for the CCES 2018 dataset, and the R package developers whose work facilitated this analysis.

## Contact

For any queries regarding this study, please contact Siqi Fei at fermi.fei@mail.utoronto.ca. Further materials and updates can be found at [GitHub repository](https://github.com/FXXFERMI/Political-support-in-the-United-States.git).

# LLM usage
This project used Large Language Models at datasheet.qmd. Some aspects of the abstract and answers were written with the help of Chat-GPT4 and the entire chat history is available in 'other/llm/usage.txt'
