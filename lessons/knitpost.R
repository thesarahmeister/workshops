#!/usr/bin/Rscript --vanilla

# Taken and modified from
# http://varianceexplained.org/pages/workflow.html

# compiles all .Rmd files in _R directory into .md files in the _posts
# directory, if the input file is older than the output file.

# run ./knitpages.R to update all knitr files that need to be updated.

KnitPost <- function(input, outfile, base.url = '/') {
    # this function is a modified version of an example here:
    # http://jfisher-usgs.github.com/r/2012/07/03/knitr-jekyll/
    knitr::opts_knit$set(base.url = base.url)
    knitr::opts_chunk$set(fig.path = 'images/',
                          collapse = TRUE)
    knitr::render_jekyll()
    knitr::knit(input, outfile, envir = parent.frame())
    txt <- sub('^published: false', 'published: true',
               readLines(outfile))
    writeLines(txt, outfile)
}

for (infile in list.files(pattern="*.Rmd", full.names=TRUE, recursive = TRUE)) {
    outfile <- paste0(sub("\\.Rmd$", ".md", infile))

    # knit only if the input file is the last one modified
    if (!file.exists(outfile) |
        file.info(infile)$mtime > file.info(outfile)$mtime) {
        KnitPost(infile, outfile)
    }
}

