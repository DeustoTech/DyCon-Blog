---
layout: project
category: proyect
title: Authors
position: 2
description:
---


 {::nomarkdown}
 <div style="display: block;">
    <ul>
    {% assign authors = site.data.members | sort %}
      <div class="display-inline">
        {% for author in authors %}
          <div class="author-container">
            <div class="photo-author">
              <a href="{{site.url}}{{site.baseurl}}/author/{{author[0]}}">
                {% if author[1].avatar %}
                  <img src="{{author[1].avatar}}" class="search-avatar">
                {% else %}
                  <img src="{{site.url}}{{site.baseurl}}/assets/placeholder-180x250.gif" alt="" width="178" height="250">
                {% endif %}
              </a>
              <div class="author-name">{{author[1].name}}</div>
            </div>
          </div>
        {% endfor %}
      </div>
    </ul>
</div>
{:/nomarkdown}
