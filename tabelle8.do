use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

tab haupttask, gen(task)

clonevar unja_n = unja 
replace unja_n = . if ovja == 1

recode hdeg (0 1 2 = 1) (3 = 2) (4 = 3) (5 6 7 = 4) (8 9 = 5), gen(fq_abi)

tab fq_abi, gen(fq)

tab fq_abi jobreq, row

bys unja_n: tab haupttask

forvalues k = 1(1)4 {
forvalues x = 1(1)5 {
foreach n of numlist 1 0 {
sum task`x' [weight=phrf] if unja_n == `n' & fq_abi == `k'
}
sum task`x' [weight=phrf] if fq_abi == `k'
}
}



