---
layout: project
category: proyect
title: Posts
description: Here you will find the whole list of tutorials and guides created and developed by the researcher's working in the DyCon ERC Project. All of the content has been classified according to the project’s corresponding working packages.

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
    {% for post in qposts limit:3 %}
      {% unless post %}
        {% continue %}
      {% endunless %}
      {% include card.html title       = post.title
                           url         = post.url
                           author      = post.author
                           description = post.description
                           avatar      = post.avatar
                           date        = post.date %}
    {% endfor %}
  <h3 class="see-more"><a href="{{site.url}}{{site.baseurl}}/workpackage/{{topic[0]}}">See more of {{topic[1].acr}}...</a></h3>
  {% endfor %}
{:/nomarkdown}
