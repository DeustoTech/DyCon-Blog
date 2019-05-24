---
category: proyect
title: info
description:
layout: info
---


<h1>Posts by month</h1>



{% assign thedate = '' %}
{% assign qposts = site.posts | where:"layout","tutorial"|sort |reverse %}
{% assign counterpost = 0 %}

{% for post in qposts %}
{% assign postthedate = post.date | date: "%m-%Y" %}
{% if thedate != postthedate %}
{% assign counterpost = 0 %}
<h2>{{ post.date |date: "%B-%Y" }}</h2>
{% endif %}
{% assign counterpost = counterpost | plus: 1 %}

{% assign thedate = post.date | date: "%m-%Y" %}

{% assign thedateprint = post.date | date: "%d-%B-%Y" %}

<h4 class="headline">{{counterpost}}.- <a href="{{site.url}}{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></h4>   
<p>Author{% if post.author.size > 1 %}s{% endif %}:
      {% assign counter = 0 %}
      {% for aut in post.author %}
           {% assign counter = counter | plus: 1 %}
<a href="{{site.url}}{{site.baseurl}}/author/{{aut}}">{{site.data.members[aut].name}}</a>{% unless post.author.size == counter %},{% endunless %}
      {% endfor %} - {{thedateprint}}</p>
<div class="ellipsis-two-lines">
{{ post.description }}
</div>
<hr>

{% endfor %}


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script src="https://api.trello.com/1/client.js?key={3a23f3aa77c478895126e5f47ea61b48}"></script>

<script>
    var myList = 'INSERT YOUR IDLIST HERE';

var creationSuccess = function (data) {
  console.log('Card created successfully.');
  console.log(JSON.stringify(data, null, 2));
};

var newCard = {
  name: 'New Test Card', 
  desc: 'This is the description of our new card.',
  // Place this card at the top of our list 
  idList: myList,
  pos: 'top'
};

window.Trello.post('/cards/', newCard, creationSuccess);  
</script>
