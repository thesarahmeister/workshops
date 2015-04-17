---
title: "Presentation title"
date: Date in the YYYY-MM-DD
author: Luke & Daiva
classoption: xcolor=dvipsnames
output:
    beamer_presentation:
        slide_level: 1
header-includes:
    - \input{../slideOptions.tex}
    
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
* ODS
* Code review club

# Notes and help during this workshop #

Go to this website:

<https://etherpad.mozilla.org/dnsWorkshops>

# Slide title #

Text, some **bolded**, or *italics*

[URL link here](http://link/here.com)

```
    Code text
```

Inline `code text`

Image:
![](/path/to/image)

Footnote[^1]

[^1]: Footnote text

# What is a macro? #

# Steps to making a macro? #

# Live coding #

# Not using a macro #

Want to test association between caffeine intake and a number of genetic variants (CYP1A2, ADORA2A, DRD2, 5HT2RA):

	proc glm data=genes;
		class CYP1A2 sex smoke;
		model caff = CYP1A2 BMI sex smoke;
		lsmeans/ stderr;
	run;

	proc glm data=genes;
		class ADORA2A sex smoke;
		model caff = ADORA2A BMI sex smoke;
		lsmeans/ stderr;
	run;

	proc glm data=genes;
		class DRD2 sex smoke;
		model caff = DRD2 BMI sex smoke;
		lsmeans/ stderr;
	run;

	proc glm data=genes;
		class 5HT2RA sex smoke;
		model caff = 5HT2RA BMI sex smoke;
		lsmeans/ stderr;
	run;

# Why is that undesirable? #

# Using a macro-variable #

Want to test association between caffeine intake and a number of genetic variants (CYP1A2, ADORA2A, DRD2, 5HT2RA):

	%let gene = CYP1A2 ADORA2A DRD2 5HT2RA;
	proc glm data=genes;
		class &gene sex smoke;
		model caff = &gene BMI sex smoke;
		lsmeans/ stderr;
	run;

# Using a macro #

	%macro glm (predictors, class);
    proc glm data=&data ;
            class &class;
            model caff &predictors;
            lsmeans/ stderr;
            run;
	%mend glm;

	%glm(data= ,
    class = ,
	predictors = CYP1A2 ADORA2A DRD2 5HT2RA);

# Main Exercise #

* Work in pairs
* Make bad code
* Push to Github
* Pull partner's bad code
* Fix it together by making a macro
* Push to Github

# Thanks!#

* Next time: Combining macros with ODS = power!
