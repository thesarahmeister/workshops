---
title: "Code as Manuscript: Practices for Reproducibility and Efficiency in SAS"
author:
    - Luke Johnston
    - Daiva Nielsen
date: 2015-06-15
geometry: margin=1in
fontsize: 12pt
papersize: letterpaper
layout: page
sidebar: false
tag:
    - GPS
    - SAS
    - Syllabus
categories:
    - GPS
    - SAS
    - Syllabus
---

## Course description: ##

This series of workshops aims to introduce students to the concept of
research reproducibility and to get the students practicing with using
version control systems and with using techniques in SAS that make the
analysis more efficient, less error prone, and less stressful.
Techniques for using version control systems to faciliate greater
collaboration among peers will also be presented.  The ultimate goal
of the workshops is to demonstrate how to reduce the total number of
steps required to produce a manuscript from the data analysis stage
(hence the name *Code As Manuscript*).  Given the applied nature of
the concepts in these workshops, hands-on activities and
[live coding](http://en.wikipedia.org/wiki/Live_coding) will be
integrated into each workshop.

## Goal: ##

The expected goal of the workshops is that you will be able to:

* Put your research under version control using Git.
* Push and pull your git research repository to either
  [GitHub](https://github.com/) or
  [BitBucket](https://bitbucket.org/).
* Simplify your SAS code by using macros and ODS facilities in a way
  that allows code to output results into a file that can be easily
  incorporated into a manuscript or report.
* To put the macros into either a macro file or as a SAS autocall
  library so that the macros are useable in all your SAS files.

Attaining these goals will the first steps in making an efficient and
highly productive workflow, that is also scientifically rigorous and
transparent, which you can take with you for the rest of your career.

## Schedule ##

Lesson content can be found [here]({{ site.github.url }}/lessons/).  The workshop will
follow the following sequence of topics:

1. Git: June 16th, 3:00-5:00pm
2. GitHub: June 23rd, 3:00-5:00pm
3. Macros: June 30th, 3:00-5:00pm
4. ODS: July 7th, 3:00-5:00pm

## Intended audience: ##

Graduate students or post-docs whose research involves a fair amount
of data analysis using SAS.

## Pre-requisites: ##

* Bring a fully charged laptop
* Install the appropriate software (see our
  [instructions page]({{ site.github.url }}/lessons/instructions/))
* Fairly competent in coding SAS commands.  *We are not here to teach
  an introduction to SAS*, we assume you are fairly competent with
  using SAS.  If you are a novice, recognize that you may not
  understand everything that is going on... *However*, you will still
  likely learn a lot!!
* Some familiarity with the command-line or with computing is
  desirable, but not necessary.

## Assignment: ##

Because of the hands-on nature of the workshops, in order to obtain a
GPS credit for the workshops you need to:

1. Come to all the workshops
2. Complete each workshop assignment

To hand in the assignment, you will need to:

1. Fork our shared workshop repository
2. Clone it to your computer
3. Create a new folder with your name
4. Put the assignments for each workshop in your new folder
5. Commit and push the assignments to your fork
6. Submit a pull request to the main shared repository

Don't worry if this doesn't make sense yet.  We will go over all these
details over the workshop series.

# Instructors #

Luke Johnston, MSc, PhD (c)  
luke.johnston@mail.utoronto.ca

Daiva Nielsen, PhD  
daiva.nielsen@mail.utoronto.ca
