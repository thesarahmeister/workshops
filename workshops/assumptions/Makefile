
#-------------------------------------------------------------------
# Custom Make variables

# The location of the `playing` directory for the workshop
WORKSHOP_DIR = ../../../statAssumptionsWS

# Directory for the emails
EMAILS_DIR = ./emails

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

## emails     : Create the email files in a prettier format (html)
emails :
	$(MAKE) -C $(EMAILS_DIR)

## ws_copy    : Copy these files over into the workshop repo
ws_copy :
	@cp -u cheatsheet.* $(WORKSHOP_DIR)/
	@cp -u slides.* $(WORKSHOP_DIR)/
