use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

/*FQ1 Männer*/

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 1 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Männer in FQ1 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 1 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=0)
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Männer in FQ1 ist `b' Euro pro Stunde. SE: `se'"

/*FQ2 Männer*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 2 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Männer in FQ2 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 2 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=0)
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Männer in FQ2 ist `b' Euro pro Stunde. SE: `se'"

/*FQ3 Männer*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 3 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Männer in FQ3 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 3 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=0)
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Männer in FQ3 ist `b' Euro pro Stunde. SE: `se'"

/*FQ1 Frauen*/

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 1 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Frauen in FQ1 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 1 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=0)
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Frauen in FQ1 ist `b' Euro pro Stunde. SE: `se'"

/*FQ2 Frauen*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 2 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Frauen in FQ2 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 2 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=0)
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Frauen in FQ2 ist `b' Euro pro Stunde. SE: `se'"

/*FQ3 Frauen*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 3 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Frauen in FQ3 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if fq == 3 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=0)
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Frauen in FQ3 ist `b' Euro pro Stunde. SE: `se'"

