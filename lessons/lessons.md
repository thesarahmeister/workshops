---
layout: page
sidebar: true
title: Lessons
permalink: lessons/
---

> Hello and welcome to our Code As Manuscript site for data analysis
> and coding-related workshops!  This page contains links to
> pre-workshop instructions, lesson material, and our teaching goals.

# Instructions #

Please check our [instructions](instructions/) before coming
to the workshops.  There will be instructions on what to install and
how to install it.  We **strongly** encourage you to do this *before*
coming to the workshops as doing this during the workshops will delay
the planned workshop material and slow everyone else down.  Given
that, there are times when you may run into difficults while
installing something.  In those cases, we will be at the workshop
20-30 minutes beforehand and if you need any assistance, *please*
come then and we will help out as much as we can!

# Lessons #

Our four primary workshops include learning about Git, GitHub, SAS
macros, and SAS ODS.  We hope to eventually develop a series that
focuses on R, however, given that a large majority of (at least
biomedical) researchers use SAS, we've developed the SAS workshops
first.

Our lesson material:

## Our lesson material: ##

{% for cat in site.lesson-list %} 

### {{ cat }}: ###

<ul>
  {% for page in site.pages %} <!-- search all pages -->
      {% for pc in page.categories %} <!-- search categories -->
        {% if pc == cat %} <!-- compare category to config list -->
          <li><a href="{{ site.github.url }}{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}
      {% endfor %}
  {% endfor %}
</ul>
{% endfor %}
