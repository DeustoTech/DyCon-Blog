---
layout: project
category: proyect
title: Search
description: 
---

<h3>By Author</h3>
<p>Severals Authors</p>
 {::nomarkdown}
    <ul>
    {% assign authors = site.data.members | sort %}
    {% for author in authors %}
      <li><a href="{{site.url}}{{site.baseurl}}/author/{{author[0]}}">{{author[1].name}}</li>
    {% endfor %}
    </ul>
{:/nomarkdown}

