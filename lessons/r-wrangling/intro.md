---
title: "Introduction: Data wrangling in R"
published: true
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Introduction
    - Wrangling
    - R
categories:
    - Lessons
    - Wrangling
    - R
permalink: lessons/r-wrangling/
output: 
    md_document:
        variant: markdown_github
        toc: true
---

R was developed by statisticians to do statistical work.  As such, embedded
within R are capabilities to easily wrangle and manage data, to have data in a
format that can be used for further data analysis, and to work data set type
objects (called dataframes in R).  There are also excellent packages available
to make data wrangling much easier in R.  These packages are `dplyr` and `tidyr`
packages.  A minor assumption: the data you are importing/using is fairly clean
(as in, no large amount of missing values, no data entry errors or fixes needed,
etc).

# Learning objectives:

1. How to import/export your data
2. How to view the structure of your data
3. How to wrangle data into an analyzable format

# Materials for this lesson:

- [Slides](slides/)
- [Cheatsheet](cheatsheet/)
- [Assignment](assignment/)

Other resources can be found [here](../resources/).

# Let's get wrangling, the basics

## Import/export your data

You'll need to import your data into R to analyze it.  We'll assume the data is
already cleaned and ready for analysis.  If at any time you need help with a
command, use the `?` command along with the command you need help with (eg. 
`?write.csv`).  R comes with many internal datasets that you can practice on. 
The one I'm going to use is the `swiss` dataset.


{% highlight r %}
## Export/save to file
write.csv(swiss, file = 'swiss.csv')
## Import/read from file
ds <- read.csv('swiss.csv')
{% endhighlight %}

## Viewing your data

R has several very useful tools for quickly viewing your data.  `head()` shows 
the first few rows of a dataframe (a structure for storing data that can include
numbers, integers, factors, strings, etc).  `names()` shows the column names. 
`str()` shows the structure, such as what the object is, and its contents (ie.
column names and types).  `summary()` shows a quick description of the summary
statistics (means, median, frequency) for each of your columns.


{% highlight r %}
head(ds)
{% endhighlight %}



{% highlight text %}
##              X Fertility Agriculture Examination Education Catholic
## 1   Courtelary      80.2        17.0          15        12     9.96
## 2     Delemont      83.1        45.1           6         9    84.84
## 3 Franches-Mnt      92.5        39.7           5         5    93.40
## 4      Moutier      85.8        36.5          12         7    33.77
## 5   Neuveville      76.9        43.5          17        15     5.16
## 6   Porrentruy      76.1        35.3           9         7    90.57
##   Infant.Mortality
## 1             22.2
## 2             22.2
## 3             20.2
## 4             20.3
## 5             20.6
## 6             26.6
{% endhighlight %}



{% highlight r %}
names(ds)
{% endhighlight %}



{% highlight text %}
## [1] "X"                "Fertility"        "Agriculture"     
## [4] "Examination"      "Education"        "Catholic"        
## [7] "Infant.Mortality"
{% endhighlight %}



{% highlight r %}
str(ds)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	47 obs. of  7 variables:
##  $ X               : Factor w/ 47 levels "Aigle","Aubonne",..: 8 9 12 26 28 34 5 13 15 38 ...
##  $ Fertility       : num  80.2 83.1 92.5 85.8 76.9 76.1 83.8 92.4 82.4 82.9 ...
##  $ Agriculture     : num  17 45.1 39.7 36.5 43.5 35.3 70.2 67.8 53.3 45.2 ...
##  $ Examination     : int  15 6 5 12 17 9 16 14 12 16 ...
##  $ Education       : int  12 9 5 7 15 7 7 8 7 13 ...
##  $ Catholic        : num  9.96 84.84 93.4 33.77 5.16 ...
##  $ Infant.Mortality: num  22.2 22.2 20.2 20.3 20.6 26.6 23.6 24.9 21 24.4 ...
{% endhighlight %}



{% highlight r %}
summary(ds)
{% endhighlight %}



{% highlight text %}
##         X        Fertility      Agriculture     Examination   
##  Aigle   : 1   Min.   :35.00   Min.   : 1.20   Min.   : 3.00  
##  Aubonne : 1   1st Qu.:64.70   1st Qu.:35.90   1st Qu.:12.00  
##  Avenches: 1   Median :70.40   Median :54.10   Median :16.00  
##  Boudry  : 1   Mean   :70.14   Mean   :50.66   Mean   :16.49  
##  Broye   : 1   3rd Qu.:78.45   3rd Qu.:67.65   3rd Qu.:22.00  
##  Conthey : 1   Max.   :92.50   Max.   :89.70   Max.   :37.00  
##  (Other) :41                                                  
##    Education        Catholic       Infant.Mortality
##  Min.   : 1.00   Min.   :  2.150   Min.   :10.80   
##  1st Qu.: 6.00   1st Qu.:  5.195   1st Qu.:18.15   
##  Median : 8.00   Median : 15.140   Median :20.00   
##  Mean   :10.98   Mean   : 41.144   Mean   :19.94   
##  3rd Qu.:12.00   3rd Qu.: 93.125   3rd Qu.:21.70   
##  Max.   :53.00   Max.   :100.000   Max.   :26.60   
## 
{% endhighlight %}

# Wrangling your data, `dplyr` style

Data wrangling can be a bit tedious in base R (R without packages), so we'll be 
using two packages designed to make this easier.  Load the `tidyr` and `dplyr` 
packages by using the `library()` function.  `dplyr` comes with a `%>%` pipe 
function (via the `magrittr` package), which works similar to how the Bash shell
`|` pipe works (for those familiar with Bash, ie. those who use Mac or Linux).
The command on the right-hand side takes the output from the command on the
left-hand side, just like how a plumbing pipe works for water.  `tbl_df` makes
the object into a `tbl` class, making printing of the output nicer.


{% highlight r %}
library(dplyr)
{% endhighlight %}



{% highlight text %}
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
{% endhighlight %}



{% highlight r %}
library(tidyr)

## Compare
head(ds)
{% endhighlight %}



{% highlight text %}
##              X Fertility Agriculture Examination Education Catholic
## 1   Courtelary      80.2        17.0          15        12     9.96
## 2     Delemont      83.1        45.1           6         9    84.84
## 3 Franches-Mnt      92.5        39.7           5         5    93.40
## 4      Moutier      85.8        36.5          12         7    33.77
## 5   Neuveville      76.9        43.5          17        15     5.16
## 6   Porrentruy      76.1        35.3           9         7    90.57
##   Infant.Mortality
## 1             22.2
## 2             22.2
## 3             20.2
## 4             20.3
## 5             20.6
## 6             26.6
{% endhighlight %}



{% highlight r %}
## With:
tbl_df(ds)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 7]
## 
##               X Fertility Agriculture Examination Education Catholic
##          (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1    Courtelary      80.2        17.0          15        12     9.96
## 2      Delemont      83.1        45.1           6         9    84.84
## 3  Franches-Mnt      92.5        39.7           5         5    93.40
## 4       Moutier      85.8        36.5          12         7    33.77
## 5    Neuveville      76.9        43.5          17        15     5.16
## 6    Porrentruy      76.1        35.3           9         7    90.57
## 7         Broye      83.8        70.2          16         7    92.85
## 8         Glane      92.4        67.8          14         8    97.16
## 9       Gruyere      82.4        53.3          12         7    97.67
## 10       Sarine      82.9        45.2          16        13    91.38
## ..          ...       ...         ...         ...       ...      ...
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}



{% highlight r %}
## Now put the tbl dataset into a new object
ds2 <- tbl_df(ds)
ds2
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 7]
## 
##               X Fertility Agriculture Examination Education Catholic
##          (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1    Courtelary      80.2        17.0          15        12     9.96
## 2      Delemont      83.1        45.1           6         9    84.84
## 3  Franches-Mnt      92.5        39.7           5         5    93.40
## 4       Moutier      85.8        36.5          12         7    33.77
## 5    Neuveville      76.9        43.5          17        15     5.16
## 6    Porrentruy      76.1        35.3           9         7    90.57
## 7         Broye      83.8        70.2          16         7    92.85
## 8         Glane      92.4        67.8          14         8    97.16
## 9       Gruyere      82.4        53.3          12         7    97.67
## 10       Sarine      82.9        45.2          16        13    91.38
## ..          ...       ...         ...         ...       ...      ...
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}

## Select columns

Often times, you want to select only some of the columns or variables from a
dataset.  For that we use the `select` command, which does as it says.  Note the
use of the `%>%` operator.  This allows you to chain commands together, letting
you do more with only a few commands.


{% highlight r %}
ds2 %>% 
    select(Education, Catholic, Fertility)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 3]
## 
##    Education Catholic Fertility
##        (int)    (dbl)     (dbl)
## 1         12     9.96      80.2
## 2          9    84.84      83.1
## 3          5    93.40      92.5
## 4          7    33.77      85.8
## 5         15     5.16      76.9
## 6          7    90.57      76.1
## 7          7    92.85      83.8
## 8          8    97.16      92.4
## 9          7    97.67      82.4
## 10        13    91.38      82.9
## ..       ...      ...       ...
{% endhighlight %}

The real power with using the `select()` function comes when you combine it with
[regular expressions (regexp)](http://www.regular-expressions.info/), or rather pattern
searching. `dplyr` has several pattern searching functions, including
`starts_with()`, `contains()`, and the most powerful `matches()`. The function
`matches()` uses regexp, which are special commands that use
certain, unique syntax for searching for patterns. For example, `^string` means
that `string` is the first character, `string$` means that `string` is last
character, `string|strung` searches for either `string` or `strung`, etc.
regexp syntax are nearly a language to themselves, so use
[StackOverflow](http://stackoverflow.com/) and Google as much as you can! 

Ok, so lets say you want to search for variables that have certain patterns:


{% highlight r %}
ds2 %>% 
    select(contains('Edu'), starts_with('Cath'))
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 2]
## 
##    Education Catholic
##        (int)    (dbl)
## 1         12     9.96
## 2          9    84.84
## 3          5    93.40
## 4          7    33.77
## 5         15     5.16
## 6          7    90.57
## 7          7    92.85
## 8          8    97.16
## 9          7    97.67
## 10        13    91.38
## ..       ...      ...
{% endhighlight %}



{% highlight r %}
## Or more simplified
ds2 %>% 
    select(matches('Edu|Cath'))
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 2]
## 
##    Education Catholic
##        (int)    (dbl)
## 1         12     9.96
## 2          9    84.84
## 3          5    93.40
## 4          7    33.77
## 5         15     5.16
## 6          7    90.57
## 7          7    92.85
## 8          8    97.16
## 9          7    97.67
## 10        13    91.38
## ..       ...      ...
{% endhighlight %}

You can see that if you have many variables that have a common structure to
their name, you can quickly select all those variables by using functions such
as `matches()`.

## Rename columns

You can rename columns using the `rename` command (the new name is on the left
hand side, so `newname = oldname`).


{% highlight r %}
ds2 %>% 
    rename(County = X)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 7]
## 
##          County Fertility Agriculture Examination Education Catholic
##          (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1    Courtelary      80.2        17.0          15        12     9.96
## 2      Delemont      83.1        45.1           6         9    84.84
## 3  Franches-Mnt      92.5        39.7           5         5    93.40
## 4       Moutier      85.8        36.5          12         7    33.77
## 5    Neuveville      76.9        43.5          17        15     5.16
## 6    Porrentruy      76.1        35.3           9         7    90.57
## 7         Broye      83.8        70.2          16         7    92.85
## 8         Glane      92.4        67.8          14         8    97.16
## 9       Gruyere      82.4        53.3          12         7    97.67
## 10       Sarine      82.9        45.2          16        13    91.38
## ..          ...       ...         ...         ...       ...      ...
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}

## Filter rows

Another common task in data wrangling is subsetting your dataset.  You can
subset the dataset using `filter`.  Note the double equal sign `==` for testing
if 'Examination' is equal to 15.  A single `=` is used for something else
(assigning things to objects or using them in functions/commands).


{% highlight r %}
## For continuous/number data
ds2 %>% 
    filter(Catholic < 20, Examination == 15)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [3 x 7]
## 
##            X Fertility Agriculture Examination Education Catholic
##       (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1 Courtelary      80.2        17.0          15        12     9.96
## 2    Yverdon      65.4        49.5          15         8     6.10
## 3 Val de Ruz      77.6        37.6          15         7     4.97
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}



{% highlight r %}
## Or for 'string' (words or letters) data
ds2 %>%
    filter(X == 'Aigle')
{% endhighlight %}



{% highlight text %}
## Source: local data frame [1 x 7]
## 
##        X Fertility Agriculture Examination Education Catholic
##   (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1  Aigle      64.1          62          21        12     8.52
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}

## Create new columns or clean up existing ones

If you want to create a new column, you use the `mutate` command.  The
`ifelse()` command lets you use a condition to have different values depending
on the condition.


{% highlight r %}
ds2 %>%
    mutate(Testing = 'yes',
           Infertile = ifelse(Fertility < 50, 'yes', 'no'))
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 9]
## 
##               X Fertility Agriculture Examination Education Catholic
##          (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1    Courtelary      80.2        17.0          15        12     9.96
## 2      Delemont      83.1        45.1           6         9    84.84
## 3  Franches-Mnt      92.5        39.7           5         5    93.40
## 4       Moutier      85.8        36.5          12         7    33.77
## 5    Neuveville      76.9        43.5          17        15     5.16
## 6    Porrentruy      76.1        35.3           9         7    90.57
## 7         Broye      83.8        70.2          16         7    92.85
## 8         Glane      92.4        67.8          14         8    97.16
## 9       Gruyere      82.4        53.3          12         7    97.67
## 10       Sarine      82.9        45.2          16        13    91.38
## ..          ...       ...         ...         ...       ...      ...
## Variables not shown: Infant.Mortality (dbl), Testing (chr), Infertile
##   (chr)
{% endhighlight %}

However, it's fairly common that you need to do some data janitorial work by
cleaning up an existing column. For example, in a dataset with a 'Sex' variable,
some values had data entry errors in spelling, such as 'fmale' when it should be
'female'. This needs to be fixed and can be done fairly easily in R. So let's
'pretend that all words starting with 'G' in the `X` (county) column should
'actually be 'J' and that all words with an 'e' at the end should be removed.
'For this, we will use the `gsub()` command within `mutate()`, which will
'*g*lobablly *sub*stitute a pattern with the replacement.


{% highlight r %}
ds2 %>% 
    mutate(
        X = gsub(pattern = '^G', replacement = 'J', X),
        X = gsub(pattern = 'e$', replacement = '', X)
        )
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 7]
## 
##               X Fertility Agriculture Examination Education Catholic
##           (chr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1    Courtelary      80.2        17.0          15        12     9.96
## 2      Delemont      83.1        45.1           6         9    84.84
## 3  Franches-Mnt      92.5        39.7           5         5    93.40
## 4       Moutier      85.8        36.5          12         7    33.77
## 5     Neuvevill      76.9        43.5          17        15     5.16
## 6    Porrentruy      76.1        35.3           9         7    90.57
## 7          Broy      83.8        70.2          16         7    92.85
## 8          Jlan      92.4        67.8          14         8    97.16
## 9        Jruyer      82.4        53.3          12         7    97.67
## 10        Sarin      82.9        45.2          16        13    91.38
## ..          ...       ...         ...         ...       ...      ...
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}

Notice the `^` and `$` characters. Those are special syntax symbols used in
regexp commands. We introduced them above, but we'll quickly go over
it again. These special symbols perform certain functions. In this case `^G`
means for all "G" that are at the start of the string/character, while `e$`
means for all "e" that are at the end of a string. Or let"s say that all "mont",
"mout", and "mnt" should actually be "ment". We can do some cleaning fairly easily
here.


{% highlight r %}
ds2 %>% 
    mutate(X = gsub('mont|mnt|mout', 'ment', X, ignore.case = TRUE))
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 7]
## 
##                X Fertility Agriculture Examination Education Catholic
##            (chr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1     Courtelary      80.2        17.0          15        12     9.96
## 2       Delement      83.1        45.1           6         9    84.84
## 3  Franches-ment      92.5        39.7           5         5    93.40
## 4        mentier      85.8        36.5          12         7    33.77
## 5     Neuveville      76.9        43.5          17        15     5.16
## 6     Porrentruy      76.1        35.3           9         7    90.57
## 7          Broye      83.8        70.2          16         7    92.85
## 8          Glane      92.4        67.8          14         8    97.16
## 9        Gruyere      82.4        53.3          12         7    97.67
## 10        Sarine      82.9        45.2          16        13    91.38
## ..           ...       ...         ...         ...       ...      ...
## Variables not shown: Infant.Mortality (dbl)
{% endhighlight %}

Regular expressions are incredibly powerful, but also can be confusing. Make
sure to check out [our resources page](/lessons/resources/) for links to sites
that explain regexp in more detail.

## Chaining pipes

We can start chaining these commands together using the `%>%` pipe command.
There is no limit to how long a chain can be.  Chaining commands together using
the pipe command makes your code easier to read, makes you type out your code
faster, and makes it easier for you to go from thinking of an analysis to
actually conducting it.  `arrange` sorts/orders/re-arranges the column Education
in ascending order.


{% highlight r %}
ds2 %>%
  filter(Catholic > 20) %>%
  select(County = X, ## This renames the variable, just like the rename() command
         Education, Fertility, Agriculture) %>%
  arrange(Education) %>%
  mutate(infertile = ifelse(Fertility < 50, 'yes', 'no'))
{% endhighlight %}



{% highlight text %}
## Source: local data frame [21 x 5]
## 
##          County Education Fertility Agriculture infertile
##          (fctr)     (int)     (dbl)       (dbl)     (chr)
## 1     Echallens         2      68.3        72.6        no
## 2       Conthey         2      75.5        85.9        no
## 3        Herens         2      77.3        89.7        no
## 4       Monthey         3      79.4        64.9        no
## 5        Sierre         3      92.2        84.6        no
## 6  Franches-Mnt         5      92.5        39.7        no
## 7       Veveyse         6      87.1        64.5        no
## 8     Entremont         6      69.3        84.9        no
## 9      Martigwy         6      70.5        78.2        no
## 10      Moutier         7      85.8        36.5        no
## ..          ...       ...       ...         ...       ...
{% endhighlight %}

## Re-organize your data (using `tidyr`)

To get the data into a nicer and more analyable format, you can use the `tidyr`
package.  See what `gather` does in the code below.  Then see what `spread`
does.  Note that you can remove a column by having a minus `-` sign in front of
a variable when you use `select`.


{% highlight r %}
## Compare this:
ds2 %>%
  select(-Infant.Mortality) %>%
  rename(County = X)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 6]
## 
##          County Fertility Agriculture Examination Education Catholic
##          (fctr)     (dbl)       (dbl)       (int)     (int)    (dbl)
## 1    Courtelary      80.2        17.0          15        12     9.96
## 2      Delemont      83.1        45.1           6         9    84.84
## 3  Franches-Mnt      92.5        39.7           5         5    93.40
## 4       Moutier      85.8        36.5          12         7    33.77
## 5    Neuveville      76.9        43.5          17        15     5.16
## 6    Porrentruy      76.1        35.3           9         7    90.57
## 7         Broye      83.8        70.2          16         7    92.85
## 8         Glane      92.4        67.8          14         8    97.16
## 9       Gruyere      82.4        53.3          12         7    97.67
## 10       Sarine      82.9        45.2          16        13    91.38
## ..          ...       ...         ...         ...       ...      ...
{% endhighlight %}



{% highlight r %}
## With this:
ds2 %>%
  select(-Infant.Mortality) %>%
  rename(County = X) %>%
  gather(Measure, Value, -County)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [235 x 3]
## 
##          County   Measure Value
##          (fctr)    (fctr) (dbl)
## 1    Courtelary Fertility  80.2
## 2      Delemont Fertility  83.1
## 3  Franches-Mnt Fertility  92.5
## 4       Moutier Fertility  85.8
## 5    Neuveville Fertility  76.9
## 6    Porrentruy Fertility  76.1
## 7         Broye Fertility  83.8
## 8         Glane Fertility  92.4
## 9       Gruyere Fertility  82.4
## 10       Sarine Fertility  82.9
## ..          ...       ...   ...
{% endhighlight %}



{% highlight r %}
## And back again:
ds2 %>%
  select(-Infant.Mortality) %>%
  rename(County = X) %>%
  gather(Measure, Value, -County) %>%
  spread(Measure, Value)
{% endhighlight %}



{% highlight text %}
## Source: local data frame [47 x 6]
## 
##        County Fertility Agriculture Examination Education Catholic
##        (fctr)     (dbl)       (dbl)       (dbl)     (dbl)    (dbl)
## 1       Aigle      64.1        62.0          21        12     8.52
## 2     Aubonne      66.9        67.5          14         7     2.27
## 3    Avenches      68.9        60.7          19        12     4.43
## 4      Boudry      70.4        38.4          26        12     5.62
## 5       Broye      83.8        70.2          16         7    92.85
## 6     Conthey      75.5        85.9           3         2    99.71
## 7    Cossonay      61.7        69.3          22         5     2.82
## 8  Courtelary      80.2        17.0          15        12     9.96
## 9    Delemont      83.1        45.1           6         9    84.84
## 10  Echallens      68.3        72.6          18         2    24.20
## ..        ...       ...         ...         ...       ...      ...
{% endhighlight %}

## Summarise variables

Combined with `dplyr`'s `group_by` and `summarise` you can quickly summarise
data or do further, more complicated analyses. `group_by` makes it so further
analyses or operations work on the groups. `summarise` transforms the data to
only contain the new variable(s) created, in this case the mean, as well as the
grouping variable.


{% highlight r %}
ds2 %>%
  select(-X) %>%
  gather(Measure, Value) %>%
  group_by(Measure) %>%
  summarise(mean = mean(Value),
            sampleSize = n())
{% endhighlight %}



{% highlight text %}
## Source: local data frame [6 x 3]
## 
##            Measure     mean sampleSize
##             (fctr)    (dbl)      (int)
## 1        Fertility 70.14255         47
## 2      Agriculture 50.65957         47
## 3      Examination 16.48936         47
## 4        Education 10.97872         47
## 5         Catholic 41.14383         47
## 6 Infant.Mortality 19.94255         47
{% endhighlight %}

## Other useful and powerful examples

You can do some really powerful things with `dplyr` and `tidyr` functions.  For 
example, you can run each combination of independent and dependent variables in 
a linear regression (`lm()`) using `gather()` and the `dplyr` `do()` command, 
rather than running each individually.  To make the output from the `lm()`
easier to combine and understand, we use the `tidy()` command from the `broom`
package (`::` tells R we want to use the `tidy()` function from the `broom`
package).  If you want more details on how to use this set up,
[check out my blog post about it](http://www.lukewjohnston.com/blog/loops-forests-multiple-linear-regressions/).


{% highlight r %}
ds2 %>%
    select(-X) %>%  
    gather(Indep, Xvalue, Fertility, Agriculture) %>%
    gather(Dep, Yvalue, Education, Catholic) %>% 
    group_by(Dep, Indep) %>% 
    do(lm(Yvalue ~ Xvalue + Infant.Mortality + Examination, data = .) %>% 
           broom::tidy())
{% endhighlight %}



{% highlight text %}
## Error in tidy.lm(.): could not find function "is"
{% endhighlight %}
