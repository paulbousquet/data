Last updated 3/15/24

irates.csv contains (all data from FRED)
* dff -- effective funds rate
* dtb -- 3 month treasury yield
* CCrate -- (mean) credit card rate on interest paying accounts, seasonally adjusted 
* ffr -- real fed funds rate
* rcd -- real 3 month CD rate
* gsr -- gross deposit rate
* rsr -- real deposit rate 

Some notes on methodology 
* For a given month m, dff(m), dtb(m) are the rates on the last day of month m-1
* CCrate and deposit rates calculated from quarterly data using linear interpolation
* real rates are calculated with inflation expectations form UMich survey. For description, see previous page
  * I played around with lots of inflation metrics and settled on a weighted average of CPIs-- .5 to full, .3 to core, and .2 to sticky. Use umich.csv to use different measures.  
  * hopefully at some point I will have code that calculates this automatically (and transparently) as data updates occurr. In the meantime, code available upon request 

One additional note on umich.csv (most details on last page)
* the median is typically better than the mean for UMich, with a notable exception being post 9/11
* For now, have imputed post 9/11 months with mean. Want to think of a less ad hoc way to account for it 
