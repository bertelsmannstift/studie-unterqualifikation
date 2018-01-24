use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

tab jobreq, gen(an)

recode hdeg (0 1 2 = 1) (3 = 2) (4 = 3) (5 6 7 = 4) (8 9 = 5), gen(fq_abi)

tab fq_abi, gen(fq)

tab fq_abi jobreq, row

forvalues x = 1(1)5 {
forvalues k = 1(1)4 {
sum an`k' [weight=phrf] if fq`x' == 1
count if an`k' == 1 & fq`x' == 1
}
}

/* Hochrechnung */
tab fq_abi jobreq[w=round(phrf)], row
