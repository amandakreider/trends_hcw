clear
timer on 4

/* 
Author: Amanda Kreider
Updated: 2023-07-18

This file creates an analysis dataset using the ACS data with counts of 
home care workers in the United States, by year (with confidence intervals).

It takes about 5-6 minutes to run.
*/

// Open ACS data

use year cluster statefip strata perwt ///
	empstat classwkr occ2010 ind using ///
	"${data}/built/acs_data.dta", clear
compress

// Merge in FIPS crosswalk and drop AZ, DE, HI, RI, TX 

merge m:1 statefip using "${data}/ref/fips_xwalk.dta", ///
	keep(master match) nogen

drop if state == "AZ"
drop if state == "DE"
drop if state == "HI"
drop if state == "RI"
drop if state == "TX"

// Define direct care workers by type 

/*
8170: Home health care services
8370: Individual and family services
9290: Private households

8270: Nursing care facilities
8290: Residential care facilities, without nursing
8190: Hospitals
*/

gen direct_care = 0

// Direct care workers - home 

replace direct_care = 1 if (occ2010 == 3600 | occ2010 == 4610) & ///
	(ind == 8170 | ind == 8370 | ind == 9290)
	
// Direct care workers - nursing care + residential care 

replace direct_care = 2 if (occ2010 == 3600 | occ2010 == 4610) & ///
	(ind == 8270 | ind == 8290)

label define direct_care 0 "Not a direct care worker" ///
		1 "Home care workers" ///
		2 "Nursing and residential care workers", ///
		replace
label values direct_care direct_care

replace direct_care = 0 if empstat != 1

gen direct_care_flag = direct_care != 0
gen home_care = direct_care == 1 
gen nh_res = direct_care == 2 

foreach var of varlist direct_care_flag home_care nh_res {
		replace `var' = 0 if empstat != 1
	}

foreach var of varlist direct_care_flag home_care nh_res {	
	di "`var'"
	tab classwkr if `var' == 1, miss 
	}
	
compress

save "${data}/built/acs_analysis_data.dta", replace

// Community estimates

svyset cluster [pweight=perwt], strata(strata)

// Calculate totals 

svy: total home_care, over(year) cformat(%9.0fc)
estimates store all_est

foreach num of numlist 2008/2020 {
	estimates restore all_est
	
	foreach type in home_care {
		scalar b_`type'_`num' = _b[c.`type'@`num'.year]
		scalar se_`type'_`num' = _se[c.`type'@`num'.year]
		scalar ul_`type'_`num' = b_`type'_`num' + 1.96 * se_`type'_`num'
		scalar ll_`type'_`num' = b_`type'_`num' - 1.96 * se_`type'_`num'
	}		
}

foreach num of numlist 2008/2020 {
	foreach type in home_care {
		matrix `type'_`num' = b_`type'_`num', se_`type'_`num', ///
			ll_`type'_`num', ul_`type'_`num'
	}
}

foreach num of numlist 2008/2020 {
	foreach type in home_care {
		matrix `type' = nullmat(`type') \ `type'_`num'
	}
}

foreach occ in home_care {
	matrix A = nullmat(A), `occ'
}

matrix A = A

foreach num of numlist 2008/2020 {
	matrix B = nullmat(B) \ `num'
}

matrix C = B,A
	
matrix colnames C = year ///
	b_home_care se_home_care ll_home_care ul_home_care 

matrix list C

clear
svmat C, names(col) 

gsort year

compress

save "${data}/built/counts.dta", replace

timer off 4
timer list

clear

	
	
	
