
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
	jekyll serve --watch --draft

