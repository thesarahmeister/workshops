---
title: "Let's 'Git' started: An introduction to version control"
date: 2014-11
author: Luke & Daiva
classoption: xcolor=dvipsnames
output:
    beamer_presentation:
        slide_level: 1
header-includes:
    - \input{opt/slideOptions.tex}
    
---


# Slide 1 #

* Welcome to our Data-related workshop*

Purpose: To teach a few tips and tricks for more efficiently managing your data, tracking your computer files, understanding appropriate analytical approaches, and speeding up the process from code to tables. 

Significance: Topics we cover will help you get more comfortable with data, reduce the chance of overlooked errors, and give you more control over your work. They are also all important parts of a science movement gaining increasing attention -- Reproducible Research.


# Slide 2 #

*Overview of Some Workshop Topics*

Workshop 1: Let's "Git" started! An introduction to version control

Workshop 2: Know your data and how to handle it correctly: Statistical
assumptions

Workshop 3: Fighting chaos: Coding tricks to keep your analysis -- and
mind -- sane

Workshop 4: Visual exploration (of data): Techniques and code to
better understand your data using plots and graphs

.....Code Review Club

# Slide 3 #
*Help with Statistics*
http://www.utstat.toronto.edu/wordpress/?page_id=25

# Slide 4 #

*Reproducible Research*

Definition

PLOS paper (Greg Wilson)

# Slide 5 #

*Filenaming Rules*

1) Keep the names short, but meaningful. Remove unnecessary words such as the, and, a, etc.

2) Don't include spaces and avoid underscores. For a string of words, capitalize the first letter of each word, except for the first word (e.g. "fileNameDescription")

3) Use hyphens to separate important parts of the name or when there is an abbreviation followed by another word (e.g. "diabetesRisk-AnalysisOutput" which separates the two concepts, the project descriptor ["diabetesRisk"] and the contents of the file ["AnalysisOutput"], or "report-AnalysisFoodIntake-2014.pdf" and not "reportAnalysisFoodIntake2014.pdf").

4) Avoid redundancy in file names and file paths (e.g. folderName/fileName-folderName.txt, instead use folderName/file.Name.txt or "diabetesSatFats/analysis-DiabetesSatFats.sas", use "diabetesSatFats/analysis.sas")

5) If a number is included in the filename, such as for the version number, use two digits not one (e.g. V01, not V1).

6) When including a date, include it at the very end of the filename and in the international standard format YYYY-MM-DD. 

# Slide 6 #

What happens when your files aren't organized? (Can we include a funny screenshot of a super cluttered folder with crazy file names -- e.g. Thesis_Proposal_Draft, Thesis_Proposal_FINAL, Thesis_Proposal_FINAL2, Thesis_Proposal_FINAL_FINAL)

-Maybe add another slide after this with points about what could happen (errors, difficulty keeping track of edits, more files to back-up...)

# Slide 7 #

*Solution: Version Control*
Define VC
Explain Git (brief history of how it came to be, how it is used, Git Repo)

# Slide 8 #

*Git*
Some common git codes and their functions, can verbally explain analogies to familiar tasks (e.g. "cd")

# Slide 9 #
*GitHub*
Have students make an account
State that this can be used to back-up files
Go through mini exercise of pushing/pulling a txt file -- will have to explain why we are tracking txt files and why it is a good idea to get into the habit of using txt files.

# Slide 10 #
*Main Exercise*