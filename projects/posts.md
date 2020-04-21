---
layout: project
category: proyect
title: Documentation
position: 1
description: Here you will find the whole list of guides and tutorials developed by the <a href="/projects/authors" target="_blank">DyCon ERC Project's research team and visitors</a>. All of the content has been classified according to the <a href="https://cmc.deusto.eus/work-packages/" target="_blank">project’s Work Packages</a>.

---
{::nomarkdown}
  {% for topic in site.data.WorkPackages %}
    {%- assign qposts = site.posts | where:"layout", "tutorial" | where:"categories", topic[0] -%}
    <a href="{{site.url}}{{site.baseurl}}/workpackage/{{topic[0]}}">
    {% if topic[1].wp and topic[1].acr %}
      <h2 class="topic-title dark-grey">{{topic[1].wp}}: {{topic[1].name}} ({{topic[1].acr}})</h2>
    {% else %}
      <h2 class="topic-title dark-grey">{{topic[1].name}}</h2>
    {% endif %}
    </a>  
    {% for post in qposts limit:2 %}
      {% unless post %}
        {% continue %}
      {% endunless %}
      {% include card.html
        title       = post.title
        url         = post.url
        author      = post.author
        description = post.description
        avatar      = post.avatar
        date        = post.date
        code        = post.code
      %}
    {% endfor %}
    <div>
      <h3 class="see-more" style="padding-left: 85%;" ><a href="{{site.url}}{{site.baseurl}}/workpackage/{{topic[0]}}">See more...</a></h3>
    </div>
    <hr>
    <hr>
  {% endfor %}
{:/nomarkdown}
