---
category: proyect
title: typo
description:
layout: default
---
{% for post in site.posts %}
    {{post.content}}
{% endfor %}

{% for author in site.data.members %}
    {{author[1].description}}
{% endfor %} 