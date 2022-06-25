## Example of Time Series

### Introduction

More than 10 exercises where the use of Time Series knowledge is required. I srtart testing for the presence of unit roots, reviewing the auotocorrelation function, estimating models to produce forecasts and, finally, generating a Vector Autoregression model and a set impulse response functions.


### Installation and load data set

```markdown
use sales.dta, // load the file sales.dta 

drop if sales==. // drop missing values: weekends, holidays etc 
rename t w //rename variable t as w (weeks) 

tsset w // tell stata to use weeks as the time index
```

### Topics discused

````markdown
# STATIONARITY
# TEST OF NON-STATIONARITY (DICKEY FULLER)
# AUTOCORRELATION FUNCTION
# INFORMATION CRITERION
# MODELS: AR, ARMA, VAR
````


### Roadmap

````markdown
1.Load data set and graph the time series 
                      ↓
2.Estimate the best lag lenght looking at ACF and the series
                      ↓
3.Estimate ARMA and VAR modelsand assess them using information criterion
                      ↓
4.Generate forecasts of the models with IRF
````
___


### References

"Time Series Analysis: Forecasting and Control", 5th Edition, George E. P. Box, Gwilym M. Jenkins, Gregory C. Reinsel, Greta M. Ljung

Sources: dataset: file sales.dta contains 157 weekly observations on sales revenues (sales) and advertising expenditure (adv) in millions of dollars for a large US department store for 2005-2007
