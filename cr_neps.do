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


use "...\SC6_Basics_D_7-0-0.dta", clear

keep ID_t tx29000 tx20000 t700001 tx27000 t405000_g2 tx29007 t741001 tx20000 t510010_g1 t510011_g1 tx28102 tx29060 tx29061 tx29062 tx29070 tx29080 tx28103

save "data\NEPS_Basics.dta", replace


use "data\source\SC6_spEmp_D_7-0-0.dta", clear

keep ID_t splink spell subspell spext nepswave wave ts23201_g2 ts23201_g4 ts23310 ts23320 ts23218 ts23221 ts23553 ts23243 ts23211

keep if subspell==0

save "data\NEPS_spEmp.dta", replace


use "data\source\SC6_xTargetCompetencies_D_7-0-0.dta", clear

keep ID_t maa3_sc1 mpa3ma_sc6 mpa3ma_sc5 rea3_sc1 rsa3_sc3 ica5_sc1 rea5_sc1 sca5_sc1 mpa7vo_sc6 mpa7vo_sc5 voa7_sc3 dga7_sc3b dga7_sc3a

save "data\NEPS_Comp.dta", replace


use "data\source\SC6_Education_D_7-0-0.dta", clear

keep ID_t tx28103 tx28101 number splink

bysort ID_t: egen h1 = max(number)

drop if h1 != number
drop h1

save "data\NEPS_Educ.dta", replace


use "data\source\SC6_spVocTrain_D_7-0-0.dta", clear

keep ID_t spell subspell ts15219 ts15203 ts15203_ha

keep if subspell == 0
drop if ts15219 < -20

bysort ID_t: egen h1 = max(spell)

drop if h1 != spell
drop h1 spell subspell 
save "data\NEPS_Voc.dta", replace


use "data\source\SC6_Weights_D_7-0-0.dta", clear

keep ID_t w_t7_cal

save "data\NEPS_Weights.dta", replace


*======================================================================================*
*merge data                                                                            *
*======================================================================================*


use "...\SC6_Biography_D_7-0-0.dta", clear

merge m:1 ID_t using "data\NEPS_Basics.dta"

drop _merge


merge m:1 ID_t using "data\NEPS_Comp.dta"

drop _merge


merge m:1 ID_t splink using "data\NEPS_spEmp.dta"

drop if splast == 2

drop if _merge != 3
drop _merge


merge m:1 ID_t using "data\NEPS_Educ.dta"

rename _merge merge_educ

merge m:1 ID_t using "data\NEPS_Voc.dta"

rename _merge merge_voc



merge m:1 ID_t using "data\NEPS_Weights.dta"

drop if _merge != 3

save "data\NEPS_merge1.dta", replace


*======================================================================================*
*create sample                                                                         *
*======================================================================================*


use "data\NEPS_merge1.dta", clear

*nur aktuelle welle

drop if wave != 7

*Arbeitslose raus

drop if tx29080 == 1

*Alter: 18 - 65

rename tx29000 age

drop if age >65
drop if age <18 

*Age-groups generieren

gen age_group =.
replace age_group = 1 if age >= 18 & age < 25
replace age_group = 2 if age >= 25 & age < 55
replace age_group = 3 if age >= 55 & age <= 65

lab var age_group "Altersgruppen"
label define age1 1 "18 - 24" 2 "25 - 54" 3 "55 - 65"
label values age_group age1

*Militärangehörige und unplausible Werte in KLDB und ISCO raus

rename ts23201_g2 KldB2010

drop if KldB2010 < 1
drop if KldB2010 == 99999
drop if KldB2010 == 01402
drop if KldB2010 == 01104
drop if KldB2010 == 01302
drop if KldB2010 ==.

rename ts23201_g4 ISCO08
drop if ISCO08 == 110
drop if ISCO08 == 210
drop if ISCO08 ==.

gen isco1 = int(ISCO08/1000)

*Bildung

rename tx28103 ISCED97
drop if ISCED97 ==.
drop if ISCED97 == -55
rename tx28102 bjahre
rename tx28101 CASMIN

rename ts15203 ausb_l1
rename ts15203_ha ausb_l2

*Anforderungsniveau bilden (letzte KldB Stelle)

gen komp = KldB2010 - int(KldB2010/10)*10 

*Vollzeit

rename ts23218 vollz

*Arbeitsstunden

rename ts23553 astd
replace astd =. if astd < 0

*Geschlecht

rename t700001 sex
replace sex = 0 if sex == 2
label define sex1 0 "weiblich" 1 "männlich"
label values sex sex1
 
*Familienstand

rename tx27000 fam_st

*Befristung

rename ts23310 befr
replace befr =. if befr <= 0
replace befr = 0 if befr == 2
label define befr1 0 "unbefristet" 1 "befristet"
label values befr befr1
 
*Migranten

rename t405000_g2 migr
drop if migr == -55
replace migr = 0 if migr == 1 | migr == 2
replace migr = 1 if migr == 3
lab var migr "Migrant Ja / Nein"
label define migr1 0 "Nein" 1 "Ja"
label values migr migr1

rename tx29007 migr_age
lab var migr_age "Alter bei Migration"

*Kinder 
 
rename tx20000 kinder
lab var kinder "Anzahl Kinder im Haushalt"

*Kompetenzen 
 
rename maa3_sc1 Mathe_1
replace  Mathe_1=. if  Mathe_1==-55 |  Mathe_1==-56

rename rea3_sc1 Lesen_1
replace  Lesen_1=. if  Lesen_1==-55 |  Lesen_1==-56

rename rea5_sc1 Lesen_2
replace  Lesen_2=. if  Lesen_2==-55 |  Lesen_2==-56

rename sca5_sc1 Naturwissenschaft_2
replace  Naturwissenschaft_2=. if  Naturwissenschaft_2==-55 |  Naturwissenschaft_2==-56

rename ica5_sc1 IT_2
replace  IT_2=. if  IT_2==-55 |  IT_2==-56

rename voa7_sc3 Wortsch_summe

rename rsa3_sc3 Lesen_summe

*Dummies für Über-/ Unterdurchschnittliche Kompetenzen.

gen Lesen_bin =.
replace Lesen_bin =1 if Lesen_1 >0 & Lesen_1 !=.
replace Lesen_bin =0 if Lesen_1 <0

gen Mathe_bin =.
replace Mathe_bin =1 if Mathe_1 >0 & Mathe_1 !=.
replace Mathe_bin =0 if Mathe_1 <0

gen Natur_bin=.
replace Natur_bin =1 if Naturwissenschaft_2 >0 & Naturwissenschaft_2 !=.
replace Natur_bin =0 if Naturwissenschaft_2 <0

gen IT_bin=.
replace IT_bin =1 if IT_2 >0 & IT_2 !=.
replace IT_bin =0 if IT_2 <0

*Qualifizierungen messen

*Nach Abschluss

rename ts15219 abschl

gen qual1 =.
lab var qual1 "Qualifikation nach Abschluss"

replace qual1 = 1 if abschl == -20 | abschl == 23
replace qual1 = 2 if abschl == 1 | abschl == 2 | abschl == 3 | abschl == 4 | abschl == 24 | abschl == 27
replace qual1 = 3 if abschl == 5 | abschl == 6 | abschl == 8 | abschl == 12 | abschl == 13 | abschl == 25 | abschl == 17 | abschl == 18
replace qual1 = 4 if abschl == 7 | abschl == 9 | abschl == 10 | abschl == 11 | abschl == 14 | abschl == 15 | abschl == 16 | abschl == 19 | abschl == 20 | abschl == 21 | abschl == 22 | abschl == 26

*Nach ISCED97

gen qual2 =.
lab var qual2 "Qualifikation nach ISCED97"

replace qual2 = 1 if ISCED97 == 0 | ISCED97 == 1 | ISCED97 == 2 | ISCED97 == 3 | ISCED97 == 6
replace qual2 = 2 if ISCED97 == 5 | ISCED97 == 7 | ISCED97 == 4
replace qual2 = 3 if ISCED97 == 8
replace qual2 = 4 if ISCED97 == 9 | ISCED97 == 10

*Nach CASMIN

gen qual3 =.
lab var qual3 "Qualifikation nach CASMIN"

replace qual3 = 1 if CASMIN == 0 | CASMIN == 1 | CASMIN == 3 | CASMIN == 5
replace qual3 = 2 if CASMIN == 2 | CASMIN == 4 | CASMIN == 6
*Alle FH in 3
replace qual3 = 3 if CASMIN == 7
*Alle Uni in 4
replace qual3 = 4 if CASMIN == 8

*Über- und Unterqualifizierung messen

*Nach Abschluss (Vorsicht, reine Schulausbildungen sind hier nicht enthalten)

gen UEQ_1 =.
replace UEQ_1 = 1 if qual1 > komp
replace UEQ_1 = 0 if qual1 < komp
replace UEQ_1 = 0 if qual1 == komp
lab var UEQ_1 "Überqualifizierung nach Abschluss"

gen UQ_1 =.
replace UQ_1 = 1 if qual1 < komp
replace UQ_1 = 0 if qual1 > komp
replace UQ_1 = 0 if qual1 == komp
lab var UQ_1 "Unterqualifizierung nach Abschluss"

gen AQ_1 =.
replace AQ_1 = 1 if qual1 == komp
replace AQ_1 = 0 if qual1 < komp
replace AQ_1 = 0 if qual1 > komp
lab var AQ_1 "Adäquate Qualifizierung nach Abschluss"

*Nach ISCED97

gen UEQ_2 =.
replace UEQ_2 = 1 if qual2 > komp
replace UEQ_2 = 0 if qual2 < komp
replace UEQ_2 = 0 if qual2 == komp
lab var UEQ_2 "Überqualifizierung nach ISCED97"

gen UQ_2 =.
replace UQ_2 = 1 if qual2 < komp
replace UQ_2 = 0 if qual2 > komp
replace UQ_2 = 0 if qual2 == komp
lab var UQ_2 "Unterqualifizierung nach ISCED97"

gen AQ_2 =.
replace AQ_2 = 1 if qual2 == komp
replace AQ_2 = 0 if qual2 < komp
replace AQ_2 = 0 if qual2 > komp
lab var AQ_2 "Adäquate Qualifizierung nach ISCED97"

*Nach CASMIN

gen UEQ_3 =.
replace UEQ_3 = 1 if qual3 > komp
replace UEQ_3 = 0 if qual3 < komp
replace UEQ_3 = 0 if qual3 == komp
lab var UEQ_3 "Überqualifizierung nach CASMIN"

gen UQ_3 =.
replace UQ_3 = 1 if qual3 < komp
replace UQ_3 = 0 if qual3 > komp
replace UQ_3 = 0 if qual3 == komp
lab var UQ_3 "Unterqualifizierung nach CASMIN"

gen AQ_3 =.
replace AQ_3 = 1 if qual3 == komp
replace AQ_3 = 0 if qual3 < komp
replace AQ_3 = 0 if qual3 > komp
lab var AQ_3 "Adäquate Qualifizierung nach CASMIN"


*Genauere Qualifizierung unter berücksichtigung aller verfügabren Variablen

gen qual4 =.

*deckungsgleiche Beobachtungen aller Measures übernehmen

replace qual4 = qual1 if qual1 == qual2 & qual1 == qual3

*präzisestes measure (Abschluss, direkte Frage) übernehmen

replace qual4 = qual1 if qual1 !=.

*deckungsgleiche Beobachtungen der beiden verbleibenden Measures übernehmen

replace qual4 = qual2 if qual1 == . & qual2 == qual3

*Eindeutige Zuordnungen von CASMIN und ISCED

replace qual4 = 2 if CASMIN == 6 & qual1 ==. & qual2 != qual3
replace qual4 = 4 if ISCED97 == 10 & qual1 ==. & qual2 != qual3
replace qual4 = qual3 if qual1 ==. & qual2 == 3 

*FH zu 4
replace qual4 = qual3 if qual1 ==. & qual2 == 4 

*Nach genauerer Qualifizierung

gen UEQ_4 =.
replace UEQ_4 = 1 if qual4 > komp
replace UEQ_4 = 0 if qual4 < komp
replace UEQ_4 = 0 if qual4 == komp
lab var UEQ_4 "Überqualifizierung"

gen UQ_4 =.
replace UQ_4 = 1 if qual4 < komp
replace UQ_4 = 0 if qual4 > komp
replace UQ_4 = 0 if qual4 == komp
lab var UQ_4 "Unterqualifizierung"

gen AQ_4 =.
replace AQ_4 = 1 if qual4 == komp
replace AQ_4 = 0 if qual4 < komp
replace AQ_4 = 0 if qual4 > komp
lab var AQ_4 "Adäquate Qualifizierung"

*Zusammenfassende Variable

gen Q_4 =.
replace Q_4 = 1 if qual4 < komp
replace Q_4 = 2 if qual4 == komp
replace Q_4 = 3 if qual4 > komp
lab var Q_4 "Qualifizierung"

label define Q4 1 "Unterqualifizierung" 2 "Adäquate Qualifizierung" 3 "Überqualifizierung"
label values Q_4 Q4

*Binäre Variable Unter- / adäquat qualifiziert

gen Qb_4 =.
replace Qb_4 = 1 if qual4 < komp
replace Qb_4 = 0 if qual4 == komp & qual4 != .
lab var Qb_4 "Qualifizierung binär"

label define Qb4 0 "Adäquate Qualifizierung" 1 "Unterqualifizierung"
label values Qb_4 Qb4

*Binär Unterqualifziert / Rest

gen UQ_reg =.
replace UQ_reg = 1 if Q_4 == 1
replace UQ_reg = 0 if Q_4 == 2 | Q_4 == 3


*Abitur in Qualifikationsstufe 1 extra ausweisen.

gen qual5=.

replace qual5 = 1 if qual4 == 1
replace qual5 = 2 if ISCED97 == 3
replace qual5 = 3 if qual4 == 2
replace qual5 = 4 if qual4 == 3
replace qual5 = 5 if qual4 == 4

*Personen mit zwei "gleichwertigen" Employment Spells finden 

count if ID_t == ID_t[_n-1]

sort ID_t
quietly by ID_t:  gen dup = cond(_N==1,0,_n)

*Werte "keine festgelegte Arbeitszeit", also "95", kleiner als 0 machen, damit dies nicht als meiste Stunden auftaucht

replace astd = -100 if astd == 95

*Doppelte Beobachtungen mit der geringeren Stundenzahl droppen

bysort ID_t: egen astd_m = max(astd)
bysort ID_t: egen astd_min = min(astd)

keep if astd_m == astd | astd_min == -100 | astd_m ==.

*falls ein job "keine festgelegte Arbeitszeit" hat, den anderen nehmen, falls 30 Std. überschritten werden.

drop if astd_min == astd & astd_min == -100 & astd_m >= 30

*Falls der zweite Job unte 30 Std. ist, denjenigen nehmen, der früher begonnen wurde

bysort ID_t: egen starty_m = max(starty)
bysort ID_t: egen starty_min = min(starty)

quietly by ID_t:  gen dup2 = cond(_N==1,0,_n)

drop if starty != starty_min & dup2 != 0

*Wenn alle Jobs "keine festgelegte Arbeitszeit" haben, denjenigen behalten, der als erstes begonnen wurde
*Jahr

quietly by ID_t:  gen dup3 = cond(_N==1,0,_n)
drop if starty == starty_m & astd_m == -100 & astd_min == -100 & dup3 != 0

*Nach Monat

quietly by ID_t:  gen dup4 = cond(_N==1,0,_n)
bysort ID_t: egen startm_m = max(startm)
bysort ID_t: egen startm_min = min(startm)
drop if startm != startm_min & dup4 != 0

*14 Individuen mit doppelten spells bleiben übrig. Da sich (bis auf manchmal die Arbeitsstunden, welche für unsere Untersuchung irrelevant sind,) nichts unterscheidet, wird die Hälfte gedroppt.

bysort ID_t: egen spell_m = max(spell)
drop if spell != spell_m 

*Firmengröße
rename ts23243 firms
replace firms =. if firms < 0
*Selbstständig
rename ts23211 self
*Selbstständige droppen
drop if self !=.
drop self

*Überflüssige Variablen droppen

drop sptype spms wave splast spext nepswave t741001 t510010_g1 t510011_g1 tx29060 tx29061 tx29062 tx29070 tx29080 mpa3ma_sc6 mpa3ma_sc5 ///
mpa7vo_sc6 mpa7vo_sc5 dga7_sc3b dga7_sc3a ts23221 ts23320 astd_m astd_min starty_m starty_min startm_m startm_min spell_m dup*


save "data\NEPS_final.dta", replace


******* Doppelte Beobachtungen:
count if ID_t == ID_t[_n-1]


***********
*** end ***
***********
log close 
exit




