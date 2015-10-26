---
title: "Introduction: Version control using Git and GitHub"
author:
    - Luke W. Johnston
    - Daiva Nielsen
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Introduction
    - Git
categories:
    - Lessons
    - Git
permalink: lessons/git/
---

Version control is a system that manages changes to a file or files.
These changes are kept as logs in a history, with detailed information
on what file(s) was changed, what was changed within the file, who
changed it, and a message on why the change was made.  This is
extremely useful, especially when working in teams or for yourself 6
months in the future (because you *will* forget things)!

To understand how incredibly powerful version control is, think about
these questions: How many files of different versions of a manuscript
or thesis do you have laying around after getting feedback from your
supervisor or co-authors? Have you ever wanted to experiment with your
code or your manuscript and need to make a new file so that the
original is not touched? Have you ever deleted something and wish you
hadn't? Have you ever forgotten what you were doing on a project? 

Version control fixes *all* of these problems!  And our aim for this
workshop is to get you familiar with Git and (at least partly)
comfortable with the concept.

## Learning expectations ##

After this workshop, our expectation is that you will:

- Know how to use the basic tools of version control in your work
- Know how to collaborate with others on a project
- Have a basic understanding of how Git and GitHub works
- *Know where to go for help*

# Materials for this lesson: #

* [Slides](slides/)
* [Cheatsheet](cheatsheet/)
* [Assignment](assignment/)

Other resources can be found [here](/lessons/resources/)

# Brief aside: Filenaming #

Because Git keeps a record of your files and changes to them, you
don't need to have different files names for different versions
(eg. file-V01.doc, file-V02.doc, etc).  Plus, because part of the
benefit of Git is eventually being able to collaborate, it's
*extremely* useful to follow some rules on filenaming.  We've put
together some below:

1. Keep the names short, but meaningful. Remove unnecessary words such
   as "the", "and", "a" etc.

2. Don't include spaces and avoid underscores (debatable and/or
   situational).  For a string of words, capitalize the first letter
   of each word, except for the first word
   (e.g. `fileNameDescription`)

3. Use hyphens to separate important parts of the name or when there
   is an abbreviation followed by another word.  For example,
   `diabetesRisk-AnalysisOutput` which separates the two concepts, the
   project descriptor `diabetesRisk` and the contents of the file
   `AnalysisOutput`.  Another example:
   `report-AnalysisFoodIntake-2014.pdf` and **not**
   `reportAnalysisFoodIntake2014.pdf`.

4. Avoid redundancy in file names and file paths (folder names).  For
   example, don't use `folderName/fileName-folderName.txt` and instead
   use `folderName/fileName.txt`.  Another example: **don't** use
   `diabetesFats/analysis-DiabetesFats.sas` and **instead** use
   `diabetesFats/analysis.sas`.

5. If a number is included in the filename, such as for the version
   number, use two digits not one (e.g. `V01`, not `V1`).

6. When including a date, include it at the very end of the filename
   and in the international standard format `YYYY-MM-DD` (in all numbers).

# Brief aside 2: Tips on using the terminal #

- Make use of TAB-completion in the terminal!
- Up arrow on the terminal goes to the previous command you entered.

# Putting your files under version control using Git #

## Setting up your user information and GitHub account ##

For configuring your git, follow the
["Initial setup" in the cheatsheet page](http://codeasmanuscript.org/lessons/git/cheatsheet/)
I've put together.

Then, set up a [GitHub](https://github.com/) account if you haven't already.  If
you are concerned about having your research or data be public you can either a)
[request](https://education.github.com/) 5 free private repos from GitHub or b)
use [BitBucket](https://bitbucket.org/), which uses private repos by
default. But at least for this workshop, set up a GitHub account.

## Basics of using Git for a fresh repository ##

Create a folder and create a git repository (which is the stored
history) in that folder. (Note: `##` is a comment, not a command).

    cd ~/Desktop ## Move to your desktop
    mkdir playing ## Create a folder (aka directory)
    cd playing
    git init ## Create the repository (init = initialize)

Now, create a file, get git to track it, and save it to the history.

    touch bio.txt ## Command to create a file called bio.txt
    ls ## Check that you created the file, ls = list files
    git add bio.txt ## Track the file
    ## Save the file to the history with a message (-m)
    git commit -m "Initial commit"

Now, open the `bio.txt` file and add:

* Your name
* Your program and year
* Your progamming language/statistical language of choice

Then:

    git status ## Check the activity
    git diff bio.txt ## Compare to the one in the history
    git add bio.txt ## This sends it to the staging area
    git commit -m "Added my bio" ## This sends it to the history

For a description on what the different stages are (working directory,
staging area, and committed history) see the below links or check out the
[resources page](/lessons/resources/):

* Description: https://git-scm.com/book/en/v2/Getting-Started-Git-Basics
* Image: https://git-scm.com/book/en/v2/book/01-introduction/images/areas.png

Then, to see what has happened in your history:

    git log ## View the log of your history
    git log --graph --oneline ## A condensed view of the log

## Including GitHub in your workflow ##

One of the major strengths of Git are it's features that allow easy
collaboration on complex (or simple) projects. GitHub, which is a hosting
service (not a program and not related to Git), uses Git to save and share Git
repositories online. Most, if not all of the open source community has their
projects on GitHub. You could set up your own GitHub repository, but for now, we
will ['fork'](https://help.github.com/articles/fork-a-repo/) (which means copy
someone else's GitHub repository in GitHub language) the *Code as Manuscript*
practice repository (in the form `practice-YYYY-MM`). There is a button in the
top right corner called 'Fork' that allows you to do that. Click it. The
`practice-YYYY-MM` repository is now on your GitHub account! Now we can 'clone'
(meaning download the git repository onto your computer) your newly created
'forked' repository!

    mkdir ~/Desktop/workshops/
    cd ~/Desktop/workshops/
    git clone https://github.com/yourusername/practice-YYYY-MM.git
    cd practice-YYYY-MM/

Now it should have downloaded the repository onto your computer. Because you
cloned forked repository, it's good practice to also include a link to the
original (upstream) repository:

    
    git remote add upstream https://github.com/codeasmanuscript/practice-YYYY-MM.git

You can view the different links (called remotes) you have to your GitHub
accounts:

    git remote -v # v = verbose, or rather more detailed

You can see you should have two remotes, `origin` (*your* forked repo) and
`upstream` (codeasmanuscript repo). Now, create a new directory that you will
use for the rest of the workshops, as well as all the directories you will use
for the other workshop topics:

    mkdir your-name/
    cd your-name/
    # Create multiple directories by typing in more names
    mkdir git intror plotting wrangling rmarkdown
    cd git/ # Move into the git one

Now, create a `bio.txt` file, write up your name and program. Add and commit
that file. Now we want to upload (`push`) your new file onto your GitHub repo
and submit a
['pull request'](https://help.github.com/articles/using-pull-requests/):

    git push origin master # Origin is your account

Go to GitHub and click the 'Pull Requests' button on the side and on the next
page click the 'New pull request' button. Keep clicking until you have finished
submitting your pull request. After we (the *Code As Manuscript* instructors)
accepted the pull requests, you need to update your local git repo and your
forked GitHub repo by downloading (`pull`) from the original `upstream` GitHub
repo.

    git pull upstream master
    git push origin master

That covers the basics of using Git and incorporating GitHub into the workflow!
If you ever need help with any commands, check out
[StackOverflow](http://stackoverflow.com/) for answers on tens of thousands of
questions with tens of thousands of answers!

# Brief glossary of terms: #

* `cd` - change directory
* directory - the same thing as a folder
* `ls` - list the files and folders in a folder
* `touch` - create an empty file
* repository - the saved history of a folder and files, used by git and located
  in the `.git/` folder.
* `init` - start or initialize a git repository
* `add` - put a file into the staging area, so that git starts
  tracking it
* staging/index area - where files are stored before going into the
  history
* `commit` - send files in the staging/index area into the history
  (the git repository)
* `status` - check the status of the folder and the git repository
* `diff` - compare a file to the a file in the history
* `log` - view the commit history in the git repository

