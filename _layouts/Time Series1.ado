*EXERCISE a)
global home= "$root\Users\ivvan\Desktop\Stata\Users\ivvan\Desktop\Stata"

cd "$home"  // the path to whatever directory the datafile is in

use sales.dta, // load the file sales.dta 

drop if sales==. // drop missing values: weekends, holidays etc but in that case isn't necessary
rename t w //rename variable t as w (weeks) 

tsset w // tell stata to use weeks as the time index

tsline sales // graph time series of sales
graph export "./output/sales.pdf", replace //export anc convert to PDF

*EXERCISE b)
gen lnsales=ln(sales) #log of sales
label variable lnsales "log of sales revenues"
dfuller lnsales, regress notrend // ADF test notrend

*EXERCISE c)
gen c=D.lnsales // the log difference in sales revenues
label variable lnsales "log of sales "
label variable c "Weekly changes in Sales"
corrgram c, lags(155) //to show easier how ACF behaves
ac c, name(ac,replace) lags(155) //ACF
pac c, name(pac,replace) lags(75) //PACF
graph combine ac pac //Combine both ACF and PACF in a graph
arima c, ma(1) nolog
estat ic
arima c, ar(1) nolog
estat ic
arima c, ma(1) ar(1) nolog
estat ic
//to see which one of the 3 models suits better based in BIC

*EXERCISE d)
// MA(1) model
arima c, ma(1)
// AR(1) model
arima c, ar(1)
// ARMA(1) model
arima c, ma(1) ar(1)

*EXERCISE e)
// box jenkins approach
arima c, ma(1) ar(1)
estat ic
arima c, ma(1) ar(10)
estat ic
arima c, ma(1) ar(5) 
estat ic
//comparing different models

*EXERCISE f)
arima c if w<101, ma(1) ar(1)

*EXERCISE g)
arima sales if w<101, ma(1) ar(1)
predict saleshat, xb   
label variable saleshat "Forecast sales revenues with AR"

predict mse, mse
gen upper=saleshat+1.96*(mse^0.5) 
gen lower=saleshat-1.96*(mse^0.5)//error bands 95%
label variable mse mean_squared_error
label variable upper upper_error_band
label variable lower lower_error_band

tsline sales saleshat upper lower if w>100 //graph forecast vs actual values


*EXERCISE h)
gen lnadv=ln(adv) // generate log of advertising expenses
varsoc lnsales lnadv //to look at the best lag lenght
var lnsales lnadv, lags(1)

*EXERCISE i)
var lnsales lnadv, lags(1)
vargranger //to produce granger causation

*EXERCISE j)
var lnsales lnadv, lags(1)
irf create irf_, set(".test",replace) replace // create irf
irf graph irf, name(irf_,replace) // graph it and name the graph

*EXERCISE k)
var sales adv, lags(1)
vargranger
predict salesvar, eq(sales)
predict msevar, eq(sales) stdp
gen upper1=salesvar+1.96*(msevar^0.5) 
gen lower1=salesvar-1.96*(msevar^0.5)
label variable salesvar "Forecast sales revenues with VAR"
tsline salesvar saleshat sales if w>100 //I don't graph error bands to see better the comparison between forescasts
