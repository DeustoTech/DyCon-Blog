---
layout: default
---

<header class="intro-header">
  <div class="container">
    <div class="col-md-10 col-md-offset-1">
      <div class="site-heading">
        <img style="padding-top: 100px;" src="{{site.url}}/{{site.baseurl}}/assets/logo_DyCon.png" width="30%" alt="" srcset="">
        <hr class="small">
        <span class="subheading">One of the main outputs of the research conducted within DyCon is the development of new computational methods and tools (algorithms, tutorials, sample codes, software and simulations), all of which are being integrated in a computational platform. This page offers a higher layer of the work that is currently taking place inside the DyCon team.
        </span>
        <hr>
      </div>
    </div>
  </div>
</header>


<div class="container">
    <div class="col-md-10 col-md-offset-1">
        <h1>Recent Post</h1>    
        {% assign qposts = site.posts | where:"layout","tutorial"|sort |reverse%}

        {% assign MaxPostView = 3 %}

        {% for i in (1..MaxPostView) %}

          {% assign post = qposts[i] %}
          <div class="post-preview shadowbox">
              <a href="{{ post.url | prepend: site.baseurl }}" class="display-block">
                  <h4> {{ post.title }} </h4>
              </a>
              <p class="post-subtitle">
                  {{ post.description }}
              </p>
              <small style="color:grey">
                  Author(s):
                  {% for aut in post.author %}
                      <a href="{{site.url}}{{site.baseurl}}/author/{{aut}}">{{site.data.members[aut].name}}</a>
                  {% endfor %}
                  - {{post.date|date_to_long_string}}
              </small>

          </div>
        {% endfor %}
        <h3><a href="{{site.url}}{{site.baseurl}}/projects/posts">See more ...</a></h3>
  </div>
</div>
