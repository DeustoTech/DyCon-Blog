---
category: proyect
title: info
description:
layout: info
---

<h2>Search by Keyword</h2>
<div class="container">
  <div id="search-container" class="search-container">
  <input type="text" class="search-input" id="search-input" placeholder="search...">
  </div>
  <ul id="results-container"></ul>
  <script src="{{site.url}}{{site.baseurl}}/js/simple-jekyll-search.min.js"></script>
  <script>
  SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    searchResultTemplate: '{% include card.min.html avatar="{avatar}" title="{title}" author="{author}" url="{url}" description="{description}" %}',
    resultsContainer: document.getElementById('results-container'),
    json: '{{site.url}}{{site.baseurl}}/search.json',
  })
  </script>
</div>

<h1>Posts by month</h1>



{% assign thedate = '' %}
{% assign qposts = site.posts | where:"layout","tutorial"|sort |reverse %}
{% assign counterpost = 0 %}

{% for post in qposts %}
{% assign postthedate = post.date | date: "%m-%Y" %}
{% if thedate != postthedate %}
{% assign counterpost = 0 %}
<h2>{{ post.date |date: "%B-%Y" }}</h2>
{% endif %}
{% assign counterpost = counterpost | plus: 1 %}

{% assign thedate = post.date | date: "%m-%Y" %}

{% assign thedateprint = post.date | date: "%d-%B-%Y" %}

<h4 class="headline">{{counterpost}}.- <a href="{{site.url}}{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></h4>   
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

