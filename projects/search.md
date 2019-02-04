---
layout: project
category: proyect
title: Search
description:
---

<h3>By Keyword</h3>
<!-- Html Elements for Search -->
<div class="search-container">
<input type="text" class="search-input" placeholder="search...">
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
  json: "{{site.url}}{{site.baseurl}}/search.json",
})
</script>

<h3>By Author</h3>
 {::nomarkdown}
    <ul>
    {% assign authors = site.data.members | sort %}
    <div class="display-inline">
      {% for author in authors %}
          <div class="author-container">
            <div class="photo-author">
              <a href="{{site.url}}{{site.baseurl}}/author/{{author[0]}}">
                <img src="{{site.url}}{{site.baseurl}}/assets/placeholder-180x250.gif" alt="" width="178" height="250">
              </a>
              <div class="author-name">{{author[1].name}}</div>
            </div>
          </div>
      {% endfor %}
    </div>
    </ul>
{:/nomarkdown}
