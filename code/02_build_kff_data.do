/* 
Author: Amanda Kreider
Updated: 2023-07-18

This file creates datasets with the number of HCBS participants in each 
state and in the US in each year, by program authority.

It takes under 10 seconds to run.
*/

clear
timer on 3 

// Import raw data from KFF website and KFF reports

// Home health

* 1999-2006

local filename "home-health-participants-1999-2006"
	
import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A1:I51) firstrow case(lower) clear	

foreach v of varlist b-i { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year home_health
rename _j year
gen file = "`filename'"

order state year home_health file

gegen max_year = max(year)

compress

tostring year home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2000-2010

local filename "home-health-participants-2000-2010"

import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A1:L52) firstrow case(lower) clear	
	
foreach v of varlist b-l { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year home_health
rename _j year
gen file = "`filename'"

order state year home_health file

gegen max_year = max(year)

compress

tostring year home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2004-2014

local filename "home-health-participants-2004-2014"

import delimited "${data}/kff/`filename'.csv", varnames(1) ///
	rowrange(:52) clear

foreach v of varlist v2-v12 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename v1 state
replace state = "US" if state == "Total"

foreach var of varlist year* {
	tostring `var', replace
}

reshape long year, i(state)

rename year home_health
rename _j year
gen file = "`filename'"

order state year home_health file

gegen max_year = max(year)

compress

tostring year home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2014

local filename "home-health-participants-scrape-2014"
	
import delimited "${data}/kff/`filename'.csv", ///
	varnames(nonames) rowrange(4:55) colrange(2:4) clear	

rename v1 state

merge m:1 state using "${data}/ref/state_xwalk.dta", ///
	nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state

rename v2 home_health
rename v3 year

gen file = "`filename'"

order state year home_health file

gegen max_year = max(year)

compress

tostring year home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2017

local filename "home-health-participants-scrape-2017"
	
import delimited "${data}/kff/`filename'.csv", ///
	varnames(nonames) rowrange(4:55) colrange(2:4) clear	

rename v1 state

merge m:1 state using "${data}/ref/state_xwalk.dta", nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state

rename v2 home_health
rename v3 year

gen file = "`filename'"

order state year home_health file

gegen max_year = max(year)

compress

tostring year home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2018 

local filename "home-health-participants-scrape-2018"
	
import delimited "${data}/kff/`filename'.csv", ///
	varnames(nonames) rowrange(4:55) colrange(2:4) clear

rename v1 state

merge m:1 state using "${data}/ref/state_xwalk.dta", nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state

rename v2 home_health
rename v3 year

gen file = "`filename'"

order state year home_health file

gegen max_year = max(year)

compress

tostring year home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

// Personal care

* 1999-2009

local filename "personal-care-participants-scrape-1999-2009"

import delimited "${data}/kff/`filename'.csv", varnames(1) ///
	colrange(2:14) clear


foreach v of varlist v2-v12 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename location state

merge m:1 state using "${data}/ref/state_xwalk.dta", nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state

foreach var of varlist year* {
	tostring `var', replace
}

drop year
reshape long year, i(state)

rename year personal_care
rename _j year
gen file = "`filename'"

order state year personal_care file

gegen max_year = max(year)

compress

tostring year personal_care max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2000-2010

local filename "personal-care-participants-2000-2010"

import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A1:L53) firstrow case(lower) clear	
	
foreach v of varlist b-l { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year personal_care
rename _j year
gen file = "`filename'"

order state year personal_care file

gegen max_year = max(year)

compress

tostring year personal_care max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2004-2014

local filename "personal-care-participants-2004-2014"

import delimited "${data}/kff/`filename'.csv", varnames(1) ///
	rowrange(:53) clear

foreach v of varlist v2-v12 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename v1 state
replace state = "US" if state == "Total"

foreach var of varlist year* {
	tostring `var', replace
}

reshape long year, i(state)

rename year personal_care
rename _j year
gen file = "`filename'"

order state year personal_care file

gegen max_year = max(year)

compress

tostring year personal_care max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

// 1915(c) waivers

* 1999-2006

local filename "waivers-participants-1999-2006"

import excel "${data}/kff/`filename'.xlsx", ///
	cellrange(A1:I53) sheet("Table 1") firstrow case(lower) clear 

foreach v of varlist b-i { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year waivers1915c
rename _j year
gen file = "`filename'"

order state year waivers1915c file

gegen max_year = max(year)

compress

tostring year waivers1915c max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2000-2009

local filename "waivers-participants-2000-2009"

import delimited "${data}/kff/`filename'.csv", varnames(1) ///
	rowrange(:53) clear

foreach v of varlist v2-v11 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename v1 state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year waivers1915c
rename _j year
gen file = "`filename'"

order state year waivers1915c file

gegen max_year = max(year)

compress

tostring year waivers1915c max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2000-2010

local filename "waivers-participants-2000-2010"

import excel "${data}/kff/`filename'.xlsx", ///
	cellrange(A1:L53) sheet("Table 1") firstrow case(lower) clear 

foreach v of varlist b-l { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year waivers1915c
rename _j year
gen file = "`filename'"

order state year waivers1915c file

gegen max_year = max(year)

compress

tostring year waivers1915c max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2004-2014

local filename "waivers-participants-2004-2014"

import delimited "${data}/kff/`filename'.csv", varnames(1) ///
	rowrange(:53) clear

foreach v of varlist v2-v12 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename v1 state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year waivers1915c
rename _j year
gen file = "`filename'"

order state year waivers1915c file

gegen max_year = max(year)

compress

tostring year waivers1915c max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

// Total HCBS

* 1999-2006

local filename "total-hcbs-participants-1999-2006"
	
import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A1:I53)  firstrow case(lower) clear	
	
foreach v of varlist b-i { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year total_hcbs
rename _j year
gen file = "`filename'"

order state year total_hcbs file

gegen max_year = max(year)

compress

tostring year total_hcbs max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2000-2009

local filename "total-hcbs-participants-2000-2009"

import delimited "${data}/kff/`filename'.csv", ///
	varnames(2) rowrange(2:54) clear

foreach v of varlist v2-v11 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename v1 state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year total_hcbs
rename _j year
gen file = "`filename'"

order state year total_hcbs file

gegen max_year = max(year)

compress

tostring year total_hcbs max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2000-2010

local filename "total-hcbs-participants-2000-2010"
	
import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A1:L53) firstrow case(lower) clear	

foreach v of varlist b-l { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename a state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year total_hcbs
rename _j year
gen file = "`filename'"

order state year total_hcbs file

gegen max_year = max(year)

compress

tostring year total_hcbs max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2004-2014

local filename "total-hcbs-participants-2004-2014"

import delimited "${data}/kff/`filename'.csv", ///
	varnames(1) rowrange(:53) clear

foreach v of varlist v2-v12 { 
	local x : variable label `v' 
	ren `v' year`x'
}

rename v1 state
replace state = "US" if state == "Total"

reshape long year, i(state)

rename year total_hcbs
rename _j year
gen file = "`filename'"

order state year total_hcbs file

gegen max_year = max(year)

compress

tostring year total_hcbs max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2017

local filename "total-hcbs-participants-2017"

import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A3:H55) firstrow case(lower) clear

merge m:1 state using "${data}/ref/state_xwalk.dta", nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state
rename h total_hcbs

rename section1915c waivers1915c
rename homehealth home_health
rename personalcare personal_care

gen year = 2017
gen file = "`filename'"

order state year waivers1915c personal_care home_health total_hcbs file

gegen max_year = max(year)

compress

tostring year waivers1915c personal_care home_health total_hcbs max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2018

local filename "total-hcbs-participants-2018"

import excel "${data}/kff/`filename'.xlsx", ///
	sheet("Table 1") cellrange(A3:G55) firstrow case(lower) clear
	
rename a state

merge m:1 state using "${data}/ref/state_xwalk.dta", nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state

rename section1915c waivers1915c
rename homehealth home_health
rename personalcare personal_care

gen year = 2018
gen file = "`filename'"

order state year waivers1915c personal_care home_health file

gegen max_year = max(year)

compress

tostring year waivers1915c personal_care home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

* 2020

local filename "total-hcbs-participants-scrape-2020"

import delimited "${data}/kff/`filename'.csv", ///
	varnames(3) rowrange(3:56) colrange(2:) clear

rename v1 state
tab state, miss
drop if state == ""
rename v8 year

merge m:1 state using "${data}/ref/state_xwalk.dta", nogen keep(master match)

drop state
order state_abbrev
rename state_abbrev state

rename section1915c waivers1915c
rename homehealth home_health
rename personalcare personal_care

gen file = "`filename'"

order state year waivers1915c personal_care home_health file

gegen max_year = max(year)

compress

tostring year waivers1915c personal_care home_health max_year, replace

save "${data}/temp/kff/`filename'.dta", replace

// Append all datasets

clear
append using "${data}/temp/kff/home-health-participants-1999-2006.dta"
append using "${data}/temp/kff/home-health-participants-2000-2010.dta"
append using "${data}/temp/kff/home-health-participants-2004-2014.dta"
append using "${data}/temp/kff/home-health-participants-scrape-2014.dta"
append using "${data}/temp/kff/home-health-participants-scrape-2017.dta"
append using "${data}/temp/kff/home-health-participants-scrape-2018.dta"
append using "${data}/temp/kff/personal-care-participants-scrape-1999-2009.dta"
append using "${data}/temp/kff/personal-care-participants-2000-2010.dta"
append using "${data}/temp/kff/personal-care-participants-2004-2014.dta"
append using "${data}/temp/kff/waivers-participants-1999-2006.dta"
append using "${data}/temp/kff/waivers-participants-2000-2009.dta"
append using "${data}/temp/kff/waivers-participants-2000-2010.dta"
append using "${data}/temp/kff/waivers-participants-2004-2014.dta"
append using "${data}/temp/kff/total-hcbs-participants-1999-2006.dta"
append using "${data}/temp/kff/total-hcbs-participants-2000-2009.dta"
append using "${data}/temp/kff/total-hcbs-participants-2000-2010.dta"
append using "${data}/temp/kff/total-hcbs-participants-2004-2014.dta"
append using "${data}/temp/kff/total-hcbs-participants-2017.dta"
append using "${data}/temp/kff/total-hcbs-participants-2018.dta"
append using "${data}/temp/kff/total-hcbs-participants-scrape-2020.dta"

gsort state year max_year
destring max_year, replace
order state year max_year waivers1915c personal_care home_health total_hcbs

// Clean up variables and create a notes field (for checking work)

gen notes = ""

local vars "waivers1915c personal_care home_health total_hcbs communityfirstchoice section1915i section1115"

foreach var of local vars  {
	
	replace `var' = subinstr(`var', char(9), " ", .) 	
	replace `var' = subinstr(`var', char(10), " ", .) 	
	replace `var' = subinstr(`var',",","",.)
	
	replace notes = notes+"; `var' included in 1115" if ///
		`var' == "included in 1115" & notes != ""	
	replace notes = "`var' included in 1115" if ///
		`var' == "included in 1115" & notes == ""
	replace `var' = "" if `var' == "included in 1115"
	
	replace notes = notes+"; `var' included in 1115" if ///
		`var' == "Included in 1115" & notes != ""	
	replace notes = "`var' included in 1115" if ///
		`var' == "Included in 1115" & notes == ""
	replace `var' = "" if `var' == "Included in 1115"	
	
	replace notes = notes+"; `var' listed as DNR" if ///
		`var' == "DNR" & notes != ""	
	replace notes = "`var' listed as DNR" if ///
		`var' == "DNR" & notes == ""
	replace `var' = "" if `var' == "DNR"		
	
	replace notes = notes+"; `var' data other than FY2017" if ///
		strpos(`var',"*") != 0 & year == "2017" & notes != ""	
	replace notes = "`var' data other than FY2017" if ///
		strpos(`var',"*") != 0 & year == "2017" & notes == ""
	replace `var' = subinstr(`var',"*","",.) if year == "2017"	
	/* data from year other than FY2017 as noted in endnotes */	

	replace notes = notes+"; `var' data other than FY2018" if ///
		strpos(`var',"*") != 0 & year == "2018" & notes != ""	
	replace notes = "`var' data other than FY2018" if ///
		strpos(`var',"*") != 0 & year == "2018" & notes == ""
	replace `var' = subinstr(`var',"*","",.) if year == "2018"	
	/* data from year other than FY2018 as noted in endnotes */
	
	replace notes = notes+"; `var' data other than FY2020" if ///
		strpos(`var',"*") != 0 & year == "2020" & notes != ""	
	replace notes = "`var' data other than FY2020" if ///
		strpos(`var',"*") != 0 & year == "2020" & notes == ""
	replace `var' = subinstr(`var',"*","",.) if year == "2020"	
	/* data from year other than FY2020 as noted in endnotes */	
	
	replace notes = notes+"; NE and TX `var' excludes MMC data" if ///
		strpos(`var',"^") != 0 & notes != ""	
	replace notes = "NE and TX `var' excludes MMC data" if ///
		strpos(`var',"^") != 0 & notes == ""	
	replace `var' = subinstr(`var',"^","",.)	 
	/* NE and TX home health data are FFS only and exclude MMC */
	
	replace notes = notes+"; `var' data not reported" if ///
		`var' == "NR" & notes != ""		
	replace notes = "`var' data not reported" if ///
		`var' == "NR" & notes == ""	
	replace `var' = "" if `var' == "NR"
	
	replace notes = notes+"; `var' less than 50, assumed 0" if ///
		`var' == "&lt;50" & notes != ""		
	replace notes = "`var' less than 50, assumed 0" if ///
		`var' == "&lt;50" & notes == ""		
	replace `var' = "0" if `var' == "&lt;50" /* less than 50 */	
	
	replace notes = notes+"; `var' listed as NA" if ///
		`var' == "NA" & notes != ""		
	replace notes = "`var' listed as NA" if ///
		`var' == "NA" & notes == ""		
	replace `var' = "0" if `var' == "NA" /* NA */		
	
	di "replace `var' = 0 if `var' == -"
	replace `var' = "0" if `var' == "-"
	
	di "replace `var' = 0 if `var' == ."
	replace `var' = "0" if `var' == "."
	
	di "replace missings"
	replace `var' = "" if `var' == " "
	
	split `var', parse("(")	
	
	di "replace `var' = itrim(`var')"
	replace `var' = itrim(`var')
	
	di "list `var' `var'1 if real(`var')==. & `var'!="""
	
	replace `var' = subinstr(`var', " ", "", .)
	replace `var' = subinstr(`var', "⠀", "", .)
	replace `var' = trim(`var')
	replace `var' = itrim(`var')
	
	list `var' `var'1 if real(`var')==. & `var'!=""
	replace `var' = `var'1 if real(`var') == . & `var' != ""
	
	cap drop `var'1
	cap drop `var'2
	
	destring `var', replace
}

// Keep the latest available data for each variable

destring year, replace
gsort state year max_year
by state year max_year: gen n = _n

foreach var of varlist waivers1915c personal_care home_health total_hcbs ///
	communityfirstchoice section1915i section1115 {
		
		gsort state year -max_year -n
		by state year: carryforward `var', replace

		gsort state year max_year n
		by state year: carryforward `var', replace
		
	}
	
drop n

collapse (last) waivers1915c personal_care home_health ///
	communityfirstchoice section1915i section1115 file, ///
	by(state year)
	
// Create a variable for total HCBS users (summing across all programs)
	
egen total = ///
	rowtotal(waivers1915c personal_care home_health ///
	communityfirstchoice section1915i section1115)	

keeporder state year waivers1915c personal_care home_health ///
	communityfirstchoice section1915i section1115 total file
	
// Set dataset to go back to 1975
	
encode state, gen(staten)

local next = _N+1
set obs `next'
replace year = 1975 in `next' if year == .
replace staten = 45 in `next' if state == ""

gsort staten year
tsset staten year
tsfill, full

decode staten, gen(state_str)
drop staten state
rename state_str state
order state

gsort state year

foreach var of varlist waivers1915c personal_care home_health {
	replace `var' = 0 if `var' == . & file != "" & year > 2016
}
drop file

// Add missing Washington data for 2015 (transitioned to Community First Choice in 2015)
replace personal_care = personal_care[_n+2] if ///
	state == "WA" & year == 2015
	
// Interpolate missing waiver, personal care, and home health data
foreach var of varlist waivers1915c personal_care home_health {
	by state: ipolate `var' year, gen(i`var')
	replace i`var' = round(i`var',1.0)
	replace i`var' = 0 if i`var' == .
}

// Set start date for each state's Section 1115 program and account for transitions from waivers
replace section1115 = 0 if state == "AZ" & year <= 1988
replace section1115 = 0 if state == "CA" & year <= 2013

replace section1115 = 0 if state == "DE" & year <= 2012
replace section1115 = ///
	waivers1915c[_n-1] - waivers1915c[_n] if ///
	state == "DE" & year == 2013

replace section1115 = 0 if state == "HI" & year <= 2008
replace section1115 = ///
	waivers1915c[_n-1] - waivers1915c[_n] if ///
	state == "HI" & year == 2009

replace section1115 = 0 if state == "NJ" & year <= 2013
replace section1115 = ///
	waivers1915c[_n-1] - waivers1915c[_n] if ///
	state == "NJ" & year == 2014

replace section1115 = 0 if state == "NM" & year <= 2013
replace section1115 = ///
	(waivers1915c[_n-1] - waivers1915c[_n]) + ///
	(personal_care[_n-1] - personal_care[_n]) if ///
	state == "NM" & year == 2014

replace section1115 = 0 if state == "NY" & year <= 2011

replace section1115 = 0 if state == "RI" & year <= 2008
replace section1115 = ///
	waivers1915c[_n-1] - waivers1915c[_n] if ///
	state == "RI" & year == 2009
replace section1115 = ///
	waivers1915c[_n-2] - waivers1915c[_n] if ///
	state == "RI" & year == 2010	

replace section1115 = 0 if state == "TN" & year <= 2009
replace section1115 = ///
	waivers1915c[_n-1] - waivers1915c[_n] if ///
	state == "TN" & year == 2010
replace section1115 = ///
	waivers1915c[_n-2] - waivers1915c[_n] if ///
	state == "TN" & year == 2011

replace section1115 = 0 if state == "TX" & year <= 2010
// TX Section 1115 had 71239 users as of 2012
// Source: http://www.advancingstates.org/sites/nasuad/files/MLTSSP_White_paper_combined.pdf
replace section1115 = 71239 if state == "TX" & year == 2012 

replace section1115 = 0 if state == "VT" & year <= 2004
replace section1115 = ///
	waivers1915c[_n-1] - waivers1915c[_n] if ///
	state == "VT" & year == 2005
replace section1115 = ///
	waivers1915c[_n-2] - waivers1915c[_n] if ///
	state == "VT" & year == 2006
replace section1115 = ///
	personal_care[_n-1] - waivers1915c[_n] + ///
	section1115[_n-1] if ///
	state == "VT" & year == 2007

replace section1115 = 0 if state == "WA" & year <= 2017 

// Set start date for each state's Community First Choice program and account for transitions from state plan personal care
replace communityfirstchoice = 0 if state == "AK" & year <= 2017
replace communityfirstchoice = ///
	ipersonal_care[_n-1] - ipersonal_care[_n] if ///
	state == "AK" & year == 2018
replace communityfirstchoice = ///
	ipersonal_care[_n-2] - ipersonal_care[_n] if ///
	state == "AK" & year == 2019
	
replace communityfirstchoice = 0 if state == "CA" & year <= 2011
replace communityfirstchoice = ///
	ipersonal_care[_n-1] - ipersonal_care[_n] if ///
	state == "CA" & year == 2012
replace communityfirstchoice = ///
	ipersonal_care[_n-2] - ipersonal_care[_n] if ///
	state == "CA" & year == 2013
replace communityfirstchoice = ///
	ipersonal_care[_n-3] - ipersonal_care[_n] if ///
	state == "CA" & year == 2014
	
replace communityfirstchoice = 0 if state == "CT" & year <= 2014	
	
replace communityfirstchoice = 0 if state == "MD" & year <= 2013	
	
replace communityfirstchoice = 0 if state == "MT" & year <= 2012
replace communityfirstchoice = ///
	ipersonal_care[_n-1] - ipersonal_care[_n] if ///
	state == "MT" & year == 2013
replace communityfirstchoice = ///
	ipersonal_care[_n-2] - ipersonal_care[_n] if ///
	state == "MT" & year == 2014
	
replace communityfirstchoice = 0 if state == "OR" & year <= 2012
replace communityfirstchoice = ///
	ipersonal_care[_n-1] - ipersonal_care[_n] if ///
	state == "OR" & year == 2013	

replace communityfirstchoice = 0 if state == "TX" & year <= 2014

replace communityfirstchoice = 0 if state == "WA" & year <= 2014

// Set start dates for Section 1915(i) programs
replace section1915i = 0 if state == "CA" & year <= 2009
replace section1915i = 0 if state == "CT" & year <= 2011
replace section1915i = 0 if state == "DC" & year <= 2014
*Fix missing DC data for 2015 (new program as of 2015)
replace section1915i = section1915i[_n+2] if state == "DC" & year == 2015
replace section1915i = 0 if state == "DE" & year <= 2014
replace section1915i = 0 if state == "ID" & year <= 2010
replace section1915i = 0 if state == "IN" & year <= 2013 
replace section1915i = 0 if state == "IA" & year <= 2006
replace section1915i = 0 if state == "MI" & year <= 2018
replace section1915i = 0 if state == "MS" & year <= 2012
replace section1915i = 0 if state == "NV" & year <= 2007
replace section1915i = 0 if state == "OH" & year <= 2017

// Interpolate missing CFC, 1915(i), and Section 1115 data
foreach var of varlist communityfirstchoice section1915i ///
	section1115 {
		by state: ipolate `var' year, gen(i`var')
		replace i`var' = round(i`var',1.0)
		replace i`var' = 0 if i`var' == .
}
compress

label var state "State"
label var year "Year"
label var iwaivers1915c "1915(c) waiver participants (interpolated)"
label var ipersonal_care "State plan personal care participants (interpolated)"
label var ihome_health "State plan home health participants (interpolated)"
label var icommunityfirstchoice "Community First Choice participants (interpolated)"
label var isection1915i "1915(i) participants (interpolated)"
label var isection1115 "Section 1115 participants (interpolated)"

// Create a section 1115 variable that excludes NY, CA
gen isection1115_alt = isection1115
replace isection1115_alt = 0 if state == "NY" | state == "CA"
label var isection1115_alt "Section 1115 participants (no CA, NY)"

egen itotal_no_hh = ///
	rowtotal(iwaivers1915c ipersonal_care icommunityfirstchoice ///
	isection1915i isection1115)
label var itotal_no_hh "Total HCBS participants (excluding home health)"
	
egen itotal_no_hh_alt = ///
	rowtotal(iwaivers1915c ipersonal_care icommunityfirstchoice ///
	isection1915i isection1115_alt)	
label var itotal_no_hh "Total HCBS participants (excl. Section 1115 for CA, NY and home health)"	
	
egen itotal_pc = rowtotal(ipersonal_care icommunityfirstchoice)
label var itotal_pc
label var itotal_pc "Total state plan personal care and CFC participants"

drop if year < 1999

gsort state year

compress

keeporder state year iwaivers1915c ipersonal_care ihome_health ///
	icommunityfirstchoice isection1915i isection1115 isection1115_alt ///
	itotal_no_hh itotal_pc ///
	itotal_no_hh_alt

// Drop all data for AZ, DE, HI, RI, TX (for main analysis)

foreach st in AZ DE HI RI TX {
di "State: `st'"
foreach var of varlist iwaivers1915c ipersonal_care ihome_health ///
	icommunityfirstchoice isection1915i isection1115 isection1115_alt ///
	itotal_no_hh itotal_pc ///
	itotal_no_hh_alt {
		replace `var' = 0 if state == "`st'"
	}
}

// Create US counts by summing across all states

drop if state == "US"

gcollapse (sum) iwaivers1915c ipersonal_care ihome_health ///
	icommunityfirstchoice isection1915i isection1115 isection1115_alt ///
	itotal_no_hh itotal_no_hh_alt ///
	itotal_pc, by(year)
	
gen state = "US"
order state year
compress
	
save "${data}/built/hcbs_participants.dta", replace

clear

timer off 3
timer list





