#!/bin/bash

## This is a comment:
cd ~/Desktop
mkdir practice/
ls -l
cd practice/

git config --global user.name 'Luke Johnston'
git config --global user.email 'lwjohnst@gmail.com'
git config --global color.ui 'auto'
git config --global core.editor 'emacs'
git config --global push.default current
git config --list

## Let's start a git repository!
git init
git status

touch code.sas
git status
git add code.sas
git commit -m "First commit and added a code file"

git add --help
git commit --help

## Open the code.sas and add some lines:

proc means data=sashelp.class;
run;

## Check the git repository

git status
git diff code.sas

git add code.sas
git commit -m "Added means to code file"
## OR...
git commit -a -m "Added means to code file"

git log

touch report.md
## Or....
touch report.doc

## Add text to the new file:

This is going to be my report on my research project.  I will show my
results here.

git status

## Open code.sas and add some code:

proc contents data=sashelp.class;
run;

## Check repo

git status

git add report.md code.sas
git commit -m "Message"

## OR...

git commit report.md code.sas -m "Message"

## Or...

git commit -am "Message"

## Play around! Create a branch

git branch playing
git checkout playing ## Checkout is like a drawer

## Add, change files. Commit them. Then jump back to the master br

git checkout master

## Delete the report.md file

git status

## Get it back

git checkout -- report.md

## Delete the report.md then commit

git status
git rm report.md

git status
git commit -m "Deleted file"

## Recover it

git checkout HEAD~1 -- report.md
