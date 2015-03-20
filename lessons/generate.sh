slides=$(find . -type d -path ./template -prune -o \
    -type f -iname 'cheatsheet*md' -print  -o \
    -iname '*slide*md' -print)

cheatsheet=$(find . -type d -path ./template -prune -o \
    -type f -iname 'cheatsheet*md' -print  -o \
    -iname '*slide*md' -print)

for f in $slides; do
    if [ -f "${f%.md}.pdf" ] && [ "$f" -nt "${f%.md}.pdf" ] ; then
        echo PDF does exist and .md is newer: Generate pdf
        pandoc $f -t beamer -o ${f%.md}.pdf
    elif [ ! -f "${f%.md}.pdf" ] ; then
        echo PDF does not exist: Generate pdf
        pandoc $f -t beamer -o ${f%.md}.pdf
    else 
        echo .md is older: Do nothing
    fi
done

for f in $cheatsheet; do
    if [ -f "${f%.md}.pdf" ] && [ "$f" -nt "${f%.md}.pdf" ] ; then
        echo PDF does exist and .md is newer: Generate pdf
        pandoc $f -o ${f%.md}.pdf
    elif [ ! -f "${f%.md}.pdf" ] ; then
        echo PDF does not exist: Generate pdf
        pandoc $f -o ${f%.md}.pdf
    else 
        echo .md is older: Do nothing
    fi
done

