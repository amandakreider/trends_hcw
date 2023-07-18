clear
timer on 5

/* 
Author: Amanda Kreider
Updated: 2023-07-18

This file creates the figures for the manuscript.

It takes about 10 seconds to run.
*/

// Open ACS counts of home care workers (excluding AZ, DE, HI, RI, TX) 

use year b_home_care se_home_care ll_home_care ul_home_care using ///
	"${data}/built/counts.dta", clear 
	
// Merge in # of people receiving Medicaid HCBS 

describe using "${data}/built/hcbs_participants.dta"

merge 1:1 year using "${data}/built/hcbs_participants.dta", nogen 

gsort year

// Divide HCW and HCBS participants by 1 million

foreach var of varlist b_home_care se_home_care ll_home_care ul_home_care ///
	iwaivers1915c ipersonal_care ihome_health ///
	icommunityfirstchoice isection1915i isection1115 isection1115_alt ///
	itotal_no_hh itotal_no_hh_alt itotal_pc {
		replace `var' = `var'/1000000
}	

gen home_care_per_waivers = (b_home_care/iwaivers1915c)*100
gen home_care_per_hcbs = (b_home_care/itotal_no_hh)*100
gen home_care_per_pc = (b_home_care/itotal_pc)*100
// main version - excludes 1115 in NY/CA 
gen home_care_per_hcbs_alt = (b_home_care/itotal_no_hh_alt)*100 
compress

save "${data}/built/analysis_data.dta", replace

// Plots 

set scheme plotplainblind

// Exhibit 1

preserve

tab state, mi

keep if state == "US"

keep state year iwaivers1915c ipersonal_care isection1115_alt ///
	isection1915i icommunityfirstchoice

export excel using ///
	"${graphs}/hcbs_participation.xlsx", ///
	firstrow(variables) replace

replace ipersonal_care = iwaivers1915c + ipersonal_care
replace isection1115_alt = ipersonal_care + isection1115_alt
replace isection1915i = isection1115_alt + isection1915i
replace icommunityfirstchoice = isection1915i + icommunityfirstchoice

graph twoway area icommunityfirstchoice isection1915i isection1115_alt ///
	ipersonal_care iwaivers1915c year, ///
	yscale(r(0)) ylabel(#6, labsize(medsmall)) ///
	legend(order(5 "1915(c) Waiver Programs" ///
	4 "State Plan Personal Care" 3 "Section 1115 (Excluding CA/NY)" ///
	2 "Section 1915(i)" ///
	1 "Community First Choice")) ///
	ytitle("Participants (Millions)", size(medsmall)) ///
	xtitle("", size(medsmall)) ///
	xlab(, nogrid labsize(medsmall) angle(45)) ysize(6) xsize(11)
graph export "${graphs}/exhibit1.pdf", as(pdf) name("Graph") replace
graph export "${graphs}/exhibit1.png", replace	

restore

// Exhibit 2 and Appendix Exhibits

// Drop years before 2008 for analyses relying on ACS

keep if year >= 2008

// Exhibit 2: HCBS participants, # of HCW, workers per HCBS - exclude 1115 in CA/NY 

list year b_home_care itotal_no_hh_alt home_care_per_hcbs_alt

twoway (connected b_home_care year if year < 2020, yaxis(1) ///
	lc(sky) mc(sky) lpattern(solid) msymbol(circle_hollow)) ///
	(connected b_home_care year if year == 2020, yaxis(1) ///
	lc(sky%70) mc(sky%70) msymbol(circle_hollow)) ///
	(connected b_home_care year if year == 2021, yaxis(1) ///
	lc(sky) mc(sky) msymbol(circle_hollow)) ///
	(connected b_home_care year if year >= 2019 & year <= 2021, ///
	lc(sky%70) lpattern(dot) msymbol(none)) ///
	(rcap ul_home_care ll_home_care year if ///
	year < 2020 | year == 2021, yaxis(1) lc(sky)) ///
	(rcap ul_home_care ll_home_care year if year == 2020, yaxis(1) ///
	lc(sky%70)) ///
	(connected itotal_no_hh_alt year, yaxis(1) ///
	lc(gs10) mc(gs10) lpattern(solid) msymbol(diamond_hollow)) ///	
	(connected home_care_per_hcbs_alt year if year < 2020, yaxis(2) ///
	lc(vermillion) mc(vermillion) lpattern(solid) msymbol(triangle_hollow)) ///
	(connected home_care_per_hcbs_alt year if year >= 2019, yaxis(2) ///
	lc(vermillion%70) mc(vermillion%70) lpattern(dot) msymbol(triangle_hollow)), ///
	ytitle("Total Number of Home Care Workers and" ///
	"Medicaid HCBS Participants (Millions)", axis(1) size(medsmall)) ///
	ytitle("Total Number of Home Care Workers" ///
	"per 100 Medicaid HCBS Participants", axis(2) size(medsmall)) ///
	ylabel(0(1)4, ang(h) axis(1) labsize(medsmall)) yscale(ra(0) axis(1)) ///
	ylabel(#6, ang(h) axis(2) labsize(medsmall)) yscale(ra(0) axis(2)) ///
	xla(#8, angle(45) nogrid labsize(medsmall)) ///
	legend(order(1 "Home Care Workers" 7 "Medicaid HCBS Participants" ///
	8 "Home Care Workers per" "100 Medicaid HCBS Participants")) ///
	xtitle("") ysize(6) xsize(11)
graph export "${graphs}/exhibit2.pdf", as(pdf) name("Graph") replace
graph export "${graphs}/exhibit2.png", replace		

// Appendix Figure: Restrict to Waivers 

list year b_home_care iwaivers1915c home_care_per_waivers

twoway (connected b_home_care year if year < 2020, yaxis(1) ///
	lc(sky) mc(sky) lpattern(solid) msymbol(circle_hollow)) ///
	(connected b_home_care year if year == 2020, yaxis(1) ///
	lc(sky%70) mc(sky%70) msymbol(circle_hollow)) ///
	(connected b_home_care year if year == 2021, yaxis(1) ///
	lc(sky) mc(sky) msymbol(circle_hollow)) ///
	(connected b_home_care year if year >= 2019 & year <= 2021, ///
	lc(sky%70) lpattern(dot) msymbol(none)) ///
	(rcap ul_home_care ll_home_care year if ///
	year < 2020 | year == 2021, yaxis(1) lc(sky)) ///
	(rcap ul_home_care ll_home_care year if year == 2020, yaxis(1) ///
	lc(sky%70)) ///
	(connected iwaivers1915c year, yaxis(1) ///
	lc(gs10) mc(gs10) lpattern(solid) msymbol(diamond_hollow)) ///	
	(connected home_care_per_waivers year if year < 2020, yaxis(2) ///
	lc(vermillion) mc(vermillion) lpattern(solid) msymbol(triangle_hollow)) ///
	(connected home_care_per_waivers year if year >= 2019, yaxis(2) ///
	lc(vermillion%70) mc(vermillion%70) lpattern(dot) msymbol(triangle_hollow)), ///
	ytitle("Total Number of Home Care Workers and" ///
	"1915(c) Waiver Participants (Millions)", axis(1) size(medsmall)) ///
	ytitle("Total Number of Home Care Workers" ///
	"per 100 1915(c) Waiver Participants", axis(2) size(medsmall)) ///
	ylabel(0(0.5)2, ang(h) axis(1) labsize(medsmall)) yscale(ra(0) axis(1)) ///
	ylabel(#6, ang(h) axis(2) labsize(medsmall)) yscale(ra(0) axis(2)) ///
	xla(#8, angle(45) nogrid labsize(medsmall)) ///
	legend(order(1 "Home Care Workers" 7 "1915(c) Waiver Participants" ///
	8 "Home Care Workers per" "100 1915(c) Waiver Participants")) ///
	xtitle("") ysize(6) xsize(11)
graph export "${graphs}/exhibit_b1.pdf", as(pdf) name("Graph") replace
graph export "${graphs}/exhibit_b1.png", replace	

// Appendix Figure: Restrict to Personal Care 

list year b_home_care itotal_pc home_care_per_pc

twoway (connected b_home_care year if year < 2020, yaxis(1) ///
	lc(sky) mc(sky) lpattern(solid) msymbol(circle_hollow)) ///
	(connected b_home_care year if year == 2020, yaxis(1) ///
	lc(sky%70) mc(sky%70) msymbol(circle_hollow)) ///
	(connected b_home_care year if year == 2021, yaxis(1) ///
	lc(sky) mc(sky) msymbol(circle_hollow)) ///
	(connected b_home_care year if year >= 2019 & year <= 2021, ///
	lc(sky%70) lpattern(dot) msymbol(none)) ///
	(rcap ul_home_care ll_home_care year if ///
	year < 2020 | year == 2021, yaxis(1) lc(sky)) ///
	(rcap ul_home_care ll_home_care year if year == 2020, yaxis(1) ///
	lc(sky%70)) ///
	(connected itotal_pc year, yaxis(1) ///
	lc(gs10) mc(gs10) lpattern(solid) msymbol(diamond_hollow)) ///	
	(connected home_care_per_pc year if year < 2020, yaxis(2) ///
	lc(vermillion) mc(vermillion) lpattern(solid) msymbol(triangle_hollow)) ///
	(connected home_care_per_pc year if year >= 2019, yaxis(2) ///
	lc(vermillion%70) mc(vermillion%70) lpattern(dot) msymbol(triangle_hollow)), ///
	ytitle("Total Number of Home Care Workers and" ///
	"Personal Care Participants (Millions)", axis(1) size(medsmall)) ///
	ytitle("Total Number of Home Care Workers" ///
	"per 100 Personal Care Participants", axis(2) size(medsmall)) ///
	ylabel(0(0.5)1.5, ang(h) axis(1) labsize(medsmall)) yscale(ra(0) axis(1)) ///
	ylabel(#6, ang(h) axis(2) labsize(medsmall)) yscale(ra(0) axis(2)) ///
	xla(#8, angle(45) nogrid labsize(medsmall)) ///
	legend(order(1 "Home Care Workers" 7 "Personal Care Participants" ///
	8 "Home Care Workers per" "100 Personal Care Participants")) ///
	xtitle("") ysize(6) xsize(11)
graph export "${graphs}/exhibit_b2.pdf", as(pdf) name("Graph") replace
graph export "${graphs}/exhibit_b2.png", replace	

clear

timer off 5
timer list



	
	
	
	
	
	
	
	
	
	
	
	
