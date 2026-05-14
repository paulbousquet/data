*! version 1.0.0  efflag.ado
*! efflag varname, lag(k)
*!   For a tsset (or xtset) dataset, generates varname_1, varname_2, ...,
*!   varname_k where varname_i at time t is the i-th most recent non-missing
*!   value of varname at times <= t (within panel, if panel is set).

program define efflag
    version 14
    syntax varname(numeric) , Lag(integer)

    // Require tsset/xtset
    capture quietly tsset
    if _rc {
        display as error "data must be tsset (or xtset) before using efflag"
        exit 459
    }
    local tvar `r(timevar)'
    local pvar `r(panelvar)'

    if `lag' < 1 {
        display as error "lag() must be a positive integer"
        exit 198
    }

    local var `varlist'

    // Refuse to overwrite existing variables
    forvalues i = 1/`lag' {
        capture confirm new variable `var'_`i'
        if _rc {
            display as error "variable `var'_`i' already exists"
            exit 110
        }
    }

    // Remember original observation order so we can restore it at the end
    tempvar origorder rnk
    quietly generate long `origorder' = _n

    // Sort and compute rank = cumulative count of non-missing values of var,
    // by panel if applicable.
    if "`pvar'" != "" {
        sort `pvar' `tvar'
        quietly by `pvar': generate long `rnk' = sum(!missing(`var'))
    }
    else {
        sort `tvar'
        quietly generate long `rnk' = sum(!missing(`var'))
    }

    // For each i, look up the value at (rnk - i + 1).
    forvalues i = 1/`lag' {
        tempvar lkup
        quietly generate long `lkup' = `rnk' - `i' + 1

        preserve
            quietly keep if !missing(`var')
            if "`pvar'" != "" {
                quietly keep `pvar' `rnk' `var'
            }
            else {
                quietly keep `rnk' `var'
            }
            quietly rename `rnk' `lkup'
            quietly rename `var' `var'_`i'
            tempfile lookup
            quietly save `lookup'
        restore

        if "`pvar'" != "" {
            quietly merge m:1 `pvar' `lkup' using `lookup', ///
                keep(master match) nogenerate
        }
        else {
            quietly merge m:1 `lkup' using `lookup', ///
                keep(master match) nogenerate
        }

        drop `lkup'
    }

    // Restore the original observation order and clean up
    sort `origorder'
    drop `origorder' `rnk'
end
