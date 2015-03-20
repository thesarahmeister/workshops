---
title: "Presentation title"
date: Date in the YYYY-MM-DD
author: Luke & Daiva
classoption: xcolor=dvipsnames
output:
    beamer_presentation:
        slide_level: 1
header-includes:
    - \input{opt/slideOptions.tex}
    
---

# Welcome to our Data-related workshop #

## Purpose: ##

To teach a few tips and tricks for more efficiently managing your
data, tracking your computer files, understanding appropriate
analytical approaches, and speeding up the process from code to
tables.

. . .

## Significance: ##

Topics we cover will help you get more comfortable with data, reduce
the chance of overlooked errors, and give you more control over your
work. They are also all important parts of a science movement gaining
increasing attention -- Reproducible Research.

# Caveat: We aren't here to teach statistics #

Need help with stats? Use these resources!

* U of T Statistical Consulting Services ([click here](http://www.utstat.toronto.edu/wordpress/?page_id=25))

* <http://www.stackoverflow.com>

* <http://stats.stackexchange.com>

# Overview of other workshops? #

# Notes and help during this workshop #

Go to this website:

<https://etherpad.mozilla.org/dnsWorkshops>

# What is ODS #

* Output Delivery System

# Why use ODS #
* SAS outputs **A LOT** of data
* ODS will extract data/results you are *actually* interested in
* Cleaner output
* Easier to put into tables

# Steps to getting ODS work #
* ods trace on/off
 
# Examples #
* with and without ANOVA, proc univariate
* Proc means, make a variable for MeanSD (m (sd))
* Assumptions (diagnostics)

```
    Code text
```

Inline `code text`

Image:
![](/path/to/image)

Footnote[^1]

[^1]: Footnote text

# Live coding #

# Main Exercise #

* Create a table without ODS
* Create a table with ODS (w/o data wrangling)
* Create a table with ODS (w/ data wrangling)
* Proc univariate
* ANOVA
* Linear regression (betas of the exposure/outcome)
* Outputting to a csv/xls file
* Incorporate into macro (or use macros from last workshop)
