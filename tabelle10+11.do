use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

forvalues x = 2(1)4 {
foreach n of numlist 1 0 {
reg unja ///
c.tenure##c.tenure c.yeduc ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year if jobreq == `x' & sex == `n' ///
[pweight=phrf], cluster(persnr)

estpost margins, at((mean) _all) 
}
}


forvalues x = 1(1)3 {
foreach n of numlist 1 0 {
reg unja ///
c.tenure##c.tenure c.yeduc ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year if fq == `x' & sex == `n' ///
[pweight=phrf], cluster(persnr)

estpost margins, at((mean) _all) 

}
}
