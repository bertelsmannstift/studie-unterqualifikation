use "${DATA_DERIVED}soep_final.dta", clear

clonevar unjan = unja
clonevar ovjan = ovja

replace unjan = . if fq == 1 & (jobreq == 3 | jobreq == 4)
replace unjan = . if fq == 2 & jobreq == 4

replace ovjan = . if fq == 3 & jobreq == 1
replace ovjan = . if fq == 4 & (jobreq == 1 | jobreq == 2)

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married i.unjan i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

forvalues x = 1(1)4 {
foreach n of numlist 1 0 {
reg lwage i.unjan i.ovjan ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == `x' & sex == `n', cluster(persnr)
}
}
