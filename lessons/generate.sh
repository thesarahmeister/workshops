#!/bin/sh

# Created by: Luke Johnston

# This script generates pdf files for the .md lesson materials.  If
# the pdf already exists and is newer than the accompanying .md file,
# then it will not be generated.

# Assign all slide.md and cheatsheet files to the slides and
# cheatsheet variables
slides=$(find . -type d -path ./template -prune -o \ 
    -type f -iname '*slide*md' -print)

cheatsheet=$(find . -type d -path ./template -prune -o \
    -type f -iname 'cheatsheet*md' -print)

# Loop through each slide.md file found.
for f in $slides; do

    # Check if the pdf exists and if the .md is newer
    if [ -f "${f%.md}.pdf" ] && [ "$f" -nt "${f%.md}.pdf" ] ; then
        echo PDF does exist and .md is newer: Generate pdf
        pandoc $f -t beamer -o ${f%.md}.pdf
        
    # Check if the pdf exists
    elif [ ! -f "${f%.md}.pdf" ] ; then
        echo PDF does not exist: Generate pdf
        pandoc $f -t beamer -o ${f%.md}.pdf
    else 

        echo .md is older: Do nothing
    fi
done

# Loop through each cheatsheet.md file
for f in $cheatsheet; do
    
    # Check if the pdf exists/if the md is newer
    if [ -f "${f%.md}.pdf" ] && [ "$f" -nt "${f%.md}.pdf" ] ; then
        echo PDF does exist and .md is newer: Generate pdf
        pandoc $f -o ${f%.md}.pdf
       
    # Check if the pdf exists
    elif [ ! -f "${f%.md}.pdf" ] ; then
        echo PDF does not exist: Generate pdf
        pandoc $f -o ${f%.md}.pdf
    else 
        echo .md is older: Do nothing
    fi
done

