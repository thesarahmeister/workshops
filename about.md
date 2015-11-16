---
layout: page
title: About
sidebar: true
permalink: /
---

<p class="message">

  <b>Code As Manuscript</b> is a group that teaches a series of workshops on
  rethinking how code and analyses are structured, and how to
  implement it.  Our mission is to provide training to researchers and
  scientists on how to make their analyses more reproducible and to
  change how researchers view their code.
  
</p>

We get much inspiration for our workshops from
[Software Carpentry (SWC)](http://software-carpentry.org/), of which
we are also SWC instructors.

Currently, we teach these workshops to graduate students in our home
department and are in the process of expanding to the
[Graduate Professional Skills program](http://www.sgs.utoronto.ca/currentstudents/Pages/Professional-Development.aspx)
at the University of Toronto.  Our material is in general split into
two parts:

* [Lesson content](lessons/)
* [GPS content](gps/), which also encompasses the lesson content

## Misc facts about this website ##

* Uses the [Hyde](http://hyde.getpoole.com/)
  [Jekyll](http://jekyllrb.com) theme
* Developed on GitHub and hosted for free on [GitHub Pages](https://pages.github.com)
* The content on our site is [licensed](LICENSE/) under CC-BY, while
  the website design is under MIT.  Check out our
  [license page](LICENSE/) for more info.

Have questions or suggestions? Feel free to
[open an issue on GitHub](https://github.com/codeasmanuscript/development/issues/new)
or email the *Code As Manuscript* instructors (<codeasmanuscript@gmail.com>) for
more information

# Site listing and content: #

{% for cat in site.category-list %}

## {{ cat }} ##

<ul>
  {% for page in site.pages %}
      {% for pc in page.categories %}
        {% if pc == cat %}
          <li><a href="{{ site.github.url }}{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}   <!-- cat-match-p -->
      {% endfor %}  <!-- page-category -->
  {% endfor %}  <!-- page -->
</ul>
{% endfor %}
