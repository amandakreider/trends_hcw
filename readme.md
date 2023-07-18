# Trends in the Home Care Workforce

The code in this repository reproduces the analytic datasets and figures for the following manuscript: 

Kreider, Amanda R., and Rachel M. Werner. 2023. 
  “The Home Care Workforce Has Not Kept Pace With 
  Growth In Home And Community-Based Services.” 
  *Health Affairs (Project Hope)* 42 (5): 650–57. 
  https://doi.org/10.1377/hlthaff.2022.01351.

## Steps to replicate the analysis:

1. Download project files to your local machine (make note of path).

2. Unzip the file ~/data/acs/usa_00015.dat.gz **Note: this file is currently unavailable.**

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

## Sources for Medicaid HCBS programs' start and end dates:

- Alaska Department of Health, Division of Senior and Disabilities Services. 2022. “Community First Choice (CFC).” State of Alaska. 2022. https://dhss.alaska.gov/health/dsds/Pages/cfc/default.aspx.
- California Department of Health Care Services. 2013. “California 1915(i) HCBS State Plan Services: Administration and Operation.” https://www.dhcs.ca.gov/formsandpubs/laws/Documents/11-041_Attach3.1i_1915i.pdf.
- Centers for Medicare & Medicaid Services. 2010. “Wisconsin State Plan Amendment (SPA) No. 09-017.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/WI/WI-09-017.pdf.
- ———. 2011a. “Washington State Plan Amendment (SPA) No. 11-024.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/WA/WA-11-024.pdf.
- ———. 2011b. “Louisiana State Plan Amendment (SPA) No. 11-13.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/LA/LA-11-13.pdf.
- ———. 2012a. “Oregon State Plan Amendment (SPA) No. 10-012.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/OR/OR-10-012.pdf.
- ———. 2012b. “Idaho State Plan Amendment (SPA) No. 12-007.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/ID/ID-12-007.pdf.
- ———. 2012c. “Approval Letter: California State Plan Amendment (SPA) No. 11-034,” August 31, 2012. https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/CA/CA-11-034-Ltr.pdf.
- ———. 2012d. “Montana 1915(i) State Plan Home and Community-Based Services: Administration and Operation.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/MT/MT-12-026-Att.pdf.
- ———. 2012e. “Kansas Section 1115 Demonstration Fact Sheet.” https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Waivers/1115/downloads/ks/ks-kancare-fs.pdf.
- ———. 2013a. “Florida State Plan Amendment (SPA) No. 11-019.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/FL/FL-11-019-Ltr.pdf.
- ———. 2013b. “Approval Letter: California State Plan Amendment (SPA) No. 09-023A,” April 25, 2013. https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/CA/CA-09-023A-Ltr.pdf.
- ———. 2013c. “Mississippi State Plan Amendment (SPA) No. 13-001.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/MS/MS-13-001-MSPA.pdf.
- ———. 2014a. “Indiana State Plan Amendment (SPA) No. 13-013.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/IN/IN-13-013.pdf.
- ———. 2014b. “Maryland State Plan Amendment (SPA) No. 14-05.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/MD/MD-14-05.pdf.
- ———. 2014c. “Delaware State Plan Amendment (SPA) No. 14-0002.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/DE/DE-14-002.pdf.
- ———. 2015a. “District of Columbia State Plan Amendment (SPA) No. 14-004.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/DC/DC-14-004.pdf.
- ———. 2015b. “Washington State Plan Amendment (SPA) No. 15-0002.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/WA/WA-15-0002.pdf.
- ———. 2015c. “Connecticut State Plan Amendment (SPA) No. 15-012.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/CT/CT-15-0012.pdf.
- ———. 2015d. “Texas State Plan Amendment (SPA) No. 14-0014.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/TX/TX-14-014.pdf.
- ———. 2015e. “Florida State Plan Amendment (SPA) No. 15-0012.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/FL/FL-15-012.pdf.
- ———. 2016. “Louisiana State Plan Amendment (SPA) No. 15-0017.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/LA/LA-15-0017.pdf.
- ———. 2017a. “Connecticut State Plan Amendment (SPA) No. 17-0001.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/CT/CT-17-0001.pdf.
- ———. 2017b. “Montana State Plan Amendment (SPA) No. 17-0019.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/MT/MT-17-0019.pdf.
- ———. 2017c. “Washington CMS Approved Evaluation Design.” https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Waivers/1115/downloads/wa/medicaid-transformation/wa-medicaid-transformation-appvd-eval-dsgn-10262017.pdf.
- ———. 2018a. “Arizona Demonstration Fact Sheet.” https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Waivers/1115/downloads/az/az-hccc-fs.pdf.
- ———. 2018b. “Florida Medicaid 1915(b) Managed Care Waiver Long-Term Care Program (Waiver #FL-17).” https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Waivers/Downloads/FL_Long-Term-Managed-Care_FL-17.pdf.
- ———. 2018c. “Alaska State Plan Amendment (SPA) No. 17-0011.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/AK/AK-17-0011.pdf.
- ———. 2018d. “Michigan State Plan Amendment (SPA) No. 18-0008.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/MI/MI-18-0008.pdf.
- ———. 2019. “Michigan State Plan Amendment (SPA) No. 19-0006.” https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/MI/MI-19-0006.pdf.
- ———. 2020a. “Nevada State Plan Amendment (SPA) No. 20-0004.” https://www.medicaid.gov/medicaid/spa/downloads/NV-20-0004_1.pdf.
- ———. 2020b. “Nevada State Plan Amendment (SPA) No. 20-0003.” https://www.medicaid.gov/medicaid/spa/downloads/NV-20-0003.pdf.
- ———. 2021a. “Idaho State Plan Amendment (SPA) No. 20-0014.” https://www.medicaid.gov/medicaid/spa/downloads/ID-20-0014.pdf.
- ———. 2021b. “Minnesota Section 1915(b) Waiver Proposal for MCO, PIHP, PAHP, PCCM Programs and FFS Selective Contracting Programs.” https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Waivers/Downloads/MN_SeniorCare_MN-02.pdf.
- ———. 2022. “Home & Community Based Services 1915(i).” Medicaid.Gov. 2022. https://www.medicaid.gov/medicaid/home-community-based-services/home-community-based-services-authorities/home-community-based-services-1915i/index.html.
- Coffey, Gene. 2007. “Narrowing Medicaid’s LTC Coverage-The Implications of the DRA’s Home and Community-Based Care Benefit.” Marquette Elder’s Advisor 9 (1): 131–54.
- Colorado Department of Health Care Policy and Financing. 2009. “Colorado 1915(i) HCBS State Plan Services: Administration and Operation.” https://www.colorado.gov/cs/Satellite?blobcol=urldata&blobheader=application%2Fpdf&blobkey=id&blobtable=MungoBlobs&blobwhere=1239162928909&ssbinary=true. Archived at: https://web.archive.org/web/20091104013101/http://www.colorado.gov/cs/Satellite?blobcol=urldata&blobheader=application%2Fpdf&blobkey=id&blobtable=MungoBlobs&blobwhere=1239162928909&ssbinary=true.
- District of Columbia, Department of Health Care Finance. 2015. “District of Columbia 1915(i) State Plan Home and Community-Based Services: Administration and Operation.” https://dhcf.dc.gov/sites/default/files/dc/sites/dhcf/publication/attachments/Attachment%203.1i_0.pdf.
- Harrington, Charlene, Terence Ng, Mitchell LaPlante, and H. Stephen Kaye. 2012. “Medicaid Home- and Community-Based Services: Impact of the Affordable Care Act.” Journal of Aging & Social Policy 24 (2): 169–87. https://doi.org/10.1080/08959420.2012.659118.
- Judge David L. Bazelon Center for Mental Health Law. 2014. “When Opportunity Knocks: How the Affordable Care Act Can Help States Develop Supported Housing for People With Mental Illnesses.” Washington, D.C. http://www.bazelon.org/wp-content/uploads/2017/01/When-Opportunity-Knocks.pdf.
- Koyanagi, Chris, and Laurel Stine. 2009. “Shifting Focus: The Impact of the Deficit Reduction Act and Medicaid Regulations on National Mental Health Policy.” Home Health Care Management & Practice 21 (4): 271–80. https://doi.org/10.1177/1084822308329253.
- MACPAC. 2022. “Behavioral Health Services Covered under HCBS Waivers and 1915(i) SPAs.” 2022. https://www.macpac.gov/subtopic/behavioral-health-services-covered-under-hcbs-waivers-and-spas/.
- Murray, Caitlin, Alena Tourtellotte, Debra Lipson, and Andrea Wysocki. 2021. “Medicaid Long Term Services and Supports Annual Expenditures Report: Federal Fiscal Years 2017 and 2018.” Chicago, IL: Mathematica. https://www.medicaid.gov/medicaid/long-term-services-supports/downloads/ltssexpenditures-2017-2018.pdf.
- Musumeci, MaryBeth, Molly O’Malley Watts, and Priya Chidambaram. 2020. “Key State Policy Choices About Medicaid Home and Community-Based Services.” Issue Brief. Kaiser Family Foundation. https://www.kff.org/medicaid/issue-brief/key-state-policy-choices-about-medicaid-home-and-community-based-services/.
- NASUAD. 2013. “State Medicaid Integration Tracker: October-November 2013 Edition.” http://www.advancingstates.org/sites/nasuad/files/2013.11.pdf.
- Nevada Department of Health and Human Services Division of Health Care Financing and Policy. 2008. “Nevada 1915(i) Home and Community Based Services (HCBS) State Plan Services: Administration and Operation.” https://dhcfp.nv.gov/uploadedFiles/dhcfpnvgov/content/Pgms/LTC/Section3-1AttachmentG.pdf.
- New York State Department of Health. 2015. “New York State Plan Amendment (SPA) No. 13-0035.” https://www.health.ny.gov/regulations/state_plans/status/non-inst/approved/docs/app_2015-10-23_spa_13-35.pdf.
- Ng, Terence, Julie Stone, and Charlene Harrington. 2015. “Medicaid Home and Community-Based Services: How Consumer Access Is Restricted by State Policies.” Journal of Aging & Social Policy 27 (1): 21–46. https://doi.org/10.1080/08959420.2015.969078.
- N.J. Admin. Code 10:60-6.2. n.d. https://www.state.nj.us/humanservices/providers/rulefees/regs/NJAC%2010_60%20Home%20Care%20Services.pdf.
- NORC at the University of Chicago. 2012. “ACA Section 2401, Community First Choice Option (Section 1915(k) of the Social Security Act); California State Plan Amendment Summary.” Research Summary. https://www.medicaid.gov/sites/default/files/2019-12/ca-cfc-spa-matrix_0.pdf.
- ———. 2014a. “ACA Section 2401, Community First Choice Option (Section 1915(k) of the Social Security Act); Oregon State Plan Amendment Summary.” Research Summary. https://www.medicaid.gov/sites/default/files/2019-12/or-cfc-spa-matrix.pdf.
- ———. 2014b. “ACA Section 2401, Community First Choice Option (Section 1915(k) of the Social Security Act); Montana State Plan Amendment Summary.” Research Summary. https://www.medicaid.gov/sites/default/files/2019-12/mt-cfc-spa-matrix.pdf.
- ———. 2014c. “ACA Section 2401, Community First Choice Option (Section 1915(k) of the Social Security Act); Maryland State Plan Amendment Summary.” Research Summary. https://www.medicaid.gov/sites/default/files/2019-12/md-cfc-spa-matrix.pdf.
- ———. 2015. “ACA Section 2401, Community First Choice Option (Section 1915(k) of the Social Security Act); Texas State Plan Amendment Summary.” Research Summary. https://www.medicaid.gov/sites/default/files/2019-12/tx-cfc-spa-matrix.pdf.
- North Dakota Department of Human Services, Behavioral Health Division. 2022. “1915(i) Services.” North Dakota. 2022. https://www.behavioralhealth.nd.gov/1915i/services.
- O’Malley Watts, Molly, MaryBeth Musumeci, and Priya Chidambaram. 2020. “Medicaid Home and Community-Based Services Enrollment and Spending.” Issue Brief. Washington, DC: Kaiser Family Foundation. https://www.kff.org/medicaid/issue-brief/medicaid-home-and-community-based-services-enrollment-and-spending/.
- O’Malley Watts, Molly, MaryBeth Musumeci, and Petry Ubri. 2017. “Medicaid Section 1115 Managed Long-Term Services and Supports Waivers: A Survey of Enrollment, Spending, and Program Policies.” Kaiser Family Foundation. https://www.kff.org/medicaid/report/medicaid-section-1115-managed-long-term-services-and-supports-waivers-a-survey-of-enrollment-spending-and-program-policies/.
- Paying for Senior Care. 2022. “Paying for Assisted Living & Home Care in Pennsylvania.” 2022. https://www.payingforseniorcare.com/pennsylvania.
- Richards, Barbara K. 2009. “Re: Washington State Plan Amendment (SPA) Transmittal Number #09-019,” December 22, 2009. https://www.medicaid.gov/sites/default/files/State-resource-center/Medicaid-State-Plan-Amendments/Downloads/WA/3-24-10-WA-09-019-Ltr.pdf.
- Saucier, Paul, Jessica Kasten, Brian Burwell, and Lisa Gold. 2012. “The Growth of Managed Long-Term Services and Supports (MLTSS) Programs: A 2012 Update.” Truven Health Analytics. https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Delivery-Systems/Downloads/MLTSSP_White_paper_combined.pdf. Archived at: https://web.archive.org/web/20120924143140/http://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Delivery-Systems/Downloads/MLTSSP_White_paper_combined.pdf.
- Silverman, Madi. 2013. “Home and Community-Based Services in Hawaii.” August 15. https://health.hawaii.gov/shpda/files/2013/11/madi-silverman-home-and-community-based-services-in-hawaii.pdf.
- State of Iowa. 2007. “HCBS Habilitation Services Program.” Iowa Department of Human Services. 2007. https://www.ime.state.ia.us/HCBS/HabilitationServices/Info.html. Archived at: https://web.archive.org/web/20071113062008/http://www.ime.state.ia.us/HCBS/HabilitationServices/Info.html.
- Tavenner, Marilyn. 2012. “KanCare Approval Letter,” December 27, 2012. https://www.medicaid.gov/Medicaid-CHIP-Program-Information/By-Topics/Waivers/1115/downloads/ks/KanCare/ks-kancare-amend-appvl-ltr-12272012.pdf.
- United States Government Accountability Office. 2012. “States’ Plans to Pursue New and Revised Options for Home- and Community-Based Services.” GAO-12-649. https://www.gao.gov/assets/gao-12-649.pdf.
- Wenzlow, Audra, Steve Eiken, and Kate Sredl. 2016. “Improving the Balance: The Evolution of Medicaid Expenditures for Long-Term Services and Supports (LTSS), FY 1981-2014.” Truven Health Analytics. https://www.medicaid.gov/sites/default/files/2019-12/evolution-ltss-expenditures.pdf.

