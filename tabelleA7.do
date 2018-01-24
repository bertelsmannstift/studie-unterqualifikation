use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

forvalues x = 2(1)4 {
foreach n of numlist 1 0 {
reg unja ///
c.tenure##c.tenure yeduc ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.sex i.migrant ///
i.bula i.year ///
[pweight=phrf] if jobreq == `x' & sex == `n', cluster(persnr)
}
}
