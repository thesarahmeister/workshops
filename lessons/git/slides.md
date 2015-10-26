---
title: "Let's 'Git' started: Using version control"
author: Luke W. Johnston
date: 2015-10
layout: page
sidebar: false
tag:
    - Lessons
    - Slides
    - Git
categories:
    - Lessons
    - Git
output: slidy_presentation
---

## 

![](/lessons/images/filenamingComic.gif)

## Learning expectations ##

- How to use version control for your work
- How to collaborate with others on a project
- Have a basic understanding of how Git and GitHub works
- *Know where to go for help*

## 5 main concepts ##

- **Start repository**: git init, git clone (GitHub)
- **Check activity**: git status, git log, git diff
- **Save to history**: git add, git commit
- **Move through the history**: git checkout
- **Synchronizing with GitHub**: git push, git pull

## Visualization of how Git saves images ##

![Taken from the [Git site](http://git-scm.com/book/en/v2/Getting-Started-Git-Basics)](/lessons/images/vcs-Snapshot.png)

## Actual visualization of Git history ##

![](http://marklodato.github.io/visual-git-guide/conventions.svg.png)

## Different areas Git uses ##

![](http://marklodato.github.io/visual-git-guide/basic-usage.svg.png)

## Configuring Git ##

```
git config --global user.name "Your Name"
git config --global user.email "you@some.domain"
git config --global color.ui "auto"
git config --global core.editor "your_editor"
git config --global push.default current
git config --list
```

## How GitHub works ##

![](/lessons/images/GitHubFlow.png)

## How GitHub Forking (collaboration) works ##

![](/lesson/images/GitHubForkFlow.png)

## Generate these slides using (using R): ##


{% highlight r %}
rmarkdown::render('slides.Rmd')
{% endhighlight %}
