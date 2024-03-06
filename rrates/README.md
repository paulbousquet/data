irates.csv contains (all data from FRED)
* dff -- effective funds rate
* dtb -- 3 month treasury yield
* CCrate -- (mean) credit card rate on interest paying accounts
* ffr -- real fed funds rate
* rcd -- real 3 month CD rate

Some notes on methodology 
* For a given month m, dff(m), dtb(m) are the rates on the last day of month m-1
* CCrate calculated from quarterly data using linear interpolation
* ffr and rcd are calculated with inflation expectations form UMich survey
  * hopefully at some point I will have code that calculates this automatically (and transparently) as data updates occurr. In the meantime, code available upon request 
