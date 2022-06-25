## Econometrics using R Markdown

### Introduction

Discussed the random sampling assumption and the conditional independence assumption (E(u|X) = 0), produced frequency tables and summary statistics tables, run t-tests comparing the difference in variables indicators, made regression lines between dummy variables and a Monte Carlo simulation among others.


### Required libraries

```markdown
library(gmodels)
library(tidyverse)
library(epiDisplay)
library(stargazer)
library(ggplot2)
library(haven) #to read_data
```

### Topics discused

````markdown
# STATISTICAL THEORY REVIEW
# LINEAR REGRESSION
1. with one regressor
2. with multiple regressors
# STATISTICAL INFERENCE
# MONTE CARLO SIMULATION & GRAPHICAL PRESENTATIONS
````


### Roadmap

````markdown
1.Obtain data source and answers to theoretical questions
                      ↓
2.Load data set and produce frequency tables
                      ↓
3.Regress variables, interpret them and graph them
                      ↓
4.Create a Monte Carlo Simulation
````
___


### References

Sources: dataset: “data_giulietti_etal.dta”, that quantifies the extent of racial discrimination in local public services in the U.S
