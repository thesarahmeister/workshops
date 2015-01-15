
#-------------------------------------------------------------------
# Custom Make variables

WORKSHOP_DIR = ../../../materials/git/part2

#-------------------------------------------------------------------
# Targets and commands

all : commands

##-------------------------------------------------------------------
## commands   : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

##-------------------------------------------------------------------

## cheatsheet : Create the documents for the cheatsheet
cheatsheet :
	@pandoc cheatsheet.md -o cheatsheet.html
	@pandoc cheatsheet.md -o cheatsheet.pdf

## slides     : Create the pdf of the slides
slides :
	@pandoc slides.md -t beamer -o slides.pdf

## ws_copy    : Copy these files over into the workshop repo
ws_copy :
	@cp -u cheatsheet.* $(WORKSHOP_DIR)/
	@cp -u slides.* $(WORKSHOP_DIR)/
