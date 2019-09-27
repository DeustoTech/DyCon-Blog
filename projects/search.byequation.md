---
layout: WebSiteMap
category: proyect
title: Sitemap
position: 3
description: 
---

<!-- <h2>Search by Keyword</h2>

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
</script> -->


{::nomarkdown}
  {% for topic in site.data.Equation %}
    {%- assign qposts = site.posts | where:"layout", "tutorial" | where:"equation", topic[0] -%}
    <a href="#">
      <h5 class="topic-title dark-grey">{{topic[1].name}}</h5>
    </a> 
    <ul> 
    {% for post in qposts  %}
      <li><a href="{{site.url}}{{site.baseurl}}/{{post.url}}">{{post.title}}</a></li>
    {% endfor %}
    </ul>
  {% endfor %}


    <!-- {%- assign qposts = site.posts | where:"layout", "tutorial" -%}
   <a href="#">
      <h5 class="topic-title dark-grey">Other</h5>
    </a> 
    <ul> 
    {% for post in qposts  %}
      {% assign n = post.equation | size %}
      {%- if n == 0 -%}
      <li><a href="{{site.url}}{{site.baseurl}}/{{post.url}}">{{post.title}}</a></li>
      {%- endif -%}
    {% endfor %}
    </ul> -->

{:/nomarkdown}