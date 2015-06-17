## <- this is a comment (number sign: #)

## NOTE: In the terminal there is tab-completion = completes the
## command you are typing if you hit the TAB key.  Hit it two hits in
## a row and it shows you options of what to type.  Also, up arrow
## goes to the last command you entered.

## Type this into your terminal to config your git.  NOTE you only
## need to do this once!!
git config --global user.name "Your Name"
git config --global user.email "you@some.domain"
git config --global color.ui "auto"
git config --global core.editor "your_editor" 
## your_editor could be notepad, textmate, nano, etc.
git config --global push.default current
git config --list

## cd = change directory (folder; move to another folder)
## ~ = home directory (in my /home/luke. C:/Users/)
cd ~/Desktop

## mkdir = make directory (create a folder)
mkdir practice
cd practice

## ls = list files in the folder
ls

## pwd = print working directory (show which folder you are in)
pwd

## init = creates an empty repository inside the folder you are in
git init

## touch = make a txt file (create a new file in the folder)
## replace 'your-name' with.. your own name
touch your-name-bio.txt

## status = check what's going on in the repository (repo)
git status

## add = put the new (or modified) file into the 'staging area' of git
## (does NOT commit to history)
git add your-name-bio.txt
git status

## commit = save everything in the 'staging' area into the git
## repository. -m = add a message to the commit. You ALWAYS need a
## message.
git commit -m "First commit (message here)"

## Open up the .txt file using nano (a text editor) to add some text
## to the file
nano your-name-bio.txt

## diff = compare the contents of the current file with the file in
## the previous commit (the one you just saved to the git history)
git diff your-name-bio.txt

## Add the modified file to the staging area and commit (save) it to
## the history.
git add your-name-bio.txt
git commit -m "Edited the bio file"

## This does the same thing as the two commands above. -a = add
## straight into the staging area and send to the commit history.
git commit -a -m "Commit all files that have been changed"

## log = view the history of your previous saved commits.
git log

## Make some edits to the file and commit to the history
git commit -am "Changed bio"

## branch = show all branches in the git repository.  Branches are
## basically like those on a tree.  For example, I could have a branch
## called analysis where I write up my main analysis, and another
## branch called experimenting where I play around with analyses I
## don't think will work or that I don't know if I'll use.  If I
## switch to the experimenting branch I can do anything I want to the
## analysis files, commiting them to the experimenting branch. Then
## when I move to the analysis branch, nothing will be changed, so I
## can keep my main analysis files intact.
git branch

## branch name = create a new branch called 'name', in this case it's
## called 'playing'
git branch playing

## checkout name = move to the branch 'name' (in this case, the
## playing branch)
git checkout playing

## Create a new file
touch playing-around.txt
nano playing-around.txt ## Make changes

## Save the new file to the history
git add playing-around.txt
git commit -m "Created a playing file"

## Move back to the master branch (there is always a master branch in
## a git repo)
git checkout master

## Go back three commits in the past. HEAD = the top of the branch,
## the last commit you did in the branch.
git checkout HEAD~2

## Move back to the master branch
git checkout master

## The -- = anything after this is a file. This takes the file from
## three commits ago ('HEAD~2') and brings it out of the history and
## into your folder.
git checkout HEAD~2 -- your-name-bio.txt

## If you 'git add'ed a file accidentally, this will put the file out
## of the 'staging' area.
git reset HEAD your-name-bio.txt
