/* Datensatz laden */
use "${DATA_DERIVED}soep_pulled.dta", clear

/* Variablen umbenennen */
rename gebjahr		ybirth
rename hhnr			hhnr
rename germborn		migrant

/* Familienstand */
rename bdfamstd		famstd2013
rename befamstd		famstd2014
rename bffamstd		famstd2015
rename bgfamstd		famstd2016

/* Sampleregion */
rename bdsampreg	sampreg2013
rename besampreg	sampreg2014
rename bfsampreg	sampreg2015
rename bgsampreg	sampreg2016

/* Hochrechnungsfraktor */
rename bdphrf		phrf2013
rename bephrf		phrf2014
rename bfphrf		phrf2015
rename bgphrf		phrf2016

/* Hochrechnungsfraktor */
rename bdhhrf		hhrf2013
rename behhrf		hhrf2014
rename bfhhrf		hhrf2015
rename bghhrf		hhrf2016

/* KldB2010 */
rename kldb2010_13	kldb2010gen2013
rename kldb2010_14	kldb2010gen2014
rename kldb2010_15	kldb2010gen2015
rename kldb2010_16	kldb2010gen2016

/* KldB2010 */
rename bdp38_kldb2010	kldb20102013
rename bep28_kldb2010	kldb20102014
rename bfp52_kldb2010	kldb20102015
rename bgp48_kldb2010	kldb20102016

/* Zugehoerigkeit */
rename bdpop 		pop2013
rename bepop		pop2014
rename bfpop		pop2015
rename bgpop		pop2016

/* Haushaltsnummer */
drop hhnrakt
rename bdhhnr		hhnrakt2013
rename behhnr		hhnrakt2014
rename bfhhnr		hhnrakt2015
rename bghhnr		hhnrakt2016

/* Berufliche Stellung */ 
rename stib13		stib2013
rename stib14		stib2014
rename stib15		stib2015
rename stib16		stib2016

/* Befragungsstatus */
rename bdnetto		netto2013
rename benetto		netto2014
rename bfnetto		netto2015
rename bgnetto		netto2016

/* Dauer der Ausbildung */
rename bdbilzeit	yeduc2013
rename bebilzeit	yeduc2014
rename bfbilzeit	yeduc2015
rename bgbilzeit	yeduc2016

/* Arbeitswochenstunden vereinbart */
rename bdp6501		whours2013
rename bep4701		whours2014
rename bfp8101		whours2015
rename bgp6901		whours2016

/* Arbeitswochenstunden tatsaechlich */
rename bdp66		rwhours2013
rename bep48		rwhours2014
rename bfp82		rwhours2015
rename bgp70		rwhours2016

/* Erwerbsstatus */
rename bdp18		erwerb2013
rename bep12		erwerb2014
rename bfp32		erwerb2015
rename bgp31		erwerb2016

/* Erforderliche Ausbildung */
rename ausb13		ausb2013
rename ausb14		ausb2014
rename ausb15		ausb2015
rename ausb16		ausb2016

/* Schulabschluss */
rename bdpsbil		sdeg2013
rename bepsbil		sdeg2014
rename bfpsbil		sdeg2015
rename bgpsbil		sdeg2016

/* Abschluss im Ausland */
rename bdpbbila		fdeg2013
rename bepbbila		fdeg2014
rename bfpbbila		fdeg2015
rename bgpbbila		fdeg2016

/* Beruflicher Bildungsabschluss */
rename bdpbbil01	edeg2013
rename bepbbil01	edeg2014
rename bfpbbil01	edeg2015
rename bgpbbil01	edeg2016

/* Hochschulabschluss */
rename bdpbbil02	udeg2013
rename bepbbil02	udeg2014
rename bfpbbil02	udeg2015
rename bgpbbil02	udeg2016

/* Hochschulabschluss (angelehnt an StaBu) */
rename degree13		degree2013
rename degree14		degree2014
rename degree15		degree2015
rename degree16		degree2016

/* Kein Abschluss */
rename bdpbbil03	ndeg2013
rename bepbbil03	ndeg2014
rename bfpbbil03	ndeg2015
rename bgpbbil03	ndeg2016

/* ISCO */
rename isco08_13	isco2013
rename isco08_14	isco2014
rename isco08_15	isco2015
rename isco08_16	isco2016

/* ISCED */
rename isced11_13	isced2013
rename isced11_14	isced2014
rename isced11_15	isced2015
rename isced11_16	isced2016

/* Taetigkeit im erlernten Beruf */
rename erljob13		erljob2013
rename erljob14		erljob2014
rename erljob15		erljob2015
rename erljob16		erljob2016

/* Dauer der Betriebszugehoerigkeit */
rename bderwzeit	tenure2013
rename beerwzeit	tenure2014
rename bferwzeit	tenure2015
rename bgerwzeit	tenure2016

/* Bruttolohn */
rename bdp7701		gwage2013
rename bep5701		gwage2014
rename bfp10201		gwage2015
rename bgp8101		gwage2016

/* Bundesland */
rename bdbula		bula2013
rename bebula		bula2014
rename bfbula		bula2015
rename bgbula		bula2016

/* Zahl der Personen im Haushalt */
rename bdhhgr		hhgr2013
rename behhgr		hhgr2014
rename bfhhgr		hhgr2015
rename bghhgr		hhgr2016

/* Branche aktueller Beruf */
rename bdp42_nace	branche2013
rename bep32_nace	branche2014
rename bfp55_nace	branche2015
rename bgp52_nace	branche2016

/* Arbeitsmarkerfahrung Vollzeit */
rename expft13		expft2013
rename expft14		expft2014
rename expft15		expft2015
rename expft16		expft2016

/* Arbeitsmarkerfahrung Teilzeit */
rename exppt13		exppt2013
rename exppt14		exppt2014
rename exppt15		exppt2015
rename exppt16		exppt2016

/* Arbeitsmarkterfahrung arbeitslos */
rename expue13		expue2013
rename expue14		expue2014
rename expue15		expue2015
rename expue16		expue2016

/* Anzahl der Kinder bis 16 Jahre im Haushalt */
rename bdkzahl		nchild2013
rename bekzahl		nchild2014
rename bfkzahl		nchild2015
rename bgkzahl		nchild2016

/* Chancen gleichwertige Stelle zu finden */
rename bdp55		gleich2013
rename bep40		gleich2014
rename bfp71		gleich2015
gen					gleich2016=.

/* Erforderliche Qualifikation */
rename bdp40		erfjob2013
rename bep30		erfjob2014
rename bfp54		erfjob2015
rename bgp50		erfjob2016

/* Befristet */
rename bdp49		befr2013
rename bep38		befr2014
rename bfp61		befr2015
rename bgp57		befr2016

/* Taetigkeit entspricht Beruf */
rename bdp39		entspr2013
rename bep29		entspr2014
rename bfp53		entspr2015
rename bgp49		entspr2016

/* Firmengroesse */
rename bdp43		fsize2013
rename bep33		fsize2014
rename bfp56		fsize2015
rename bgp62		fsize2016

/* Zufrieden mit Arbeit */
rename bdp0103		zufr2013
rename bep0103		zufr2014
rename bfp0103		zufr2015
rename bgp0103		zufr2016


/* Daten umformen: Paneldaten */
reshape long famstd sampreg phrf hhrf kldb2010gen kldb2010 pop hhnrakt 		///
 stib netto yeduc whours rwhours erwerb ausb sdeg fdeg edeg udeg ndeg isco 	///
 isced erljob erfjob tenure gwage bula hhgr branche expft exppt expue 		///
 nchild degree gleich befr entspr fsize zufr 								///
 , i(hhnr persnr sex ybirth migrant psample prgroup immiyear loc1989) j(year)

/* Fehlende Werte umcodieren */
mvdecode _all, mv(-1=.a \ -2=.b \ -3=.c \ -4=.d \ -5=.e)

/* Variablen umcodieren */

/* Geschlecht */
recode sex (2 = 0 "female") (1 = 1 "male"), gen(sex_n)
drop sex
rename sex_n sex

/* Berufliche Stellung: Abhaengige/nicht abhaengige Beschaeigung */
recode stib (13 = 1 "retired") (else = 0 "non retired"), gen(retired)

recode stib (610 620 630 640 = 1 "Civil Servant") (else = 0 "No civil servant"), gen(civserv)

recode civserv (1 2 3 4 = 1 "Civil Servant") (.b = 0 "No civil servant"), gen(civserv_n)
drop civserv
rename civserv_n civserv

recode stib (411 412 421 422 423 431 432 433 440 = 1 "Nicht abhaengig beschaeftigt") (else = 0 "abhaengig beschaeftigt"), gen(selfemp)
drop stib

/* Migrant */
recode migrant (1 = 0 "native") (2 = 1 "migrant"), gen(migrant_n)
drop migrant
rename migrant_n migrant

/* Arbeitsstunden */			
replace whours = whours/10 if !missing(whours)
replace rwhours = rwhours/10 if !missing(rwhours)

/* ISCED */ 
recode isced (1 2 = 1 "Low skilled") (3 4 5 = 2 "Medium skilled") (6 7 8 = 3 "High skilled"), gen(skill)

/* Alter */ 
gen age = .
replace age = year-ybirth

/* Altersgruppen */
generate agecat=recode(age,17,29,49,65,9999)

recode agecat (17=1 "below 18 years") (29=2 "18 to 29 years") (49=3 "30 to 49 years") (64=4 "50 to 65 years") (9999=5 "above 65 years"), gen(agecat_n)
drop agecat
rename agecat_n agecat
la var agecat "Age categories"

generate  agecat2=recode(age,17,25,40,54,65,9999)
recode agecat2 (17=1 "below 18 years") (25=2 "18 to 25 years") (40=3 "26 to 40 years") (54=4 "41 to 54 years") (65=5 "55 to 65 years") (9999=6 "above 65 years"), gen(agecat2_n)
drop agecat2
rename agecat2_n agecat2
la var agecat2 "Age categories"

generate  agecat3=recode(age,14,25,35,45,55,65,9999)
recode agecat3 (14=1 "below 15 years") (25=2 "15 to 25 years") (35=3 "26 to 35 years") (45=4 "36 to 45 years") (55=5 "46 to 55 years") (65=6 "56 to 65 years") (9999=7 "above 65 years"), gen(agecat3_n)
drop agecat3
rename agecat3_n agecat3
la var agecat3 "Age categories (Destatis)"

/* Anforderungsniveau */ 
gen jobreq=kldb2010gen-int(kldb2010gen/10)*10

/* Jahre seit Zuwanderung und Alter zum Zeitpunkt der Zuwanderung */ 
gen ysm = year-immiyear
gen agemig = .
replace agemig = age-ysm if migrant == 1
replace agemig = 0 if migrant == 0
gen age89 = 1989-ybirth

/* Lohn */
gen working_hours = .

replace working_hours = rwhours if rwhours > whours & rwhours != .
replace working_hours = whours if whours > rwhours & whours != .
replace working_hours = rwhours if whours == rwhours
replace working_hours = rwhours if whours == . & rwhours != .
replace working_hours = whours if rwhours == . & whours != .
gen ghwage = gwage/(4.2*working_hours)
gen wage = .
replace wage = ghwage/(105.7/100) if year == 2013
replace wage = ghwage/(106.6/100) if year == 2014
replace wage = ghwage/(106.9/100) if year == 2015
replace wage = ghwage/(107.4/100) if year == 2016
gen lwage = ln(wage)

/* Sample bereinigen */ 

/* Ausschluss von: fehlende Angabe Befragungsstatus */
drop if missing(netto)

/* Nur Privathaushalte */
keep if inlist(pop,1,2)

/* Alter: 18-65 */
keep if age >=18 & age <=65

/* KldB */
drop kldb2010
rename kldb2010gen kldb

/* Ausschluss von: berufliche Bildung im Ausland */
drop if !missing(fdeg)

/* Ausschluss von: derzeit Lehre/Studium */
drop if ndeg == 2 | ndeg == 3

/* ISCO (verschiedene Anzahl der Stellen) */
gen isco1 = int(isco/1000)
gen isco2 = int(isco/100)

/* KldB (verschiedene Anzahl der Stellen) */
gen kldb3 = int(kldb/100)
gen kldb2 = int(kldb/1000)
gen kldb1 = int(kldb/10000)

/* Familienstand */
recode famstd (1 2 = 1 "married") (3 4 5 6 7 8 = 0 "not married"), gen(married)

/* Anzahl der Kinder = 0 bei fehlender Angabe */
replace nchild = 0 if nchild == .

/* Dummy-Variable = 1, wenn Kinder; = 0 sonst */
gen dchild = .
replace dchild = 1 if nchild > 0 & nchild < .
replace dchild = 0 if nchild == 0

/* Ausschluss von: Militaer */
drop if isco1 == 0 | kldb1 == 0

/* Nur abhaengig beschaeftigte Erwerbstaetige */
keep if inlist(erwerb,1,2)
recode erwerb (1=1 "Full time") (2=0 "Part time"), gen(ftime)
drop if selfemp == 1

/* Sample: keine fehlenden Angaben bei KldB, Lohn und Bildung */
reg kldb lwage yeduc
keep if e(sample)

/* Merge KldB */
merge m:1 kldb1 using "${DATA_DERIVED}kldb1.dta"
drop if _merge == 2
drop _merge

merge m:1 kldb2 using "${DATA_DERIVED}kldb2.dta"
drop if _merge == 2
drop _merge

merge m:1 kldb3 using "${DATA_DERIVED}kldb3_task.dta"
drop if _merge == 2
drop _merge

/* Firmengroesse: Ausschluss von Selbststaendigen */
drop if fsize == 8
recode fsize (1 2 3 = 1 "Unter 20") (4 5 = 2 "20 bis unter 200") (6 = 3 "200 bis unter 2000") (7 = 4 "2000 und mehr"), gen(fsize_n)
drop fsize
rename fsize_n fsize

/* Generierung von Variablen fuer Fehlqualifizierung */

/* Hoechster erreichter Abschluss */
gen hdeg = .

/* Schulabschluesse */
replace hdeg = 0 if sdeg == 6 & missing(udeg) & missing(edeg) 
replace hdeg = 1 if sdeg == 1 & missing(udeg) & missing(edeg)
replace hdeg = 2 if sdeg == 2 & missing(udeg) & missing(edeg)
replace hdeg = 3 if (sdeg == 3 | sdeg == 4) & (missing(udeg) & missing(edeg))
replace hdeg = 0 if sdeg == 5 & isced == 1

/* Berufsabschluesse */
replace hdeg = 4 if edeg == 1 & missing(udeg)
replace hdeg = 5 if (edeg == 2 | edeg == 3 | edeg == 4) & missing(udeg)
replace hdeg = 6 if edeg == 5 & missing(udeg)

/* Studium */
replace hdeg = 7 if (degree == 13 | degree == 22)
replace hdeg = 8 if inlist(degree,11,12,14,15,16,23,31,32,33,34,35,36,37,38) | (degree == 21 & edeg != 5)
replace hdeg = 9 if degree == 42 | degree == 43
replace hdeg = 9 if udeg == 6 & (missing(degree) | degree == 44)

replace hdeg = 7 if missing(hdeg) & udeg == 9
replace hdeg = 7 if missing(hdeg) & isced == 6 & (udeg == 1 | udeg == 2)
replace hdeg = 8 if missing(hdeg) & isced == 7
replace hdeg = 2 if missing(hdeg) & isced == 2 
replace hdeg = 4 if missing(hdeg) & isced == 3

label define hdeg_lab 0 "Keinen Schulabschluss" 1 "Hauptschule" 2 "Realschule" 3 "(Fach)Abitur" 4 "Lehre" ///
5 "(Berufs)Fachschule, Meister, Gesundheit" 6 "Beamtenausbildung" 7 "Bachelor" 8 "Master, Diplom, Magister, Lehramt, Staatsexamen" 9 "Promotion, Habilitation"

label values hdeg hdeg_lab

/* Hoechsten erreichten Abschluss in formale Qualifikation umcodieren */
recode hdeg (8 9 = 1 "Formale Qualifikation AN4") (else = 0), gen(fq4)
recode hdeg (5 6 7 = 1 "Formale Qualifikation AN3") (else = 0), gen(fq3)
recode hdeg (4 = 1 "Formale Qualifikation AN2") (else = 0), gen(fq2)
recode hdeg (0 1 2 3 = 1 "Formale Qualifikation AN1") (else= 0), gen(fq1)

/* Variable fuer FQ generieren */
gen fq = .
replace fq = 1 if fq1 == 1
replace fq = 2 if fq2 == 1
replace fq = 3 if fq3 == 1
replace fq = 4 if fq4 == 1

gen achqual = 1 if fq1 == 1	
replace achqual = 2 if fq2 == 1
replace achqual = 3 if fq3 == 1
replace achqual = 4 if fq4 == 1

/* Fehlqualifikation: JA-Methode */
gen misqual = achqual-jobreq

gen unja = 1 if misqual < 0 & misqual != .
replace unja = 0 if misqual >= 0 & misqual != .

gen eqja = 1 if misqual == 0 
replace eqja = 0 if misqual < 0 & misqual != .
replace eqja = 0 if misqual > 0 & misqual != .

gen ovja = 1 if misqual > 0 & misqual != .
replace ovja = 0 if misqual <= 0 & misqual != .

/* Fehlqualifikation: RM-Methode */
bys isco2 year: egen myeduc = mean(yeduc)
bys isco2 year: egen sdyeduc = sd(yeduc)
bys isco2 year: gen number = _N

replace myeduc = . if number < 10
replace sdyeduc = . if number < 10
drop number

gen unrm = .
replace unrm = 1 if yeduc < (myeduc-sdyeduc) & !missing(yeduc)
replace unrm = 0 if yeduc >= (myeduc-sdyeduc) & !missing(yeduc)
replace unrm = . if myeduc == .

gen ovrm = .
replace ovrm = 1 if yeduc > (myeduc+sdyeduc) & !missing(yeduc)
replace ovrm = 0 if yeduc <= (myeduc+sdyeduc) & !missing(yeduc)
replace ovrm = . if myeduc == .

gen eqrm = .
replace eqrm = 1 if (yeduc >= (myeduc-sdyeduc) & yeduc <= (myeduc+sdyeduc)) & !missing(yeduc)
replace eqrm = 0 if yeduc < (myeduc-sdyeduc) | yeduc > (myeduc+sdyeduc) & !missing(yeduc)
replace eqrm = . if myeduc == .

bys isco2 year: egen myeduc_isco = mean(yeduc)
bys isco2 year: egen sdyeduc_isco = sd(yeduc)
bys isco2 year: gen number_isco = _N

replace myeduc_isco = . if number_isco < 10
replace sdyeduc_isco = . if number_isco < 10
drop number_isco

gen unrm_isco = .
replace unrm_isco = 1 if yeduc < (myeduc_isco-sdyeduc_isco) & !missing(yeduc)
replace unrm_isco = 0 if yeduc >= (myeduc_isco-sdyeduc_isco) & !missing(yeduc)
replace unrm_isco = . if myeduc_isco == .

gen ovrm_isco = .
replace ovrm_isco = 1 if yeduc > (myeduc_isco+sdyeduc_isco) & !missing(yeduc)
replace ovrm_isco = 0 if yeduc <= (myeduc_isco+sdyeduc_isco) & !missing(yeduc)
replace ovrm_isco = . if myeduc_isco == .

gen eqrm_isco = .
replace eqrm_isco = 1 if yeduc >= (myeduc_isco-sdyeduc_isco) | yeduc <= (myeduc_isco+sdyeduc_isco) & !missing(yeduc)
replace eqrm_isco = 0 if yeduc < (myeduc_isco-sdyeduc_isco) | yeduc > (myeduc_isco+sdyeduc_isco) & !missing(yeduc)
replace eqrm_isco = . if myeduc_isco == .

/* Fehlqualifikation: WA-Methode */
gen achwa = .
replace achwa = 1 if inlist(hdeg,0,1,2,3)
replace achwa = 2 if inlist(hdeg,4,5,6)
replace achwa = 3 if inlist(hdeg,7,8,9)

recode ausb (1 2 3 4 = 1) (5 = 2) (6 8 9 = 3) (else = .), gen(reqwa)

gen miswa = achwa-reqwa

gen unwa = .
replace unwa = 1 if miswa < 0 & !missing(miswa)
replace unwa = 0 if miswa >= 0 & !missing(miswa)

gen ovwa = .
replace ovwa = 1 if miswa > 0 & !missing(miswa)
replace ovwa = 0 if miswa <= 0 & !missing(miswa)

gen eqwa = .
replace eqwa = 1 if miswa == 0
replace eqwa = 0 if miswa < 0 & !missing(miswa)
replace eqwa = 0 if miswa > 0 & !missing(miswa)

/* Befristung: Auschluss von: kein Arbeitsvertrag */
drop if befr == 3
recode befr (1 = 0 "Unbefristet") (2 = 1 "Befristet") (else = .), gen(befr_temp)
drop befr
rename befr_temp befr

/*-----------------------label variables--------------------------------------*/
la var year 				"Year"
la var phrf					"Individual weight"
la var hhrf					"Household weight"
la var sex					"Gender"
la var hhnrakt				"Current HH Number"
la var sampreg				"Sample Region"
la var sex					"Dummy = 1 if male"
la var netto				"Befragungsstatus"
la var famstd				"Family status"
la var pop					"Populationszugehoerigkeit"
la var age					"Age in years"
la var yeduc 				"Years of education"
la var whours				"Agreed working hours"
la var rwhours				"Actually worked hours"
la var migrant				"Dummy = 1 if migrant"
la var civserv				"Dummy = 1 if civil servant"
la var retired				"Dummy = 1 if retired"
la var jobreq				"Anforderungsniveau"
la var kldb					"KldB 2010"
la var erwerb				"Erwerbsstatus"
la var ausb					"Erforderliche Ausbildung im Beruf"
la var isco					"ISCO"
la var erljob				"Dummy=1 wenn im erlenten Beruf gearbeitet wird"
la var wage					"Gross real hourly earnings"
la var lwage				"Log gross real houry earnings"
la var unja					"Dummy =1 wenn Unterqualifiziert (JA)"
la var ovja					"Dummy =1 wenn ueberqualifiziert (JA)"
la var eqja					"Dummy =1 wenn richtig qualifiziert (JA)"
la var unrm					"Dummy =1 wenn Unterqualifiziert (RM)"
la var ovrm					"Dummy =1 wenn ueberqualifiziert (RM)"
la var eqrm					"Dummy =1 wenn richtig qualifiziert (RM)"
la var unwa					"Dummy =1 wenn Unterqualifiziert (WA)"
la var ovwa					"Dummy =1 wenn ueberqualifiziert (WA)"
la var eqwa					"Dummy =1 wenn richtig qualifiziert (WA)"
la var unrm_isco			"Dummy =1 wenn Unterqualifiziert (RM ISCO)"
la var ovrm_isco			"Dummy =1 wenn ueberqualifiziert (RM ISCO)"
la var eqrm_isco			"Dummy =1 wenn richtig qualifiziert (RM ISCO)"
la var isco1				"1 digit ISCO 08"
la var isco2				"2 digit ISCO 08"
la var isced				"ISCED"
la var tenure				"Jahre der Betriebszugehoerigkeit"
la var married				"Dummy = 1 if married"
la var bula					"Bundesland"
la var hhgr					"Haushaltsgroesse"
la var selfemp				"Selbststaendig"
la var ftime				"Dummy = 1 if full time employed"
la var branche				"NACE Klassifikation nach Rev. 2"
la var skill				"Skill groups"
la var nchild 				"Number of children in household"
la var dchild				"Dummy =1 if children in HH"
la var expft				"Years full-time experience"
la var exppt				"Years in part-time experience"
la var expue				"Years in unemployment"
la var sdeg					"Schulabschluss"
la var edeg					"Berufl. Bildungsabschluss"
la var udeg					"Hochschulabschluss"
la var ndeg					"Kein Berufsabschluss"
la var fdeg					"Berufsabschluss im Ausland"
la var kldb3				"3 digit KldB 2010"
la var kldb2				"2 digit KldB 2010"
la var kldb1				"1 digit KldB 2010"
la var fq					"Formale Qualfikation"
la var gleich				"Wahrscheinlichkeit gleichwertige Stelle zu erhalten"
la var erfjob				"Erforderliche Qualifikation (WA)"
la var degree				"Hochschulabschluss"
la var hdeg					"Hoechster erreichter Abschluss"
la var befr					"Dummy = 1 wenn befristeter Arbeitsvertrag"
la var reqwa				"Benoetigte Ausbildung (WA)"
la var achwa				"Erreichte Ausbildung (WA)"
la var fsize				"Firmengroesse (Personen)"
la var zufr					"Zufriedenhiet mit dem Job"

/* Auschluss von oberen und unteren 0,5% (Lohn) */
gen count = .
sort wage
replace count = _n
egen count2 = max(count)
gen percentile = count/count2
drop if percentile < 0.005
drop if percentile > 0.995

/* Ausschluss von nicht benoetigten Variablen */								
drop working_hours gwage ghwage achqual misqual erwerb count famstd 		///
 fq1 fq2 fq3 fq4 count2 percentile ysm agemig age89 pop netto hhnrakt 		///
 sampreg myeduc sdyeduc myeduc_isco sdyeduc_isco miswa

/* Aenderung des Formats KldB */
format kldb* %40.0g

/* Sortierung der Variablen */
order hhnr persnr ybirth year age sex bula migrant immiyear married nchild 	///
 dchild hhgr loc1989 whours rwhours isco isco1 kldb kldb1 label_kldb1 kldb2 ///
 label_kldb2 kldb3 branche skill isced wage lwage ftime yeduc sdeg edeg 	///
 udeg ndeg fdeg retired civserv selfemp erljob ausb tenure expft exppt 		///
 expue jobreq unja eqja ovja unrm* ovrm* eqrm*
 
compress
save "${DATA_DERIVED}soep_final.dta", replace
