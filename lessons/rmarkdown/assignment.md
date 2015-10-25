---
title: "Assignment: R Markdown"
published: true
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - Rmarkdown
    - R
categories:
    - Lessons
    - Rmarkdown
    - R
output:
    md_document:
        variant: markdown_github
---

## Challenges: Try these out yourself!

Try to progressively add these challenges into an `.Rmd` file. First, create a
template R Markdown file from RStudio. Push the final version to the GitHub
repo, so we can look them over and make suggestions.

1. Create section 'Brief description' describing your assigned dataset. Use
inline R code to describe some basic statistics of the variables (eg. means,
standard deviation, number of variables, and number of rows).

2. Create a new section 'Plots' for some plots of some of the variables in the 
dataset. Include the code from the `plotting` workshop assignment into the
`.Rmd` file, replacing the old dataset with the new dataset name (including the
variable names too!).  Include a figure caption (using the YAML option and the
code chunk option) and increase the DPI of the figure. Use `captioner` to create
the figure caption.

3. Create another section 'Tables' for some tables. Include the R code from
`wrangling` workshop assignment into the `.Rmd` file.  Replace the old dataset
with the new dataset name, as well as the variable names. Convert the `%>%` pipe
chain to a table using `pander`. Use `captioner` for the table captions.

4. Generate both a Word file and an HTML file at the same time, using the YAML 
metadata and the `render` command. Change the theme of the HTML document and
number the sections, and include a table of contents (toc) into both the Word
and HTML documents.
