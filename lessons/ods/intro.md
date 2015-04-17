---
title: "Introduction: SAS ODS"
author:
    - Luke Johnston
date: 2015-04-09
fontsize: 12pt
geometry: margin=1in
papersize: letterpaper
layout: page
sidebar: false
tag:
    - Lessons
    - Introduction
    - ODS
categories:
    - Lessons
    - ODS
permalink: lessons/ods/
---

SAS is a system that prints a **lot** of output.  Sometimes this can
be good, however, in general you really only need some of the pieces
of the output.  This is why SAS has another system called Output
Delivery System, or ODS, to help with this.  The power of this becomes
especially apparent when you have created tables or other output and
suddenly need to change your analysis (for instance, you were able to
fill in some of the missing data in your dataset so need to run your
analysis again).  Instead of having to sift through all of the SAS
output and copy and paste to Excel or other spreadsheet, you can use
ODS to customize the output *exactly* into the format you need.  In
fact, this technique, known as
[reproducible research](http://en.wikipedia.org/wiki/Reproducibility#Reproducible_research),
is increasingly becoming more important and integral to the scientific
process.

To better appreciate how much time this can save you (especially when
combined with [SAS macros](../macros/)), ask yourself these questions:
Has your supervisor or committee ever suggested you change your
analysis a certain way?  Have you ever gotten new data and need to
update your tables?  Has a reviewer ever suggested a revision on your
manuscript that would require running your analysis again and updating
your numbers in your manuscript?  These are all reasons to learn how
to use ODS to save you time and reduce your stress.

Our goal for this workshop is to show you how to customize your SAS
output and convert it into a format that exactly or nearly mimics how
your table will look like.  Depending on the order of the workshops,
we will also integrate ODS into a macro to save you even *more* time.

# Learning objectives: #

After this workshop, our expectation is that you will be able to:

1. Understand *why* reproducible research is so important and *why*
   you should be using this technique in *all* your research analyses.
2. Identify the name of the relevant ODS object from a SAS `proc`.
3. Extract your desired ODS object.
4. Customize the data within the ODS object into a format that mimics
   or is the same as how your final table will look like.
5. Incorporate an ODS statement into a macro.

# Materials for this lesson: #

* [Slides](slides/)
* [Cheatsheet](cheatsheet/)
* [Assignment](assignment/)

Other resources can be found [here](../resources/).

