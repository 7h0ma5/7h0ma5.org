---
title: Home
layout: default
---

## Blog
<ul class="postlist">
{% for post in site.posts limit: 3 %}
  <li><span>{{post.date | date: "%d.%m.%Y"}}</span> &raquo; <a href="{{post.url}}">{{post.title}}</a></li>
{% endfor %}
</ul>

[Mehr &rarr;](/blog.html)

# Projekte
- **proty** prototype based programming language ([Website](http://proty.cc), [GitHub](http://github.com/proty/proty))
- **ttris** simple tetris clone ([GitHub](http://github.com/7h0ma5/ttris))
