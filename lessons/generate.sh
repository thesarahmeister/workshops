#!/bin/sh

# Created by: Luke Johnston

# This script generates pdf files for the .md lesson materials.  If
# the pdf already exists and is newer than the accompanying .md file,
# then it will not be generated.

# Assign all slide.md and cheatsheet files to the slides and
# cheatsheet variables
slides=$(find . ! -path '*/template/*' -type f \
    -iname '*slide*md' -print)

cheatsheet=$(find . ! -path '*/template/*' -type f \
    -iname '*cheatsheet*md' -print)

# Loop through each slide.md file found.
for f in $slides; do

    # Assign the filename (without the path)
    fi=$(basename $f)
    # Check if the pdf exists and if the .md is newer
    if [ -f "${f%.md}.pdf" ] && [ "$f" -nt "${f%.md}.pdf" ] ; then
        echo PDF does exist and .md is newer: Generate pdf
        (cd $(dirname $f) && pandoc $fi -t beamer -o ${fi%.md}.pdf)
        
    # Check if the pdf exists
    elif [ ! -f "${f%.md}.pdf" ] ; then
        echo PDF does not exist: Generate pdf
        (cd $(dirname $f) && pandoc $fi -t beamer -o ${fi%.md}.pdf)
    else 

        echo .md is older: Do nothing
    fi
done

# Loop through each cheatsheet.md file
for f in $cheatsheet; do
    
    # Assign the filename (without the path)
    fi=$(basename $f)
    # Check if the pdf exists/if the md is newer
    if [ -f "${f%.md}.pdf" ] && [ "$f" -nt "${f%.md}.pdf" ] ; then
        echo PDF does exist and .md is newer: Generate pdf
        (cd $(dirname $f) && pandoc $fi -o ${fi%.md}.pdf)
       
    # Check if the pdf exists
    elif [ ! -f "${f%.md}.pdf" ] ; then
        echo PDF does not exist: Generate pdf
        (cd $(dirname $f) && pandoc $fi -o ${fi%.md}.pdf)
    else 
        echo .md is older: Do nothing
    fi
done

