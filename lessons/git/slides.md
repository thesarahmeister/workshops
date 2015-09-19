---
title: "Let's 'Git' started: An introduction to version control"
author: Daiva & Luke
date: 2015-06-16
layout: page
sidebar: false
classoption: xcolor=dvipsnames
tag:
    - Lessons
    - Slides
    - Git
categories:
    - Lessons
    - Git
slide-level: 1
fontsize: 8pt
header-includes:
    - \input{../slideOptions.tex}
---

# Welcome to our Code As Manuscript workshop!! #

## Purpose: ##

To teach a *few* tips and tricks for:

* Efficiently managing your data and code
* Keeping a history of what you did, when, and why
* Becoming more productive at generating results from your analyses

. . .

## Significance: ##

Topics we cover will help you:

* Get more comfortable with your data
* Reduce the chance for errors
* Give you control over your work
* Make your analysis more reproducible

# Notes and help during this workshop #

Go to this website:

<https://etherpad.mozilla.org/codeasmanuscript>

# Version control #

. . .

![](../images/filenamingComic.gif)

# What is version control[^gitvcs] (VC) #

* Keeps history of all changes done to files in a folder
* Like a big track changes
* Like your experiment logbook/journal (basic science)
* Can revert to previous change
* Don't have to worry about losing what you wrote!

. . .

## Importance of VC! ##

* Future of journals and retractions
* Requests for data and code
* Transparency, scientific rigor
* Protect against accusations of fraud

[^gitvcs]: See the
    [Git website](http://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
    for more detail.

# Visualization of VC[^gitpic] #

![](../images/vcs-Snapshot.png)

[^gitpic]: Taken from the Git site
    ([click here](http://git-scm.com/book/en/v2/Getting-Started-Git-Basics))

# Slight tangent: Filenaming rules #

. . .

1. Keep names short, meaningful. Remove "the", "and", "a", etc.
2. Don't include spaces.
3. Use hyphens to separate important parts of the filename.
4. Avoid redundancy in file names and folder names
   (e.g. `folderName/fileName-folderName.txt`, instead use
   `folderName/fileName.txt`).
5. If a number is included, such as for the version number, use two
   digits not one (e.g. V01, not V1).
6. When including a date, include it at the end of the filename and in
   the international standard format YYYY-MM-DD.

# Before getting into Git, any questions? #

# Using Git #

Before we start...The command line is **not** something to be afraid
of!!

. . .

Open up the terminal (Mac/Linux) or Git Bash (Windows).

. . .

```
    git config --global user.name "Your Name"
    git config --global user.email "you@some.domain"
    git config --global color.ui "auto"
    git config --global core.editor "your_editor"
    git config --global push.default current
    git config --list
```

