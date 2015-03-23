
all : commands

#-------------------------------------------------------------------
# Targets and commands

##-------------------------------------------------------------------
## commands       : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

##-------------------------------------------------------------------

## build_local    : Build the site locally to test out before going live
build_local :
	jekyll serve --watch --draft --baseurl ''

## clean_lessons  : Clean out the lessons folder to update the material
clean_lessons :
	rm -rf lessons/* gps/*

## update_content : Update the content of the site from the master branch
update_content :
	sh update.sh
