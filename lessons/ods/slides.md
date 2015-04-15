---
title: "From code to tables: Reducing the number of steps in your
    analysis with SAS ODS"
author: Luke & Daiva
date: 2015-04-15
layout: page
sidebar: false
classoption: xcolor=dvipsnames
tag:
    - Lessons
    - Slides
    - ODS
categories:
    - Lessons
    - ODS
slide-level: 1
fontsize: 8pt
header-includes:
    - \input{../slideOptions.tex}
---

# Welcome to our Code As Manuscript workshop! #

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

# Caveat: We aren't here to teach statistics or SAS basics #

Need help with stats or SAS? Use these resources!

* U of T Statistical Consulting Services ([click here](http://www.utstat.toronto.edu/wordpress/?page_id=25))

* <http://stats.stackexchange.com>

* <http://www.stackoverflow.com>

* <http://support.sas.com/rnd/base/ods/>

* <http://www.ats.ucla.edu/stat/sas/faq/odsexample.htm>

# Notes and help during this workshop #

Go to this website:

<https://etherpad.mozilla.org/camWorkshops>

Ask questions in the chat, write down notes for others.

Go to our Code As Manuscript website for syllabus, slides, cheatsheet,
and others:

<codeasmanuscript.github.io/workshops/lessons/>

# What is ODS? #

* Output Delivery System
* SAS outputs **A LOT** of results
* ODS will extract results you are *actually* interested in
* Cleaner output
* Easier to re-run analyses with new data and quickly put into
  manuscript (ie: in tables)
* Helps with making your research *reproducible*
* Keeps you saner and less stressed!

# Quick aside: What is reproducible research? #

* <http://en.wikipedia.org/wiki/Reproducibility#Reproducible_research>
* <http://biostatistics.oxfordjournals.org/content/10/3/405.full>
* <http://lcav.epfl.ch/reproducible_research/>

Basically: For any given research project, have the code that can
easily 'reproduce' the results that are presented in the manuscript.

ODS can help make this more of a reality.

# Identifying the ODS object to use #

    ods trace on;
    ...
    ods trace off;

(Switch to live coding)
 
# Using the ODS object #

    ods output <object-name> = <dataset-name>;

(Switch to live coding)

