---
layout: project
category: proyect
title: Search
description: 
---

<h3>By Keyword</h3>
<!-- Html Elements for Search -->
<div id="search-container">
<input type="text" id="search-input" placeholder="search...">
<ul id="results-container"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="{{site.url}}{{site.baseurl}}/js/simple-jekyll-search.min.js"></script>

<!-- Configuration -->
<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  searchResultTemplate: '{% include card.min.html title="{title}" author="{author}" url="{url}" description="{description}"%}',
  resultsContainer: document.getElementById('results-container'),
  json: '{{site.url}}{{site.baseurl}}/search.json',
})
</script>



<h3>By Author</h3>
<p>Severals Authors</p>
 {::nomarkdown}
    <ul>
    {% assign authors = site.data.members | sort %}
    {% for author in authors %}
      <li><a href="{{site.url}}{{site.baseurl}}/author/{{author[0]}}">{{author[1].name}}</a></li>
    {% endfor %}
    </ul>
{:/nomarkdown}