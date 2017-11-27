---
layout: default
---

<article class="home">
    <a href="{{ "/" | relative_url }}"><h1>{{ site.title }}</h1></a>

    Hi, I'm {{ site.author.name }}. Welcome to <i>{{ site.title }}</i>!

    <hr />

    <p style="text-align: center;">

    <a href="https://stackexchange.com/users/1934732/thiagowfx"><img src="https://stackexchange.com/users/flair/1934732.png" width="208" height="58" alt="profile for thiagowfx on Stack Exchange, a network of free, community-driven Q&amp;A sites" title="profile for thiagowfx on Stack Exchange, a network of free, community-driven Q&amp;A sites" /></a>

    <a href="https://projecteuler.net/profile/thiagowfx.png"><img alt="Project Euler" height="58" src="https://projecteuler.net/profile/thiagowfx.png"/></a>

    </p>

    <hr />

    <p>Here's the list of my posts. You can <span class="rss-subscribe">subscribe to them <a href="{{ "/feed.atom" | relative_url }}">via Atom</a></span>!</p>

    {% include post-list.html posts=site.posts %}
</article>
