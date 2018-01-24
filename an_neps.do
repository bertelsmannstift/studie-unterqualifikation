capture log close
cd "..." 
log using "...", replace
*======================================================================================*

*********************
*** program setup ***
*********************
version 14.2
clear all
macro drop _all
set more off

*======================================================================================*
*import data                                                                           *
*======================================================================================*

use "data\NEPS_final.dta", clear

*======================================================================================*
*create tables                                                                         *
*======================================================================================*

*Kompetenzen nach Qualifizierung

*Gesamt
*Lesen
tab Qb_4 [iweight=round(w_t7_cal)], summarize(Lesen_1)
*Mathe
tab Qb_4 [iweight=round(w_t7_cal)], summarize(Mathe_1)
*Naturwissenschaft
tab Qb_4 [iweight=round(w_t7_cal)], summarize(Naturwissenschaft_2)
*IT
tab Qb_4 [iweight=round(w_t7_cal)], summarize(IT_2)

*Männer
*Lesen
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 1, summarize(Lesen_1)
*Mathe
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 1, summarize(Mathe_1)
*Naturwissenschaft
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 1, summarize(Naturwissenschaft_2)
*IT
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 1, summarize(IT_2)

*Frauen
*Lesen
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 0, summarize(Lesen_1)
*Mathe
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 0, summarize(Mathe_1)
*Naturwissenschaft
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 0, summarize(Naturwissenschaft_2)
*IT
tab Qb_4 [iweight=round(w_t7_cal)] if sex == 0, summarize(IT_2)


*Kompetenzen nach Qualifizierung für Anforderungsniveau 2

*Gesamt
*Lesen
tab Qb_4 if komp==2 [iweight=round(w_t7_cal)], summarize(Lesen_1) 
*Mathe
tab Qb_4 if komp==2 [iweight=round(w_t7_cal)], summarize(Mathe_1)
*Naturwissenschaft
tab Qb_4 if komp==2 [iweight=round(w_t7_cal)], summarize(Naturwissenschaft_2)
*IT
tab Qb_4 if komp==2 [iweight=round(w_t7_cal)], summarize(IT_2)


***********
*** end ***
***********
log close 
exit
