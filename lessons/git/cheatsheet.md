---
title: "Cheatsheet: Git"
author:
    - Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Cheatsheet
    - Git
categories:
    - Lessons
    - Git
---

Git is an amazing and very powerful tool that is useful for managing
your projects and tools, letting you experiment and try out new things
in your files without worrying about losing anything.  However,
because of its power and usefulness, it can be confusing for beginners
as 1) Git requires the use of the command line (or terminal) to run
Git commands, and 2) there are a large number of commands and options
available.  So, we put together the commands that are the most useful
and most common --- and the only ones you may ever use!  Also, please check out
the [resources page](/lessons/resources) as it has links to very useful sites
and tutorials on learning Git.

As well, an added benefit of using Git is you can use the amazing
[GitHub](https://github.com/), a git repository hosting service, to keep an
online backup of your project and optionally share it with the world or with
your team.  There are increasing arguments and support for science to be more
open and publicly accessible.  GitHub can help with getting your code and/or
data out into the public domain.  Some of the below commands are used for
communicating with GitHub, though they are not exclusive to GitHub.

# Before using Git: Initial setup #

This following commands should be run first before any work is done
using Git.

    git config --global user.name "Your Name"
    git config --global user.email "you@some.domain"
    git config --global color.ui "auto"
    git config --global core.editor "your_editor"
    git config --global push.default simple
    git config --list

These commands basically tell Git:

* Who you are (`user.name`)
* What your email address is (`user.email`; used when working on a
  multiple person project)
* What the colour output should be after running Git commands
  (`color.ui`)
* What your **text** editor is that you use (`core.editor`).  See
  [our instructions](/lessons/instructions/) for more
  details about editors, but briefly:
  - On Windows, you will likely use
    [Notepad](http://en.wikipedia.org/wiki/Notepad_%28software%29)
    (which comes pre-installed on Windows) or
    [Notepad++](http://notepad-plus-plus.org/)
  - On Mac, there is
    [TextWrangler](http://www.macupdate.com/app/mac/11009/textwrangler)
    (which I believe comes pre-installed) or
    [TextMate](https://macromates.com/)
  - On Linux, it depends on which distro you use, but in general
    [gedit](https://help.ubuntu.com/community/gedit) or
    [nano](https://wiki.archlinux.org/index.php/Nano) usually are
    pre-installed
* How you want the push and pull default behaviour (`push.default`;
  more on this in the [GitHub lesson](/lessons/github/))

# Terminal commands (good to know before knowing Git) #

## Directory (terminology) ##

> A directory is the same thing as a folder.

## `cd path/to/directory` ##

> Change the current directory/folder to another directory/folder. The little
> tilde `~` means 'Home', so that would be `/home/username/` for Linux,
> `/Users/username/` for Mac, and `C:\Users\username\` on Windows.

> Example code:

    cd ~/Desktop # Change to the desktop
    cd /home/username/Documents/ # Change to documents.

## `mkdir directory-name/` ##

> Make (mk) a directory (dir) that has the name `directory-name`. This can be
> any name you want it to be.

> Example code:

    mkdir ~/Desktop/testing # Create a testing folder on your desktop
    mkdir playingAround/ # Make a folder in the current directory

## `ls` ##

> View the contents of the directory, showing files and sub-directories.

> Example code:

    ls ~/ # Show contents of home
    ls -a ~/ # Show hidden and non-hidden files

    # List files/directories by row, indicating which is a folder
    # l = list format option
    # h = human understandable bytes option
    # F = indicate which are folders with a `/` at the end
    ls -lhF ~/
    ls -l -h -F ~/ # Same as above

## `touch filename.txt` ##

> Create an empty text file in the current directory called 'filename.txt'.

> Example code:

    # All these do the same thing.
    touch filename.txt
    touch File.txt
    touch this-is-a-file.txt

## `command > filename.txt` ##

> Send the output into a file (in this case called 'filename.txt'.

> Example code:

    ls -lhF > filesInDirectory.txt # Send ls output to file
    echo 'This is a test' > testing.txt # Send to the file


# Useful (and common) Git commands #

## Repository (terminology) ##

> Not a command, but is the term used to describe all the saved history of a
> directory and files for a project that are tracked by Git. Is essentially the
> hidden `.git/` directory.

## `git init` ##

> Tell Git to start tracking a folder by creating a git history
> repository.  This essentially tells Git to start watching your
> folder and all the files and folders within it.

> Example code:

    ## Comment: cd = change directory (aka folder)
    cd ~/Documents/yourprojectname/
    git init

## `git status` ##

> Tell Git to list out all the activity within a folder under watch by
> Git (after using `git init`).  The status command will list all
> files or folders that have been added or changed inside the
> repository. 

> Example code:

    cd ~/Documents/yourprojectname/
    git status

## `git add <files>` ##

> Add the files you want Git to watch inside the history repository as
> created with `git init`.  You can specify as many or as little files
> or folders as you want.  *Note*: the add command does **not** save
> the files to the git history.  All the `git add` command does is
> tell Git to start watching the files and put the files into the
> "staging area" where they will next be saved to the history (see the
> below `git commit` command).

> Example code:

    ## Comment: cd to where files have been changed
    cd ~/Documents/yourprojectname/
    ## Comment: Pretending we want to add three files
    git add foldername/newfilename1 newfilename2 foldername2/changedfile

## `git commit` ##

> Tells Git to save your `git add`'ed files to its history.  This is
> the main purpose and use for Git.  After you commit a file(s) and
> typed out a commit message (*be detailed about what you did*!!), Git
> will save (or take a "snap shot") of your files and put it into its
> history.  Once committed, it is saved into the history, allowing you
> to go back to that commit/save point at any time!

> Example code:

    cd ~/Documents/yourprojectname/
    ## Comment: You have two options...
    ## Commit and let a text editor pop up so you can
    ## write your commit message
    git commit
    ## Comment: ... Or you can use the -m option
    git commit -m "Type out your commit message here"

## `git log` ##

> Displays the history of your repository and the messages you added
> to each commit, as well as the date of the change, and who made the
> change.  This is analogous to a logbook for those in the basic
> science.  This is a really useful feature if you are working on a
> multi-person project or if you are coming back to a project after
> several months of not touching it and completely forgetting what you
> were doing last.  `git log` has a *large* number of options
> available that customize the appearance and the information provided
> by the log command.

> Example code:

    cd ~/Documents/yourprojectname/
    git log
    
## `git checkout` ##

> Allows you to go back (or forward) throughout your Git history as
> well as to change branches (see the `git branch` command below).  If
> you wanted to go back a few commits, you would run `git checkout
> commitnumber`.  You get the commit number by running git log and
> using the first few letters and numbers of the commit.  We will
> likely show an example in the workshop.

> Example code:

    ## Comment: Go back to a previous commit (use the commit hash)
    git checkout d45gfd3 ## Example commit hash, found using git log
    ## Comment: Go to another branch (ie: "testing")
    git checkout testing
    ## Comment: Go back to your main branch ("master")
    git checkout master

## `git branch <branch-name>` ##

> This is another very useful command from Git, and (I feel) one of
> its biggest strengths!  This command basically makes a branch like
> on a tree, letting you experiment with your files and statistical
> analyses without having to worry about messing around with your main
> files.  If you want to eventually bring the experimental branch into
> the "master" branch, you can use
> [`git merge`](http://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
> (which we will not be covering as it is a slightly more advanced
> command).

> Example code:

    ## Create a branch named "experiment"
    git branch experiment
    ## Move to the experiment branch
    git checkout experiment
    ## edit your files and save, do whatever...
    git add changedfiles
    git commit -m "Added a statistical test with different variables"
    ## Move back to the master branch
    git checkout master
    ## All files should be in their original state

## `git diff <commit-id (optional)> <file(s)>` ##

> This command tells Git to compare the contents of, at the basic
> level, two files.  These two files are by default a file you most
> recently changed (but not committed) with the same file's content in
> the history.  However, you can also compare a file across different
> commits in the history.  `git diff` shows the differences between
> the files by highlighting in red deletions and in green additions to
> the file.  This is useful if you forgot what you changed in the file
> and you are going to commit the file into the history, using it to
> help you write a better commit messages.

> Example code:

    ## Compare a recently changed file with its recent
    ## commit history
    git diff filename
    ## Compare a file across two commits (using commit hashes)
    ## Usage: git diff hash1..hash2 file (hashes are *very* unique)
    git diff 54gfd..75g84 filename

# Git commands for dealing with GitHub/other hosting services #

## `git clone <repository-name>` ##

> Cloning is basically downloading a new git repository that is
> online/in GitHub.  You take an existing git repository and
> duplicate/copy/clone it onto your own computer.  For example, if you
> wanted the files for this workshop series, you would first fork our
> [GitHub Code As Manuscript workshop repo](https://github.com/codeasmanuscript/workshops)
> so you have your own copy of it on your account and then you clone
> it into your computer. 

> Example code:

    ## First fork our Code As Manuscript and then:
    cd /path/to/where/you/want/the/repo
    git clone https://github.com/your-name/workshops.git
    ## You now have the workshop files on your computer.

## `git remote add <name> <server-url>` ##

> A remote, in git terminology, is a server or online location.
> Remote is the opposite of local.  A remote repository is a
> repository that is *not* on your computer, while a local repository
> is.  Think of the remote as an external hard drive.  When you add a
> remote, you use a name (by convention the name is usually "origin",
> which I *strongly* encourage you to use as well) that will tell git
> that that is the remote name.  The server url can generally be found
> on the GitHub or BitBucket page, usually in the top or bottom right
> corner.  For instance, the server url for my own 'test' project
> would be `https://github.com/lwjohnst86/test.git`.  to describe your
> Git project that you want to store on the server such as Github.

> Example code:

    cd /path/to/your/git/repo
    ## The actual URL can be found on GitHub, usually in the corner.
    git remote add origin https://github.com/yourname/yourproject.git
    git push

## `git push` ##

> Push is essentially the same as uploading your local git repository
> to the remote (GitHub) repository.  Pushing is more powerful than a
> simple upload, as git checks the remote repository, compares it to
> the local repository, making sure that the integrity of the files is
> preserved and that nothing is lost or overwritten (unlike Dropbox
> for example).  This is especially important for your research files!

> Example code:

    cd /path/to/your/git/repo
    ## ... edit a file ...
    git commit -am "Edited a file"
    git push

## `git pull` ##

> This is essentially a command to download the remote (GitHub)
> repository contents and merge it into your own local git repository.
> This is only ever used if you a) work on a project that is only more
> than one computer and you use git and GitHub to sync the files
> across computers, or b) if you work on a team and one or more other
> person(s) are making changes to the remote (GitHub) repository.
> Pulling then syncs the updated remote content with your local
> content.  This is where git really shines when you collaborate with
> others on a project (ie: this workshop series)!

> Example code:

    cd /path/to/your/git/repo
    ## Someone has added stuff to the remote repo
    git pull

