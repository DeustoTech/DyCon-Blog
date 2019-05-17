---
category: proyect
title: info
description:
layout: info
---



<h1>Upcoming posts</h1>

{% assign qposts = site.posts | where:"layout","pretutorial"|sort %}

{% for post in qposts %}

{% assign thedate = post.date | date: "%d-%B-%Y" %}

<h4 class="headline"><a href="{{site.url}}{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></h4>   
<p>Author{% if post.author.size > 1 %}s{% endif %}:
      {% assign counter = 0 %}
      {% for aut in post.author %}
           {% assign counter = counter | plus: 1 %}
<a href="{{site.url}}{{site.baseurl}}/author/{{aut}}">{{site.data.members[aut].name}}</a>{% unless post.author.size == counter %},{% endunless %}
      {% endfor %} - {{thedate}}</p>
<div class="ellipsis-two-lines">
{{ post.description }}
</div>
<hr>
{% endfor %}







<h1>Posts by month</h1>

{% assign thedate = '' %}
{% assign qposts = site.posts | where:"layout","tutorial"|sort |reverse %}

{% for post in qposts %}
{% assign postthedate = post.date | date: "%m-%Y" %}
{% if thedate != postthedate %}
<h3>{{ post.date |date: "%B-%Y" }}</h3>
{% endif %}

{% assign thedate = post.date | date: "%m-%Y" %}

{% assign thedateprint = post.date | date: "%d-%B-%Y" %}

<h4 class="headline"><a href="{{site.url}}{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></h4>   
<p>Author{% if post.author.size > 1 %}s{% endif %}:
      {% assign counter = 0 %}
      {% for aut in post.author %}
           {% assign counter = counter | plus: 1 %}
<a href="{{site.url}}{{site.baseurl}}/author/{{aut}}">{{site.data.members[aut].name}}</a>{% unless post.author.size == counter %},{% endunless %}
      {% endfor %} - {{thedateprint}}</p>
<div class="ellipsis-two-lines">
{{ post.description }}
</div>
<hr>

{% endfor %}