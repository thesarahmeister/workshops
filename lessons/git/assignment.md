---
title: "Assignment: Git"
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Assignment
    - Git
categories:
    - Lessons
    - Git
---

## Challenges: Try these out yourself! ##

In order to learn how to use Git, you really need to just start using it and get
some practice!  *Use only the commandline/terminal*.  Don't forget to push them
to your GitHub account and submitting a pull request at the end, so we can give
feedback/make suggestions.

Make sure to also have these folders in your own directory on the practice *Code
As Manuscript* repo (called `practice-YYYY-MM` where `YYYY-MM` represents the
year and month):

    your-name/
    - bio/
    - git/
    - intror/
    - plotting/
    - wrangling/
    - rmarkdown/

Now, make sure all of these challenges are placed in the proper folder (`git/`).

1. Create a new file under the `your-name/git/` directory called `aboutme.txt`.
   Write up a bit about yourself, some hobbies, what you are doing, etc. Now
   get Git to track (add) that file and commit it to the history.
2. Make a change to the `aboutme.txt` file by including something else about
   yourself and making some edits to what you already wrote. Run `git diff` and
   save the output of the `git diff` into a file called `diff.txt` (Hint: run
   `git diff aboutme.txt > diff.txt`). **Don't commit the change yet**.
3. Create a new file called `how-git-works.txt` and write up how you understand
   how Git works, using your own words. After you have done that, do `git
   status` and save the output into a file called `status.txt` (Hint: see the
   hint in challenge 2 above).  After you have created the `status.txt` file,
   commit the files one by one, making sure to write up **descriptive** commit
   messages!
4. Add to the `how-git-works.txt` file and explain why you think Git and version
   control are important. Then, add another file called `filesystem.txt` and
   write up how *you* understand how filesystems work. Add and commit these
   files to the git history, making sure to make *descriptive* commit messages.
5. Lastly, push these files up to your GitHub account and submit a pull request
   of your changes with the original practice Code As Manuscript
   repository. Once pull requests have been completed, make sure to update your
   local and your own GitHub repository with the original GitHub repository
   (Hint: `git pull upstream master`).

