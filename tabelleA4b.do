use "${DATA_DERIVED}soep_final.dta", clear

clonevar unja_n = unja 
replace unja_n = . if ovja == 1

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

keep if sex == 1

recode married (1=0) (0=1), gen(single)
rename married married_old
rename single married

recode ftime (1=0) (0=1), gen(ptime)
rename ftime ftime_old
rename ptime ftime

forvalues k = 1(1)4 {
foreach x in tenure wage age yeduc sex married ftime expft dchild befr migrant {
reg `x' unja_n [aweight = phrf] if fq == `k'
sum `x' [weight=phrf] if unja_n == 1 & fq == `k'
sum `x' [weight=phrf] if unja_n == 0 & fq == `k'
}
}


