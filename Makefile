
all : commands

#-------------------------------------------------------------------
# Targets and commands

##-------------------------------------------------------------------
## commands    : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

##-------------------------------------------------------------------

## update_site : Merge posts/edits from the `dev-site` branch into gh-pages
update_site :
	git checkout gh-pages && \
	git merge --no-commit --no-ff dev-site

## build_local : Build the site locally to test out before going live
build_local :
	jekyll serve --watch --draft
