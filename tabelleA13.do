use "${DATA_DERIVED}soep_final.dta", clear

reg lwage c.tenure##c.tenure c.expft##c.expft i.ftime i.married yeduc i.unja i.befr i.bula i.year i.isco1 dchild i.fsize ///
[weight=phrf], cluster(persnr)
keep if e(sample)

/*AN2 Männer*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 2 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Männer in AN2 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 2 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=0) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Männer in AN2 ist `b' Euro pro Stunde. SE: `se'"

/*AN3 Männer*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 3 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Männer in AN3 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 3 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=0) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Männer in AN3 ist `b' Euro pro Stunde. SE: `se'"

/*AN4 Männer*/

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 4 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Männer in AN4 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 4 & sex == 1, cluster(persnr)

qui estpost margins, at((mean) _all unja=0) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Männer in AN4 ist `b' Euro pro Stunde. SE: `se'"

/*AN2 Frauen*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 2 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Frauen in AN2 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 2 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=0) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Frauen in AN2 ist `b' Euro pro Stunde. SE: `se'"

/*AN3 Frauen*/

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 3 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Frauen in AN3 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja i.ovja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 3 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=0) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Frauen in AN3 ist `b' Euro pro Stunde. SE: `se'"

/*AN4 Frauen*/

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 4 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=1) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für unterqualifizierte Frauen in AN4 ist `b' Euro pro Stunde. SE: `se'"

qui reg lwage i.unja ///
c.tenure##c.tenure ib1.ftime i.befr i.fsize i.isco1 ///
c.age##c.age i.dchild ib1.married i.migrant ///
i.bula i.year ///
[weight=phrf] if jobreq == 4 & sex == 0, cluster(persnr)

qui estpost margins, at((mean) _all unja=0) 
mat B = e(b)
mat V = e(V)
local b = round(exp(B[1,1]),.01)
local se = round(sqrt(V[1,1]),.0001)
display in red "Lohn für adäquat qualifizierte Frauen in AN4 ist `b' Euro pro Stunde. SE: `se'"

