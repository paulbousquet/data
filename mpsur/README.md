mpsh.csv is a collection of the following established monetary policy shocks. The first five columns (described chronologically below) are thanks to [Miguel Acosta](https://www.acostamiguel.com/) who graciously made his data public. For more (and the most up to date) information, see his website
* ns are news shocks from [Nakamura and Steinsson (2018)](https://www.acostamiguel.com/). target and path are from [Gürkaynak, Sack and Swanson (2005)](https://www.ijcb.org/journal/ijcb05q2a2.pdf), where target denotes changes to current fed funds target and path are changes to the expected path of FFR over the next year
  * Both "have been scaled to have unit standard deviation and a positive correlation with the one-day change in the one-year treasury yield around the FOMC announcement"
  * Both are dependent on structural estimation (i.e., when the sample changes, the estimates change. a feature not a bug)
* ff.shock.0 is the 30 minute change in the expected (effective) funds rate
  * reported in percentage point terms (1 basis point => .01)
* rr are the updated [Romer and Romer (2004)](https://www.aeaweb.org/articles?id=10.1257/0002828042002651) narrative shocks
  * Calculated using the Fed's private forecasts, released to the public on a five year lag by law. So latest is 2018
  * Should be interpreted as "changes in the intended funds rate not taken in response to information about future economic developments"
  * Miguel has created a [GH repository](https://github.com/miguel-acosta/RomerRomer2004) showing his code for generating the data via scraping the Fed's website
* from [Jarociński and Karadi (2020)](https://www.aeaweb.org/articles?id=10.1257/mac.20180090)
* u1-u4 is the Fed's "unconventional policy shocks" from [Jarociński (2024)](https://www.sciencedirect.com/science/article/pii/S0304393224000011?via%3Dihub)
* uni is from [Bu, Rogers, and Wu (2021)](https://www.federalreserve.gov/econres/feds/a-unified-measure-of-fed-monetary-policy-shocks.htm) "A Unified Measure of Fed Monetary Policy Shocks"
* 
