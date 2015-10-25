---
title: "Cheatsheet: R Markdown"
published: true
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Cheatsheet
    - Rmarkdown
    - R
categories:
    - Lessons
    - Rmarkdown
    - R
output:
    md_document:
        toc: true
        variant: markdown_github
---



Want a streamlined and efficient workflow where you wrangle your data, analyze
it, plot it or make a table of the results, and put it into your manuscript or
thesis all in one go? Well, you are lucky! R Markdown does exactly take, by
making you more productive and efficient! Use this cheatsheet as a reference to
learning how to use R Markdown, or better yet, check out the [R resources list](../resources/) 
for a printable cheatsheet (developed by RStudio).

# R Markdown commands: Some useful or common ones #

## YAML metadata ##

> Most R Markdown files will contain YAML metadata for options on how to
generate the output document. These options are used by R Markdown to tell
pandoc (the conversion tool) how to create the document.

> Example YAML options:

    ---
    title: 'Title here'
    author: 'Author here'
    date: 2015-10-10
    bibliography: /path/to/file
    output:
        html_document:
            toc: true
            number_section: true
            fig_caption: true
        word_document:
            toc: true
            fig_caption: true
    ---

## R code chunk options ##

> Code chunks in `.Rmd` files are started with three backticks, r, the chunk
name, and the options, which would look like ` ```{r chunkName, echo=FALSE}``` `.
Code chunks allow R to run the code inside and print the R output onto the
HTML/Word/PDF document. The chunk options customize the output as specified.

> Example options:

    eval=TRUE
    echo=TRUE
    message=TRUE
    error=TRUE
    warning=TRUE
    results=('markup', 'asis', 'hide')
    fig.height=7
    fig.width=7
    dpi=90
    fig.cap='Caption title'

## `pander` ##

> The `pander` function in the `pander` package can create a markdown table from
an R object. This lets you easily change those pesky tables, no longer needing
to copy and paste into the table!  You will need to specific the code chunk
option `results='asis'` to make R print the table correctly.  `pander` tables
can be highly customized. Please see the [resources](../resources/) or go
directly to the [`pander` website](http://rapporter.github.io/pander/) for a
detailed reference to completely customizing tables.

> Example code:

    library(pander)    
    pander(head(cars))
    ## Or print linear regression output:
    pander(lm(cars))
    ## Or t-test
    pander(t.test(cars))
    ## Include a caption for the next table:
    set.caption('Caption title here')
    ## Table of correlations coefficients
    pander(cor(cars))
    ## Or directly include the caption in the command:
    pander(cor(cars), caption = 'Caption title here')

## `captioner` ##

> Depending on the output format, there will likely not be a number assigned to
each table or figure. If your table or figure changes frequently or based on
reviewer comments, you may want to assign a label to the table or figure and
have it change the numbering for you. These can all be fixed by using
`captioner` from the `captioner` package.

> Example code:


{% highlight r %}
    library(captioner)
    tabNums <- captioner(prefix = 'Table')
    tabNums('tab1', 'Caption for table 1')
    ## cite in text using `r tabNums('tab1', display = 'cite')`
    pander(head(cars), caption = tabNums('tab1'))
    
    ## For figures...
    figNums <- captioner(prefix = 'Figure')
    figNums('fig1', 'Caption for figure 1')
    ## cite in text using `r figNums('fig1', display = 'cite')`
    ## Include the caption for the figure in the code chunk
    ## using fig.cap=`r figNums('fig1')`
{% endhighlight %}

## `render` ##

> This is the command to convert the `.Rmd` or `.R` file into other document
formats, including Word, HTML, or PDF. Conversion to PDF requires a working
LaTeX distribution (see [here](https://www.latex-project.org/) for help).

> Example code:

    library(rmarkdown)
    ## Convert to word and html files.
    render('file.Rmd', c('word_document', 'html_document'))
