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
      <h3 class="topic-title">{{topic[1].name}}</h3>
      {% for post in qposts %}
        <!--div class="shadowbox">
        <a href="{{site.url}}{{site.baseurl}}{{post.url}}"><h5>{{post.title}}</h5></a>
        <p>{{post.description}}</p>
        </div-->
        <div class="post-preview shadowbox">
          <div class="post-avatar">
          {% if post.avatar %}
          <img src="{{ post.avatar }}">
          {% else %}
          <img src="https://www.serautonomo.net/wp-content/plugins/sp-amp/placeholder.png">
          {% endif %}
          </div>
          <div class="post-info">
            <a href="{{ post.url | prepend: site.baseurl }}" class="display-block">
              <h4 class="post-preview-title ellipsis-two-lines"> {{ post.title }} </h4>
            </a>
            <div class="post-preview-subtitle ellipsis-two-lines">
              {{ post.description }}
            </div>
            <div class="post-preview-authors ellipsis-one-line">
              Author(s):
              {% for aut in post.author %}
                  <a href="{{site.url}}{{site.baseurl}}/author/{{aut}}">{{site.data.members[aut].name}}</a>
              {% endfor %}
              - {{post.date|date_to_long_string}}
            </div>
          </div>
        </div>
      {% endfor %}
    {% endfor %}
{:/nomarkdown}
