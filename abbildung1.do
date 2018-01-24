use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

tab hdeg, gen(hdeg)

foreach n of numlist  1 2 3 4 5 6 7 8 9 10 {
reg unja [w=phrf] if hdeg`n' == 1
mat b=e(b)
local b`n' = b[1,1]
}




