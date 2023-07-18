set more off
clear all

global PATH "~/trends_hcw" /* Update this path. */

/* 
Author: Amanda Kreider
Updated: 2023-07-18

This file reproduces the analytic 
datasets and figures for the manuscript.

To run it, first update the path
above to correspond with the location
where the files are stored on 
your local machine.

It takes about 8-15 minutes to run,
depending on system performance.
*/

display "$S_TIME  $S_DATE"
timer on 1

//Install packages
ssc install gtools, replace
ssc install carryforward, replace
ssc install keeporder, replace
ssc install blindschemes, replace

//Set macros (paths)
global data "${PATH}/data"
global code "${PATH}/code"
global graphs "${PATH}/out"

// Construct ACS dataset from raw IPUMS USA data
do "${code}/01_usa_00015.do"

// Construct dataset with HCBS participants from KFF
do "${code}/02_build_kff_data.do"

// Construct analysis dataset from ACS and KFF data
do "${code}/03_build_analysis_data.do"

// Produce figures for manuscript
do "${code}/04_analysis.do"

timer off 1
timer list

clear

