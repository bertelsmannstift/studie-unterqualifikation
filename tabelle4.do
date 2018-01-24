use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

tab reqwa, gen(an)

tab achwa, gen(fq)

tab fq jobreq, row


tab unja unwa [aw=phrf], col 
/*21.77% der nach JA unterqualifizierten fühlen sich auch nach WA unterqualifiziert*/ //Kommentar hab ich erstmal stehen lassen, kann aber vermutlich weg?


forvalues x = 1(1)3 {
forvalues k = 1(1)3 {
sum an`k' [weight=phrf] if fq`x' == 1
count if an`k' == 1 & fq`x' == 1
}
}



