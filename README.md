# MP Surprise 
* mpsur.csv is a collection of as many monetary policy surprise measures as I can get my hands on 
* tv.ipynb aggregates US [daily trading volume data](https://www.cboe.com/us/equities/market_statistics/historical_market_volume/)
* mpreg.do creates predicted values and residuals for trading volume on FOMC days
* See also a [separate repo](https://github.com/paulbousquet/ADMonShock) for Aruoba and Drechsel (2024)
* [GSS (2005) WP version](https://www.federalreserve.gov/pubs/feds/2004/200466/200466pap.pdf) has shocks in table form by window length

# Real Rates
* umich.csv shows the percent adjustment to the inflation rate based on the month over month percent change in annualized inflation expectations. When applied to a usuaul inflation rate (I use CPI) this creates a proxy for inflation expectatations.
    * this adjustment is because this survey has high central tendencies, in part due to survey respondants only reporting integer expectations 
    * Many studies use the survey of professional forecasters, but for settings in which we are trying to understand movements along a consumer dimension, this seems more appropriate 
    * The Fed's survey of consumer expectations has a better design but unfortunately did not begin until last decade (central tendencies are still too high anyway).
    * Using PCE does not match traditional estimates of real rates well
    * **Edit** The UMich survey is now even more problematic after the switch to online responses. Measuring real rates is hard! 
* irates.csv shows various interest rates on, including real rates using the above method
