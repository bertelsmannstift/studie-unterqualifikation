use "${DATA_DERIVED}soep_final.dta", clear

clonevar unja_n = unja 
replace unja_n = . if ovja == 1

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

clonevar gleichn = gleich
replace gleichn = 2 if gleichn == 3

tab gleichn, gen(gleich)

forvalues z = 1(1)4 {
forvalues k = 1(1)2 {
foreach n of numlist 1 0 {
sum gleich`k' [aw=phrf] if unja_n == `n' & jobreq == `z'
}
}
}
