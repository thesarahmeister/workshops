#!/bin/sh

# Created by: Luke Johnston

# This script extracts the lesson and gps material from the master
# branch, keeping only the files needed for the site.  This makes it
# easier to edit only one set of files, rather than two sets (site vs
# workshop).

# Extract the files from the other branch
git checkout master -- lesson/ gps/

# Remove extraneous files from the git staging area
git rm -r --cached lessons/template/ lessons/*.sh \
    lessons/*.tex **/*.sas **/*.R

# Delete the files from the directory
rm -rf lessons/template/ lessons/*.sh lessons/*.tex

find . -type f -iname '*.tex' -iname '*.sas' -delete \
    -o -iname '*.R' -delete

