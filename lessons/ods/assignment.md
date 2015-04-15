---
title: "Assignment: SAS ODS"
author:
    - Luke Johnston
date: 2015-04-13
fontsize: 12pt
geometry: margin=1in
papersize: letterpaper
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - ODS
categories:
    - Lessons
    - ODS
---

To get better at using ODS, you need to practice it.  Try out these
exercises to get a sense of the power of ODS.

1. Try to create a simple table of some simple statistics (eg. means
   and standard deviation) *without* using ODS *or* exporting it.
2. Run a `proc` and determine which ODS object to output.
3. Extract the ODS object from the `proc`.
4. Create a simple table from the ODS object *without* customizing it
   using `data ...; set ...;` *or* exporting it.
5. Create a simple table from the ODS object, but customize how it
   looks by using a `data ...; set ...;` *and* export it into a 'csv'
   format.
6. Try to incorporate the ODS commands into a macro so that you can
   quickly analyze and output the results.
7. Lastly, try to do this on `proc` commands that you normally use in
   your analysis.
