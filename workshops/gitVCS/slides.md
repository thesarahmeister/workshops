---
title: "Let's 'Git' started: An introduction to version control"
date: 2014-11-07
author: Luke & Daiva
classoption: xcolor=dvipsnames
output:
    beamer_presentation:
        slide_level: 1
header-includes:
    - \input{opt/slideOptions.tex}
    
---

# Welcome to our Data-related workshop #

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

# Caveat: We aren't here to teach statistics #

Need help with stats? Use these resources!

* U of T Statistical Consulting Services ([click here](http://www.utstat.toronto.edu/wordpress/?page_id=25))

* <http://www.stackoverflow.com>

* <http://stats.stackexchange.com>

# Overview of some future workshops #

* Let's "Git" started! An introduction to version control

* Know your data and how to handle it correctly: Statistical
  assumptions

* Fighting chaos: Coding tricks to keep your analysis -- and mind --
  sane

* Visual exploration (of data): Techniques and code to better
  understand your data using plots and graphs

. . .

* Code Review Club...?

# Notes and help during this workshop #

Go to this website:

<https://etherpad.mozilla.org/dnsWorkshops>

# Reproducible research #

\includegraphics[width=\textwidth]{img/reproducibleCrisis.png}

* <http://www.nature.com/nature/focus/reproducibility/>

* <http://ropensci.org/blog/2014/06/09/reproducibility/>

# Reproducible research #

\includegraphics[width=\textwidth]{img/PLOS.png}

by Greg Wilson, founder of Software Carpentry
([click here](http://software-carpentry.org/))

# Version control #

![](img/filenamingComic.gif)

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

[^gitvcs]: See the Git website
    ([click here](http://git-scm.com/book/en/v2/Getting-Started-About-Version-Control))
    for more detail.

# Visualization of VC[^gitpic] #

\includegraphics[width=\textwidth]{img/vcs-Snapshot.png}

[^gitpic]: Taken from the Git site
    ([click here](http://git-scm.com/book/en/v2/Getting-Started-Git-Basics))

# Brief tangent: Filenaming rules #

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

# Using Git #

Before we start...The command line is **not** something to be afraid
of!!  Open up the terminal (Mac/Linux) or Git Bash (Windows).

. . .

Open up your terminal (Mac or Linux) or Git-Bash (Windows).

```
    git config --global user.name "Your Name"
    git config --global user.email "you@some.domain"
    git config --global color.ui "auto"
    git config --global core.editor "your_editor"
    git config --list
```

# Download our GitHub repository #

GitHub[^gitserver] is a place to store your git repo for several
reasons:

1. As a backup
2. To use across computers
3. To share with others

. . .

In your terminal/Git-Bash, run:

```
cd ~
git clone
    https://github.com/codeasmanuscript/gitWorkshop.git
cd gitWorkshop
```

. . .

Check out the `cheatsheet.html` file.

[^gitserver]: Or <http://BitBucket.org>

# Live coding #

# Main Exercise #

1. Create a git repository in a new folder to practice in
2. Create a SAS (or R) file to run analyses on the dataset
   `sashelp.fish` (SAS) or `airquality` (R)
3. Output the dataset into a `csv` file
4. Save your work to the git repository
5. Find the means and run an ANOVA on the dataset
6. Commit your changes to git
7. Make a fake report on your findings
8. Commit
9. Make a change to your report
10. Commit
11. Revert to the older version
12. Make a branch to experiment
