---
layout: project
category: proyect
title: Posts
description: Transmitting the results to other researchers, not specialists in control theory, can be difficult. Even among experts on the subject of sharing software is complicated. Here is a series of tutorials for faithful and easy reproduction of mathematical results.
---
 {::nomarkdown}

 <table style="text-align:center;">
    <tr>
      <th>Topic</th>
      <th>Description</th>
      <th>Nº of Tutorials</th>

    </tr>
    {% for topic in site.data.WorkPackages %}
    <tr>
      <th>
          <a href="{{site.url}}{{site.baseurl}}/WorkPackage/{{topic[0]}}" class="display-block">
                {%- assign qposts = site.posts | where:"layout","tutorial" -%}
                {%- assign qposts = qposts | where:"categories",topic[0] -%}
              {{topic[1].name}}
          </a>  
      </th>
      <th>{{topic[1].little_description}}</th>
      <th>[<small>{{ qposts | size }}</small>]</th>
    </tr>
    {% endfor %}
   <table>

{:/nomarkdown} 