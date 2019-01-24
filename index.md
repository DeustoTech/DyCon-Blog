---
layout: default
---

<header class="intro-header">
  <div class="container">
    <div class="col-md-10 col-md-offset-1">
      <div class="site-heading">
        <img class="index-img" src="{{site.url}}/{{site.baseurl}}/assets/logo_DyCon.png" width="30%" alt="" srcset="">
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
    <h1 class="h1-title">Recent Post</h1>    
    {% assign qposts = site.posts | where:"layout","tutorial"|sort |reverse%}
    {% assign MaxPostView = 3 %}
    {% for i in (1..MaxPostView) %}
      {% assign post = qposts[i] %}
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
    <h3 class="see-more"><a href="{{site.url}}{{site.baseurl}}/projects/posts">See more ...</a></h3>
  </div>
</div>
