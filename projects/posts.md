---
layout: project
category: proyect
title: Posts
description: Transmitting the results to other researchers, not specialists in control theory, can be difficult. Even among experts on the subject of sharing software is complicated. Here is a series of tutorials for faithful and easy reproduction of mathematical results.
---
 {::nomarkdown}


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