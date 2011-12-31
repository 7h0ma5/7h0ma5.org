---
layout: page
title: Blog
---
<ul class="postlist">
{% for post in site.posts %}
  <li><span>{{post.date | date: "%d.%m.%Y"}}</span> &raquo; <a href="{{post.url}}">{{post.title}}</a></li>
{% endfor %}
</ul>
