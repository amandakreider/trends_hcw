# Trends in the Home Care Workforce

The code in this repository reproduces the analytic datasets and figures for the following manuscript: 

Kreider, Amanda R., and Rachel M. Werner. 2023. 
  “The Home Care Workforce Has Not Kept Pace With 
  Growth In Home And Community-Based Services.” 
  *Health Affairs (Project Hope)* 42 (5): 650–57. 
  https://doi.org/10.1377/hlthaff.2022.01351.

## Steps to replicate the analysis:

1. Download project files to your local machine (make note of path).

2. Download the raw ACS data from the [IPUMS ACS website](https://usa.ipums.org/usa/), and save it as ~/data/acs/usa_00015.dat. 
  - Choose the samples listed in the [codebook](https://github.com/amandakreider/trends_hcw/blob/master/data/acs/usa_00015.cbk#L1), lines 1-65.
  - Choose the variables listed in the [codebook](https://github.com/amandakreider/trends_hcw/blob/master/data/acs/usa_00015.cbk#L69), lines 69-105.

3. Update the path at the top of run_all.do (global PATH "~/trends_hcw") to correspond with the location of the project files on your local machine.

4. Run run_all.do in Stata to reproduce all derived datasets and graphs for the manuscript. 

  - 01_usa_00015.do cleans the raw IPUMS American Community Survey (ACS) data.
  - 02_build_kff_data.do uses data from Kaiser Family Foundation (KFF) and data on state Medicaid HCBS programs' start and end dates collected by the study team to construct a dataset with annual counts of HCBS participants.
  - 03_build_analysis_data.do constructs the analysis dataset.
  - 04_analysis.do creates the figures for the manuscript.

## Running the code: 

This code is for Stata and has been verified to run in Stata/SE 17.0 for Unix. When you run the code, the following packages will be installed on your machine:

1. gtools
2. carryforward
3. keeporder
4. blindschemes

For questions, please [contact Amanda Kreider](mailto:akreid@wharton.upenn.edu).

## Raw project data sourced from:

1. [IPUMS ACS](https://usa.ipums.org/usa/)
2. [Kaiser Family Foundation](https://www.kff.org/health-reform/state-indicator/home-health-participants/?currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D)

