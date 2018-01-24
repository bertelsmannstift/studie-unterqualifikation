use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

tab jobreq, gen(an)

recode hdeg (0 1 2 = 1) (3 = 2) (4 = 3) (5 6 7 = 4) (8 9 = 5), gen(fq_abi)

tab fq, gen(fq)

tab fq jobreq, row

gen wamis = 1 if unwa == . | ovwa == . | eqwa == . 

forvalues x = 1(1)4 {
forvalues k = 1(1)4 {
sum an`k' [weight=phrf] if fq`x' == 1
count if an`k' == 1 & fq`x' == 1 & wamis != 1
}
}

forvalues x = 1(1)4{
count if an`x' == 1 & fq`x' == 1 & eqwa == 1 & wamis != 1
display `m`x'`x''
}
count if an1==1 & fq2==1 & ovwa==1 & wamis != 1
count if an1==1 & fq3==1 & ovwa==1 & wamis != 1
count if an1==1 & fq4==1 & ovwa==1 & wamis != 1

count if an2==1 & fq1==1 & unwa==1 & wamis != 1
count if an2==1 & fq3==1 & ovwa==1 & wamis != 1
count if an2==1 & fq4==1 & ovwa==1 & wamis != 1

count if an3==1 & fq1==1 & unwa==1 & wamis != 1
count if an3==1 & fq2==1 & unwa==1 & wamis != 1
count if an3==1 & fq4==1 & ovwa==1 & wamis != 1

count if an4==1 & fq1==1 & unwa==1 & wamis != 1
count if an4==1 & fq2==1 & unwa==1 & wamis != 1
count if an4==1 & fq3==1 & unwa==1 & wamis != 1
