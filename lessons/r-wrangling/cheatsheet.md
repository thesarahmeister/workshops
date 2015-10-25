---
title: "Cheatsheet: Data wrangling in R"
published: true
author:
    - Luke W. Johnston
date: 2015-01
layout: page
sidebar: false
tag:
    - Lessons
    - Cheatsheet
    - Wrangling
    - R
categories:
    - Lessons
    - Wrangling
    - R
output: 
    md_document:
        variant: markdown_github
        toc: true
---



R is a statistical computing environment to analyze data and write programs. 
Getting the data into an analyzable form is the hardest part of an analysis. 
Here is a cheatsheet of useful and/or common commands.  For a more detailed
cheatsheet, [check out the resource page](../resources/).

# R data wrangling commands: Some useful or common ones #

## `write.csv` or `write.table` ##

> Save the R object or dataframe (aka. dataset) in a `.csv` file (comma
separated values).  Using `write.table`, you can export a number of different
file formats.

> Example code:


{% highlight r %}
## Export
write.csv(swiss, file = 'swiss.csv')

## Which is the same as:
write.table(swiss, file = 'swiss.csv', sep = ',')
{% endhighlight %}

## `read.csv` or `read.table` ##

> Similar to `write.table`.  Imports a file (eg. `csv`).

> Example code:


{% highlight r %}
write.csv(swiss, file = 'swiss.csv')
read.csv('swiss.csv')
{% endhighlight %}

## `head`, `names`, `str`, `summary` ##

> These four commands give you a brief overview of your dataframe or R object. 
`head` lets you see the first 6 rows. `names` lets you see the variable names in
the dataframe. `str` lets you see the structure of your R object/dataframe,
showing you what variables there are, and what the type is (eg. number, integer,
character, etc).  `summary` is very useful to get a quick overview of the mean,
median, frequency, and other basic statistics of each variable in the dataframe.

> Example code:


{% highlight r %}
head(swiss)
names(swiss)
str(swiss)
summary(swiss)
class(swiss)
{% endhighlight %}

## `%>%` ##

> The pipe function is a general purpose, extremely powerful tool for making
your code easier to read and quicker to type out.  It takes the output from the
left hand side and puts it into the right hand command.  The `.` command tells
the pipe to use the output from the left hand side, which you sometimes have to
do for some functions/commands (like `lm()`).

> Example code:


{% highlight r %}
library(dplyr)
## This is the package that the pipe comes from
library(magrittr) 

## These are the same
sum(1:10)
1:10 %>% sum

## These all do the same thing
head(swiss)
swiss %>% head
swiss %>% head()
swiss %>% head(.)
{% endhighlight %}

## `tbl_df` ##

> Sets the `tbl` attribute to the dataframe, which makes the printing of the
dataframe prettier.

> Example code:


{% highlight r %}
library(dplyr)
## These are the same
tbl_df(ds)
ds %>% tbl_df
ds %>% tbl_df()
ds %>% tbl_df(.)
{% endhighlight %}

## `select` ##

> Get only the columns/variables you want from a dataframe.  You can select
variables based on pattern or if it contains some letter.

> Example code:


{% highlight r %}
library(dplyr)
## These are the same
select(swiss, Education, Catholic, Fertility)
swiss %>% select(Education, Catholic, Fertility)
swiss %>% select(., Education, Catholic, Fertility)

## Exclude variable(s)
swiss %>% select(-Education, -Catholic)

## Select variables based on name or pattern
swiss %>% select(starts_with('E'), contains('Fert'), matches('mort'))
{% endhighlight %}

## `rename` ##

> Change the name of a variable/column.  The new name is on the left hand side,
so `newname = oldname`.  You can also rename using the `select` command, but it
will only select what variables you give it, while rename keeps the dataframe as
is, as it only renames.

> Example code:


{% highlight r %}
library(dplyr)
## These are the same
rename(swiss, edu = Education)
swiss %>% rename(edu = Education)

## Multiple renaming
swiss %>% rename(edu = Education, fert = Fertility)

## If you want to use select, but get the same functionality as rename, use the
## everything() function to select all other variables in the dataframe
swiss %>% select(edu = Education, everything())
{% endhighlight %}

## `filter` ##

> Subset a dataframe based on a condition of a variable. Filtering splits the
dataframe by the value of the row.  Common conditions include `<` less than, `>`
greater than, `==` equals, `>=` or `<=` greater/less than or equal to.

> Example code:


{% highlight r %}
library(dplyr)
## These are the same
filter(swiss, Catholic < 20, Examination == 15)
swiss %>% filter(Catholic < 20, Examination == 15)
swiss %>% filter(., Catholic < 20, Examination == 15)

## For string/factor variables
swiss %>% filter(X == 'Aigle')
{% endhighlight %}

## `mutate` ##

> Create a new column.  A command that may be used is the `ifelse()` function
that assigns a value based on the condition.

> Example code:


{% highlight r %}
library(dplyr)
## These are the same
mutate(swiss, Infertile = ifelse(Fertility < 50, 'yes', 'no'))
swiss %>% mutate(Infertile = ifelse(Fertility < 50, 'yes', 'no'))
swiss %>% mutate(., Infertile = ifelse(Fertility < 50, 'yes', 'no'))

## Or..
swiss %>% mutate(Test = 'yes', Number = 10)
{% endhighlight %}

## `arrange` ##

> Sort/order a dataframe by a variable.  Sort by the order of the variables
given (eg. `arrange(var1, var2)` sorts first by `var1` than by `var2`).

> Example code:


{% highlight r %}
library(dplyr)
## These are the same
arrange(swiss, Education, Examination)
swiss %>% arrange(Education, Examination)
swiss %>% arrange(., Education, Examination)

## Or to do it descending
swiss %>% arrange(desc(Education))
{% endhighlight %}

## `group_by` ##

> Assigns the attribute `grouped_df` to the dataframe, which on it's own does
nothing but when used in conjunction with `summarise` or `mutate` does the
following commands based on the grouping.

> Example code:


{% highlight r %}
library(dplyr)
swiss %>%
    mutate(EarlyDeath = ifelse(Infant.Mortality >= 50, 'yes', 'no')) %>%
    group_by(EarlyDeath)
{% endhighlight %}

## `summarise` ##

> Create a new column of values, usually using a descriptive statistic function
such as `mean()` or `median()`, as well as informational functions like `n()`
for sample size.  This function is best used with `group_by()`.

> Example code:


{% highlight r %}
library(dplyr)
swiss %>%
    mutate(Educated = ifelse(Education >= 50, 'yes', 'no')) %>%
    group_by(Educated) %>%
    str()
    summarise(mean = mean(Agriculture))
{% endhighlight %}


## `gather` ##

> Convert a wide dataframe to a long dataframe.  This creates a dataframe with
at least two new variables, one containing the names of the original variables
and the other containing the values of the variables.  You can include or
exclude certain variables by selecting the variable you want to include or
exclude (with a `-`) after the name of the two new variables.

> Example code:


{% highlight r %}
library(dplyr)
library(tidyr)
## These are the same
gather(swiss, Measure, Value)
swiss %>% gather(Measure, Value)
swiss %>% gather(., Measure, Value)

## Or exclude certain variables
swiss %>% add_rownames() %>% gather(Measure, Value, -rowname)

## Or include only some variables
swiss %>% gather(Measure, Value, Education, Fertility, Infant.Mortality)
{% endhighlight %}

## `spread` ##

> Does the opposite of `gather` by converting long dataframes to wide
dataframes.

> Example code:


{% highlight r %}
library(dplyr)
library(tidyr)
swiss %>% 
    add_rownames() %>% 
    gather(Measure, Value, -rowname) %>% 
    spread(Measure, Value)
{% endhighlight %}

# Combined example using (almost) all functions:


{% highlight r %}
swiss %>%
    add_rownames() %>% 
    tbl_df() %>% 
    filter(Infant.Mortality >= 15) %>% 
    mutate(Religious = ifelse(Catholic <= 50, 'no', 'yes')) %>% 
    select(Education, Agriculture, Examination, Religious) %>%
    gather(Measure, Value, -Religious) %>% 
    group_by(Measure, Religious) %>% 
    summarise(mean = mean(Value)) %>%
    spread(Measure, mean)
{% endhighlight %}

