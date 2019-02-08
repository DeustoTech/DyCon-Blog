---
layout: project
category: proyect
title: Posts
description: One of the main outputs of the research conducted within DyCon is the development of new computational methods and tools (algorithms, tutorials, sample codes, software and simulations), all of which are being integrated in a computational platform. This page offers a higher layer of the work that is currently taking place inside the DyCon team.

---

 {::nomarkdown}
All of the content has been classified according to the project’s corresponding working packages:
    {% for topic in site.data.WorkPackages %}
      {%- assign qposts = site.posts | where:"layout","tutorial"| where:"categories",topic[0] -%}
      <a href="{{site.url}}{{site.baseurl}}/workpackage/{{topic[0]}}">
        <h2 class="topic-title">{{topic[1].name}}</h2>
      </a>  
      {% for post in qposts limit:2 %}
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
    <h3 class="see-more"><a href="{{site.url}}{{site.baseurl}}/workpackage/{{topic[0]}}">See more ...</a></h3>
    {% endfor %}
{:/nomarkdown}
