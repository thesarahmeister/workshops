# Can we use the SAS university edition for workshops? #

We are looking into that.  But probably!

# I have a Mac, can I use SAS? #

With the SAS University Edition you can.  We personally have not tried
it, but it does say it can work for Mac's.

# How do I install SAS on a laptop without a CD drive? #

If you bought the SAS CD, it comes with a License key that you can use
to download SAS using the SAS Download Manager.

# Message `sh.exe: nano: command not found`. Help? #

> I was just practicing what we’ve done last Tuesday and I am getting
> this message for nano command: sh.exe”: nano: command not found. It
> worked well in class, but is not working now. Would you happen to know
> the solution?  I did specify at the beginning git config --global
> core.editor "notepad"

Thanks for your question. Looks like your git was configured to use
Notepad as the text editor, not Nano. Try replacing "nano" with
"notepad" in your code and see if that works.

# What is a repository? #

> What exactly a repository is? Is it that folder we created named
> “practice”?

A repository is a history of all your commits. Everytime you do `git
commit`, it saves the files you are committing into the
repository. The physical repository is the `.git` folder, but it
tracks everything in that folder (the "practice" folder).

# Why do we need to check the repo's status so often? #

Checking often is important to make sure you are aware of what is
going on in your repository.

# What exactly the "untracked" means? #

"Untracked" means that the file is seen by git, but is not
followed. So any changes to the file will not be recognized by git
*until* you follow it (track it).  (Like following people on Facebook
or twitter.  They exist when you aren't following them, but you don't
keep updated on their status or what they are doing.).

# What happens with the saved files but not committed? #

Saved files (`git add` you mean?) are put into the staging area so
that they can be committed into the history (the git repository). If
you don't commit them, they stay there, but they do *not* go into the
history. Modified files (when you *don't* `git add` them, continue to
stay modified as you edit them, but they do not get saved until you do
`git add` and `git commit`.

# 'No new line at the end of file' after running `git diff` #

This can easily be fixed by pressing Enter at the bottom of the file.
This occurs because (more or less) Git follows the Unix convention.
If you want a more detailed answer, see
[this answer on the why](http://stackoverflow.com/a/5813359/2632184)
and
[this answer on the history of why](http://stackoverflow.com/questions/729692/why-should-files-end-with-a-newline).

# My terminal is stuck and I can't get back to the prompt (`$` or `>`) #

If you ever get stuck in the terminal, hit `Control-c` to 'c'ancel the
command and get back to the prompt (the `$` or `>` characters).


