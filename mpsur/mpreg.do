clear all
//assume logs taken before import 
cd "C:\Users\pblit\Downloads"
import delimited "C:\Users\pblit\Downloads\dat.csv"
generate date = date(day, "YMD")
format date %td
gen year = year(date)
gen month = month(date)
tabulate year, generate(year_)
tabulate month, generate(month_)
gen day_of_week = dow(date)
tabulate day_of_week, generate(dow_)
gen day_of_month = day(date)
gen week_occurrence = .
tabulate day_of_month, generate(day_)
foreach dow in 1 2 3 4 5 {
    * For Fridays, will be dropped for collinearity every time 
    if `dow' == 5 {
        gen temp_date = cond(day_of_week == `dow', date - mod(day(date) - 1, 7), .)
        replace week_occurrence = 1 if day_of_week == `dow' & day(temp_date) > 0 & month(temp_date) == month(date) & year(temp_date) == year(date)
        drop temp_date
    }
    else {
        forvalues week = 1/5 {
            gen temp_date = cond(day_of_week == `dow', date - mod(day(date) - 1, 7) - 7 * (`week' - 1), .)
            replace week_occurrence = `week' if day_of_week == `dow' & day(temp_date) > 0 & month(temp_date) == month(date) & year(temp_date) == year(date)
            drop temp_date
        }
    }
}

gen day_week_combo = day_of_week * 10 + week_occurrence
//gen lt = log(totaltradecount)
gen lt = totaltradecount
//gen ls = log(totalshares)
gen ls = totalshares
reg lt dates1 i.year i.month i.day_of_month i.day_week_combo if marketparticipant=="NYSE"
predict ytNYSE
predict etNYSE, residuals 
reg ls dates1 i.year i.month i.day_of_month i.day_week_combo if marketparticipant=="NYSE"
predict ysNYSE
predict esNYSE, residuals 
reg lt dates1 i.year i.month i.day_of_month i.day_week_combo if marketparticipant=="NASDAQ"
predict ytNASDAQ
predict etNASDAQ, residuals 
reg ls dates1 i.year i.month i.day_of_month i.day_week_combo if marketparticipant=="NASDAQ"
predict ysNASDAQ
predict esNASDAQ, residuals 
gen export_flag1 = dates1 == 1 & marketparticipant=="NYSE"
//export delimited day lt ls marketparticipant ytNYSE etNYSE ysNYSE esNYSE if export_flag1 == 1 using Epredicted_values.csv, replace
gen export_flag2 = dates1 == 1 & marketparticipant=="NASDAQ"
//export delimited day lt ls marketparticipant ytNASDAQ etNASDAQ ysNASDAQ esNASDAQ if export_flag2 == 1 using Qpredicted_values.csv, replace
