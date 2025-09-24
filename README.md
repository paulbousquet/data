# MP Surprise 
* `mp1.csv` is the main file. Originally I was working on something more comprehensive (see Johnathan Adams' [master file](https://github.com/jonathanjadams/structuralshocks))
* See also a [separate repo](https://github.com/paulbousquet/ADMonShock) for Miranda-Agrippino and Ricco (2021) and Aruoba and Drechsel (2025)
* [GSS (2005) WP version](https://www.federalreserve.gov/pubs/feds/2004/200466/200466pap.pdf) has shocks in table form by window length
* I also have a [repo](https://github.com/paulbousquet/SEPData) for pulling FOMC projection data which could be used to create a quarterly counterpart to Romer and Romer 
* `tv.ipynb` aggregates US [daily trading volume data](https://www.cboe.com/us/equities/market_statistics/historical_market_volume/)
* `mpreg.do` creates predicted values and residuals for trading volume on FOMC days

# Real Rates
* umich.csv shows the percent adjustment to the inflation rate based on the month over month percent change in annualized inflation expectations. When applied to a usuaul inflation rate (I use CPI) this creates a proxy for inflation expectatations.
    * this adjustment is because this survey has high central tendencies, in part due to survey respondants only reporting integer expectations 
    * Many studies use the survey of professional forecasters, but for settings in which we are trying to understand movements along a consumer dimension, this seems more appropriate 
    * The Fed's survey of consumer expectations has a better design but unfortunately did not begin until last decade (central tendencies are still too high anyway).
    * Using PCE does not match traditional estimates of real rates well
    * **Edit** The UMich survey is now even more problematic after the switch to online responses. Measuring real rates is hard! 
* irates.csv shows various interest rates on, including real rates using the above method
