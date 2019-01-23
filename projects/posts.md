---
layout: project
category: proyect
title: Posts
description: One of the main outputs of the research conducted within DyCon is the development of new computational methods and tools (algorithms, tutorials, sample codes, software and simulations), all of which are being integrated in a computational platform. This page offers a higher layer of the work that is currently taking place inside the DyCon team.

---

 {::nomarkdown}

All of the content has been classified according to the project’s corresponding working packages:

    {% for topic in site.data.WorkPackages %}
        {%- assign qposts = site.posts | where:"layout","tutorial" -%}
        {%- assign qposts = qposts | where:"categories",topic[0] -%}
        <h3>{{topic[1].name}}</h3>
        {% for post in qposts %}
            <div class="shadowbox">
            <a href="{{site.url}}{{site.baseurl}}{{post.url}}"><h5>{{post.title}}</h5></a>
            <p>{{post.description}}</p>

            </div>
        {% endfor %}
    {% endfor %}

{:/nomarkdown} 