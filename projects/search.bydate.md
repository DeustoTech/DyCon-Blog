---
layout: WebSiteMap
category: proyect
title: Sitemap
position: 3
description: 
---

<ul>
{% assign thedate = '' %}
{% assign qposts = site.posts | where:"layout","tutorial"|sort |reverse %}
{% assign counterpost = 0 %}

{% for post in qposts %}
{% assign postthedate = post.date | date: "%m-%Y" %}
{% if thedate != postthedate %}
{% assign counterpost = 0 %}
</ul>
<h5>{{ post.date |date: "%B-%Y" }}</h5>
<ul>
{% endif %}
{% assign counterpost = counterpost | plus: 1 %}

{% assign thedate = post.date | date: "%m-%Y" %}


<li><a href="{{site.url}}{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></li>

{% endfor %}</ul>
