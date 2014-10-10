# Cheatsheet: Useful (and common) Git commands #

Git is an amazing and very powerful tool that is useful for managing your projects and tools.  However, because of its power and usefulness, it can be confusing for beginners because of the need to use the command line (or terminal) to run Git commands as well as the large number of commands and options available.  So, we put together the commands that are the most useful and most common --- and the only ones you may ever use!

## Git commands: ##

**git clone <repository>** ---

 :  Take an existing git repository (aka project, aka folders and
    files) and duplicate/copy/clone it.  For example, I have a folder
    called `diabetesAndObesity` that contains all of my data,
    analysis, and manuscript on my research regarding diabetes and
    obesity.  If you wanted to collaborate with me on the project, you
    would run `git clone` on my project to copy all of the files and
    folders and Git history into your computer.

**git remote add <name> <server-name>** ---

 :  `remote` is the name used to describe your Git project that you
    want to store on the server such as Github.  Think of `remote` as
    your external hard drive, like Dropbox, or like the cloud.  If you
    want to save your Git project files and folders, you can create a
    remote for it.  If you use Github or some of cloud-based service,
    usually they provide pretty good instructions on what to do.  For
    example, if you wanted to save (aka `push`) your Git project files
    to Github, you would copy this command into you terminal/shell/Git
    Bash:

    ```
        git remote add origin git://github.com/yourname/yourproject.git
    ```

**git log** ---

 :  Log

**git status** ---

:  Status

**git add <files>** ---

:  Log

**git commit** ---

:  Log

**git init** ---

:  Log

**git push <remote-name> <your-branch>** ---

:  Log

**git pull** ---

:  Log

**git checkout** ---

:  Log

**git branch** ---

:  Log

**git diff <commit-id> <file>** ---

:  Log
