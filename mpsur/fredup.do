set fredkey 

import delimited "https://raw.githubusercontent.com/paulbousquet/data/main/mpsur/mp1.csv", clear

gen daten = date(datestr, "YMD")
format daten %tdDDmonYY

tempfile mp1
save `mp1', replace

import delimited "https://www.federalreserve.gov/econres/notes/feds-notes/ebp_csv.csv", clear

gen daten = date(date, "YMD")
format daten %tdDDmonYY

drop date gz_spread est_prob
tsset daten 
drop if daten < td(01jan1987)

tempfile ebp
save `ebp', replace

import fred BBKMGDP UNRATE DFF GS1 INDPRO CPIAUCSL PCEPI UMCSENT NASDAQCOM EPUMONETARY, daterange(1987-01-01 2025-03-01) aggregate(monthly,eop) clear

merge 1:1 daten using `ebp', nogenerate

gen t = _n
tsset t, m

rename DFF ffr

merge 1:1 daten using `mp1', nogenerate

sort t

gen lip = log(INDPRO)
gen lcpi = log(CPIAUCSL)
gen lsent = log(UMCSENT)
gen lnas = log(NASDAQCOM)
gen lmpu = log(EPUMONETARY)
gen lpce = log(PCEPI)
gen zlb = (ffr < .25)
gen year = year(daten)

local logv lip lcpi lsent lnas lmpu lpce 
local allvar ffr ebp BBKMGDP UNRATE GS1 

*drop d*

foreach var of local logv {
    gen d`var' = 100 * D.`var'
    local allvar `allvar' d`var'
}

gen dunemp = D.UNRATE 
gen dgdp = D.BBKMGDP
gen debp = D.ebp 

local regvar 

local lagn = 12

foreach var of local allvar {
	local regvar `regvar' L(1/`lagn').`var'
}

reg mp1 `regvar' if possible==1 & year != 2020 & ffr>.25

save mondat.dta, replace 
