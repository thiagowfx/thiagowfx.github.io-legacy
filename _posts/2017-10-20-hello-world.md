---
title: "Hello World"
category: meta
tags: meta
published: true
description: |
  Your average <i>Hello world!</i> introductory post.
excerpt: |
  Your average <i>Hello world!</i> introductory post.
last_modified_at: 2017-10-24
---

Table of Contents
-----------------
{:.no_toc}

* Auto-generated table of contents
{:toc}

Unicode test
------------

Hello, 世界! :unicorn:

Syntax Highlight test
---------------------

```cpp
#include <iostream>

int main() {
    std::cout << "Hello world!" << std::endl;
    return 0;
}
```

Itemization test
----------------

- Item #1
- Item #2

Enumeration test
----------------

1. Item #1
1. Item #2

Markup test
-----------

This is *italic*, this is **bold**.

Hyperlink test
--------------

[This](/) is an inline to the homepage. <br/>
[This][1] is a reference link to the homepage. <br/>
[This]({% post_url 2017-10-20-hello-world %}) is a self-link to this post.

[1]: /

Footnotes test
--------------

This[^alpha] should contain a footnote. Here[^bravo] is another one.

[^alpha]: footnote text should be here.
[^bravo]: another footnote.

Line separator test
-------------------

Here follows a horizontal separator.

---

There was it!

Image test
----------

<!-- This image is too big for this context. -->

<!-- ![This is me][me] -->

<!-- : [me]: {{ "/assets/images/me.jpg" | relative_url }} -->

<img src="{{ "/assets/images/me.jpg" | relative_url }}" width="50" />
