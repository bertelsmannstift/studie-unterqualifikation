/* Pfad */														
global MY_IN_PATH   "...\data_source/"
global MY_OUT_PATH  "...\data_derived/"
global MY_TEMP_PATH "...\temp/"

global MY_OUT_FILE  ${MY_OUT_PATH}soep_pulled.dta

set more off

/* PPFAD ziehen */
use    hhnr persnr sex gebjahr psample 		///
       bdhhnr behhnr bfhhnr bghhnr			///
       bdnetto benetto bfnetto bgnetto 		/// 
       bdpop bepop bfpop bgpop 				///
       germborn bdsampreg besampreg 		///
	   bfsampreg bgsampreg immiyear loc1989 ///
using  "${MY_IN_PATH}ppfad.dta", clear

/* Ausgeglichenes/unausgeglichenes Design */
keep if ( ( bdnetto > 0 & bdnetto < 40 ) | ( benetto > 0 & benetto < 40 ) |	///
 ( bfnetto > 0 & bfnetto < 40 ) | ( bgnetto > 0 & bgnetto < 40 ) )

/* Nur private Haushalte */
keep if ( ( bdpop == 1 | bdpop == 2 ) | ( bepop == 1 | bepop == 2 ) | 		///
 ( bfpop == 1 | bfpop == 2 ) | ( bgpop == 1 | bgpop == 2 ) )
 
/* PPFAD sortieren */
sort persnr
save "${MY_TEMP_PATH}ppfad.dta", replace

/* PHRF ziehen */
use    hhnr persnr prgroup 					///
       bdphrf bephrf bfphrf bgphrf  		///	
using  "${MY_IN_PATH}phrf.dta", clear

sort  persnr
save  "${MY_TEMP_PATH}phrf.dta", replace

/* HHRF ziehen */
use    hhnr hhnrakt 						///
       bdhhrf  behhrf bfhhrf bghhrf  		///
using  "${MY_IN_PATH}hhrf.dta", clear

clonevar bdhhnr = hhnrakt
clonevar behhnr = hhnrakt
clonevar bfhhnr = hhnrakt
clonevar bghhnr = hhnrakt

sort hhnr hhnrakt
drop hhnrakt

save  "${MY_TEMP_PATH}hhrf.dta", replace

/* pmaster erzeugen */
use    "${MY_TEMP_PATH}ppfad.dta", clear

merge 1:1 persnr using  "${MY_TEMP_PATH}phrf.dta"

drop   if _merge == 2
drop   _merge

merge m:1 hhnr bdhhnr behhnr bfhhnr bghhnr using "${MY_TEMP_PATH}hhrf.dta"

drop   if _merge == 2
drop   _merge

erase  "${MY_TEMP_PATH}ppfad.dta"
erase  "${MY_TEMP_PATH}phrf.dta"
sort   persnr
save   "${MY_TEMP_PATH}pmaster.dta", replace

/* bdp ziehen */
use    hhnr bdhhnr persnr hhnrakt 		///
       bdp38_kldb2010 bdp6501 bdp66		///
	   bdp18 bdp7701 bdp42_nace bdp55	///
	   bdp40 bdp39 bdp49 bdp43 bdp0103 	///
using "${MY_IN_PATH}bdp.dta", clear

sort persnr
save "${MY_TEMP_PATH}bdp.dta", replace

/* bep ziehen */
use    hhnr behhnr persnr 				///
	   bep4701 bep48 bep12 bep5701 		///
       hhnrakt bep28_kldb2010 			///
	   bep32_nace bep40 bep30 bep29 	///
	   bep38 bep33 bep0103 				///
using "${MY_IN_PATH}bep.dta", clear

sort persnr
save "${MY_TEMP_PATH}bep.dta", replace

/* bfp ziehen */
use    hhnr bfhhnr persnr				/// 
	   bfp8101 bfp82 bfp32 bfp10201   	///
       hhnrakt bfp52_kldb2010 			///
	   bfp55_nace bfp71 bfp54 bfp53 	///
	   bfp61 bfp56 bfp0103 				///
using "${MY_IN_PATH}bfp.dta", clear

sort persnr
save "${MY_TEMP_PATH}bfp.dta", replace

/* Chance gleichwertige Stelle zu finden (bfp71) ist in den neuen Daten nicht mehr drin */
/* bgp ziehen */
use	   hhnr bghhnr persnr 				///
	   bgp6901 bgp70 bgp31 bgp8101 		///
	   hhnrakt bgp48_kldb2010 			///
	   bgp52_nace bgp50 bgp49 			///
	   bgp57 bgp62 bgp0103 				///
using "${MY_IN_PATH}bgp.dta", clear

sort persnr
save "${MY_TEMP_PATH}bgp.dta", replace

/* bdpgen ziehen */
use    hhnr bdhhnr persnr bdfamstd 		///
	   stib13 ausb13 isced11_13 		///
	   isco08_13 hhnrakt kldb2010_13 	///
	   bdbilzeit bdpbbila bdpbbil01 	///
	   bdpbbil02 bdpbbil03 erljob13 	///
	   bdpsbil bderwzeit exppt13 		///
	   expft13 expue13 degree13 		///
using "${MY_IN_PATH}bdpgen.dta", clear

sort persnr
save "${MY_TEMP_PATH}bdpgen.dta", replace

/* bepgen ziehen */
use    hhnr behhnr persnr befamstd 		///
	   stib14 ausb14 isced11_14 		///
	   isco08_14 hhnrakt kldb2010_14 	///
	   bebilzeit bepbbila bepbbil01 	///
	   bepbbil02 bepbbil03 erljob14 	///
	   bepsbil beerwzeit exppt14 		///
	   expft14 expue14 degree14 		///
using "${MY_IN_PATH}bepgen.dta", clear

sort persnr
save "${MY_TEMP_PATH}bepgen.dta", replace

/* bfpgen ziehen */
use    hhnr bfhhnr persnr bffamstd 		///
	   stib15 ausb15 isced11_15 		///
	   isco08_15 hhnrakt kldb2010_15 	///
	   bfbilzeit bfpbbila bfpbbil01 	///
	   bfpbbil02 bfpbbil03 erljob15 	///
	   bfpsbil bferwzeit exppt15 		///
	   expft15 expue15 degree15 		///
using "${MY_IN_PATH}bfpgen.dta", clear

sort persnr
save "${MY_TEMP_PATH}bfpgen.dta", replace

/* bgpgen ziehen */
use    hhnr bghhnr persnr bgfamstd 		///
	   stib16 ausb16 isced11_16 		///
	   isco08_16 hhnrakt kldb2010_16 	///
	   bgbilzeit bgpbbila bgpbbil01 	///
	   bgpbbil02 bgpbbil03 erljob16 	///
	   bgpsbil bgerwzeit exppt16 		///
	   expft16 expue16 degree16 		///
using "${MY_IN_PATH}bgpgen.dta", clear

sort persnr
save "${MY_TEMP_PATH}bgpgen", replace 

/* bdhbrutto ziehen */
use    hhnr bdhhnr bdhhgr bdbula 		///
using "${MY_IN_PATH}bdhbrutto.dta", clear

sort bdhhnr
save "${MY_TEMP_PATH}bdhbrutto.dta", replace

/* behbrutto ziehen */
use    hhnr behhnr behhgr bebula 		///
using "${MY_IN_PATH}behbrutto.dta", clear

sort behhnr
save "${MY_TEMP_PATH}behbrutto.dta", replace

/* bfhbrutto ziehen */
use    hhnr bfhhnr bfhhgr bfbula 		///
using "${MY_IN_PATH}bfhbrutto.dta", clear

sort bfhhnr
save "${MY_TEMP_PATH}bfhbrutto.dta", replace

/* bghbrutto ziehen */
use hhnr bghhnr bghhgr bgbula			///
using "${MY_IN_PATH}bghbrutto.dta", clear

sort bghhnr
save "${MY_TEMP_PATH}bghbrutto.dta", replace

/* bdkind ziehen */
use    hhnr bdhhnr persnr bdkzahl 		///
using "${MY_IN_PATH}bdkind.dta", clear

sort bdhhnr
drop if bdhhnr == bdhhnr[_n-1]
save "${MY_TEMP_PATH}bdkind.dta", replace

/* bekind ziehen */
use    hhnr behhnr persnr bekzahl 		///
using "${MY_IN_PATH}bekind.dta", clear

sort behhnr
drop if behhnr == behhnr[_n-1]
save "${MY_TEMP_PATH}bekind.dta", replace

/* bfkind ziehen */
use    hhnr bfhhnr persnr bfkzahl 		///
using "${MY_IN_PATH}bfkind.dta", clear

sort bfhhnr
drop if bfhhnr == bfhhnr[_n-1]
save "${MY_TEMP_PATH}bfkind.dta", replace

/* bfgind ziehen */
use hhnr bghhnr persnr bgkzahl 			///
using "${MY_IN_PATH}bgkind.dta", clear

sort bghhnr
drop if bghhnr == bghhnr[_n-1]
save "${MY_TEMP_PATH}bgkind.dta", replace

/* Alle Datensaetze mergen */
use   "${MY_TEMP_PATH}pmaster.dta", clear
erase "${MY_TEMP_PATH}pmaster.dta"

/* Ueber Personen mergen: alle Wellen */

/* merge BDP */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bdp.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bdp.dta"

/* merge BEP */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bep.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bep.dta"

/* merge BFP */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bfp.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bfp.dta"

/* merge BGP */

sort persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bgp.dta"
drop if _merge == 2
drop _merge
erase "${MY_TEMP_PATH}bgp.dta"

/* merge BDPGEN */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bdpgen.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bdpgen.dta"

/* merge BEPGEN */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bepgen.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bepgen.dta"

/* merge BFPGEN */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bfpgen.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bfpgen.dta"

/* merge BGPGEN */
          
sort  persnr
merge 1:1 persnr using "${MY_TEMP_PATH}bgpgen.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bgpgen.dta"

/* Ueber Haushalte mergen: alle Wellen */
/* merge BDHBRUTTO */

merge m:1 bdhhnr using "${MY_TEMP_PATH}bdhbrutto.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bdhbrutto.dta"

/* merge BEHBRUTTO */

merge m:1 behhnr using "${MY_TEMP_PATH}behbrutto.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}behbrutto.dta"

/* merge BFHBRUTTO */

merge m:1 bfhhnr using "${MY_TEMP_PATH}bfhbrutto.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bfhbrutto.dta"

/* merge BGHBRUTTO */

merge m:1 bghhnr using "${MY_TEMP_PATH}bghbrutto.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bghbrutto.dta"

/* merge BDKIND */

merge m:1 bdhhnr using "${MY_TEMP_PATH}bdkind.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bdkind.dta"

/* merge BEKIND */

merge m:1 behhnr using "${MY_TEMP_PATH}bekind.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bekind.dta"

/* merge BFKIND */

merge m:1 bfhhnr using "${MY_TEMP_PATH}bfkind.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bfkind.dta"

/* merge BGKIND */

merge m:1 bghhnr using "${MY_TEMP_PATH}bgkind.dta"
drop   if _merge == 2
drop   _merge
erase "${MY_TEMP_PATH}bgkind.dta"

/* Fertig! */

label data "Daten fuer Bertelsmann Studie"
save  "${MY_OUT_FILE}", replace
