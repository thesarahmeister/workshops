---
title: "Assignment: Data wrangling in R"
published: true
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - Wrangling
    - R
categories:
    - Lessons
    - Wrangling
    - R
output: 
    md_document:
        variant: markdown_github
---

## Challenges: Try these out for yourself! ##

Try each of these challenges using only one continuous chain of `%>%` pipes,
from raw data to final output.

1. Make a new dataframe with the means of Agriculture, Examination, Education, and 
Infant.Mortality for each category of Fertility (hint: convert it into a factor
by values of >50 vs <50), when Catholic is less than 60 (hint, use `dplyr` commands
and `gather`).  Have the Fertility groups as two columns.

2. Do the same thing as above, but instead make a new dataframe with one column
with that contains the mean and standard deviation in this format: '00.00 (00.00
SD)'. Notice that there are two digits after the period.

3. Create a new dataframe with the first column containing the variable names,
the second column containing which county has the lowest value of the variable,
and a third column containing the county with the highest value of the variable.
For example, this is how it should approximately look like:


|Variable    |Lowest   |Highest    |
|:-----------|:--------|:----------|
|Fertility   |Moutier  |Courtelary |
|Agriculture |Delemont |Porrentruy |

### Creating plots (based on the last workshops material)

1. Create a point plot of the means of each variable (not the county).  Have the
variable on the y-axis and the means on the x-axis.  As a bonus/option, make the
graph prettier.

2. Expand on challenge 4, but split the means up by fertility (like in challenge
1).  The graph should have two dots for each variable representing the means for
each group of fertility.
