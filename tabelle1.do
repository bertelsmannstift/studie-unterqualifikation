use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

replace unja = unja*100

reg unja [weight=phrf]

reg unja [weight=phrf] if sex == 1

reg unja [weight=phrf] if sex == 0

forvalues x = 2(1)5 {
reg unja [weight=phrf] if agecat2 == `x'
}

forvalues x = 2(1)5 {
reg unja [weight=phrf] if agecat2 == `x' & sex == 1
}

forvalues x = 2(1)5 {
reg unja [weight=phrf] if agecat2 == `x' & sex == 0
}
