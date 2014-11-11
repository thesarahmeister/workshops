---
title: "Know your data and how to handle it correctly: statistical assumptions"
date: 2015-01-09
author: Daiva & Luke
classoption: xcolor=dvipsnames
output:
    beamer_presentation:
        slide_level: 1
header-includes:
    - \input{opt/slideOptions.tex}
    
---

# Welcome to our Statistical Assumptions workshop #

## Purpose: ##

To teach the statistical assumptions of linear regression and show how you test data to see if they satisfy the assumptions. Knowing how to check these assumptions is part of "best practices" in data analysis. 

## Significance: ##

It is very important to check that your data satisfies linear regression assumptions. If your data does not meet these criteria, the use of linear regression is inappropriate. Other methods can be used, but...


# Caveat (again): We aren't here to teach statistics #

Need help with stats? Use these resources!

* U of T Statistical Consulting Services ([click here](http://www.utstat.toronto.edu/wordpress/?page_id=25))

* <http://www.stackoverflow.com>

* <http://stats.stackexchange.com>

* Helpful statistical tests flowchart (PDF on GitHub)

* Very helpful webpage on regression diagnostics: http://www.ats.ucla.edu/stat/sas/webbooks/reg/chapter2/sasreg2.htm
(Note: Goes into much more detail than what is covered in this workshop)


# Notes and help during this workshop #

Go to this website:

<https://etherpad.mozilla.org/dnsWorkshops>


# Linear Regression #

* Used to test associations between independent and dependent variables

* Based on a linear relationship: y = mx + b

* y = dependent variable(s), m = slope, x = independent variable, b = error terms (covariates)


# Some Linear Regression Assumptions #

* Model is good (i.e. linear relationship between predictors and outcome variable)

* Residuals have a normal distribution

* Residuals are homoscadastic (have equal/constant variance)

* Footnote? Residual = observed - expected = error


# Brief aside: assumptions/diagnostics we are not covering in this workshop #

* Independence (residuals of one observation are not associated with residuals of another)

* Errors in variables (predictor variables are measured without error)

* Influence (i.e. outliers)

* Collinearity (predictors that are linearly related -- affects estimate of regression coefficients)

* Very helpful webpage on regression diagnostics that covers these: http://www.ats.ucla.edu/stat/sas/webbooks/reg/chapter2/sasreg2.htm


# How to check assumptions #

* Model fit: Plot residuals vs. predicted fit (check pattern)

* Distribution of residuals: Normal probability plot

* Variance of residuals: Plot residuals vs. predicted fit (check spread of points)


# Model fit #

SAS code

model y= x1 x2

\includegraphics[width=\textwidth]{img/modelFit.jpeg}


# Residual distribution #

SAS code

proc glm data=codeasmanuscript
	model y = x1 

	output out = mydata.resid1
	predicted=fit residual=resid;
run;

symbol1 value=circle h=1;
proc gplot data=mydata.resid.1;
plot x*fit/;

title 'predicted vs. actual plot'
run;

\includegraphics[width=\textwidth]{img/residNorm.jpeg}


# Residual variance #

Sas code
\includegraphics[width=\textwidth]{img/residVar.jpeg}


# What do you do if your data does not meet this assumptions? #

* Try transforming the data (log, square root)

* Use a non-parametric statistical test if can not obtain normal distribution of residuals after attempting a transformation


# Main Exercise #

* Download the Statistical Tests Flowchart from GitHub (.pdf)
* Download datafile1 (.csv) from GitHub
* Perform assumptions check using your statistical analysis software
* Write a report summary of results (text file) for this datafile and conclude whether or not linear regression is appropriate for this data.
* Push your report summary to the GitHub
* Download datafile2 (.csv) from GitHub
* Perform assumptions check using your statistical analysis software
* Write a report summary of results (text file) for this datafile and conclude whether or not linear regression is appropriate for this data.
* Push your report summary to the GitHub

