---
title: "Introduction: Version control using Git"
author:
    - Luke Johnston
    - Daiva Nielsen
date: 2015-03-23
fontsize: 12pt
geometry: margin=1in
papersize: letterpaper
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - Git
categories:
    - Lessons
    - Git
permalink: lessons/git/
---

Version control is a system that manages changes to a file or files.
These changes are kept as logs in a history, with detailed information
on what file(s) was changed, who changed it, and a message on why the
change was made.  This is extremely useful when you are either:

1. Working on multiple projects and often forget what you were doing
   last.
2. Have worked on a project many months ago and forget what you were
   doing (no one has perfect memory).
3. Working as part of a team.
4. Aim to publish your data and code along with your manuscript.

To understand incredibly powerful use of version control, think on
these questions: How many versions of a manuscript or research project
do you have laying around after getting feedback from your supervisor
or co-authors? Have you ever wanted to experiment with your code or
your manuscript and need to make a new file so that the original is
not touched? Have you ever deleted something and wish you hadn't? Have
you ever forgotten what you were doing on a project?

Version control fixes *all* of these problems!  And our aim for this
workshop is to get you familiar with Git and (at least partly)
comfortable with the concept.

## Learning objectives ##

After this workshop, our expectation is that you will:

1. Better appreciate the importance of putting your research under
   version control.
2. Set up a Git repo.
3. Add and commit files into your Git history.
4. Create a branch to experiment on and how to move back to your
   primary work.
5. Move back (or forward) in your history.
6. Check out your history and commit messages.
7. Determine what you changed in a file to that in the history.

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
   `diabetesSatFats/analysis-DiabetesSatFats.sas` and **instead** use
   `diabetesSatFats/analysis.sas`.

5. If a number is included in the filename, such as for the version
   number, use two digits not one (e.g. `V01`, not `V1`).

6. When including a date, include it at the very end of the filename
   and in the international standard format `YYYY-MM-DD` (in all numbers).

# Materials for this lesson: #

* [Slides](slides/)
* [Cheatsheet](cheatsheet/)
* [Assignment](assignment/)

Other resources can be found [here](../resources/)

