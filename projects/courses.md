---
layout: project
category: proyect
title: Courses
position: 1
description: Course of CMC

---
{::nomarkdown}
  {% for topic in site.data.Courses %}
    {%- assign qposts = site.posts | where:"layout", "tutorial" | where:"categories", topic[0] -%}
    <a href="{{site.url}}{{site.baseurl}}/course/{{topic[0]}}">

      <h2 class="topic-title dark-grey">{{topic[1].name}}</h2>

    </a>  
    {{topic[1].description}}
    <hr>
  {% endfor %}
{:/nomarkdown}
