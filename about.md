---
layout: page
title: About
---

<p class="message">
  Our mission is to provide training to researchers and scientists on
  how to make their analyses more reproducible and to change how
  researchers view their code.
</p>

We get much inspiration for our workshops from
[Software Carpentry (SWC)](http://software-carpentry.org/), of which
we are also SWC instructors.

## Misc facts about this website ##

* Uses the [Hyde](http://hyde.getpoole.com/)
  [Jekyll](http://jekyllrb.com) theme
* Developed on GitHub and hosted for free on [GitHub Pages](https://pages.github.com)

Have questions or suggestions? Feel free to
[open an issue on GitHub](https://github.com/codeasmanuscript/development/issues/new)
or contact either Diava Nielsen (<daiva.nielsen@gmail.com>) or Luke
Johnston (<lwjohnst@gmail.com>) for more information.

# Lesson content list:

{% for cat in site.category-list %}

## {{ cat }} ##

<ul>
  {% for page in site.pages %}
      {% for pc in page.categories %}
        {% if pc == cat %}
          <li><a href="{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}   <!-- cat-match-p -->
      {% endfor %}  <!-- page-category -->
  {% endfor %}  <!-- page -->
</ul>
{% endfor %}
