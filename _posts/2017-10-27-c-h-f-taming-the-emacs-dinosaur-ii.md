---
title: "C-h f Taming-the-Emacs-Dinosaur - II"
category: tools
tags: emacs
published: true
description: |
  Bootstrapping an emacs config <i>with style</i>.
---

In our [last post](https://thiagoperrotta.wordpress.com/2017/10/12/c-h-f-taming-the-emacs-dinosaur-i/) of this series, I have declared my intentions and objectives to achieve a decent emacs workflow and environment. Now, in this post, I will document how I have done it.

Package manager
---------------

I decided to go with `straight.el`. It is a relatively new project, with lots of [features](https://github.com/raxod502/straight.el#features).

The most important ones (for me) are:

- out-of-the-box integration with MELPA;
- it is very easy to temporarily try out a package: `M-x straight-use-package <package name>`. There are no strings attached. As soon as you start a new emacs session, the package side effects are gone (the package is not really gone, it stays cloned locally in your `emacs-user-directory`);
- it is tightly integrated to `use-package`, which makes its usage a breeze;
- `git` is used under-the-hood to get packages from MELPA.

Setup
-----

Here's how `straight.el` is bootstrapped (add this to your `~/.emacs.d/init.el`):

```emacs-lisp
(let ((bootstrap-file (concat user-emacs-directory "straight/bootstrap.el"))
      (bootstrap-version 2))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
```

And here's how to integrate it with `use-package`:

```emacs-lisp
(straight-use-package 'use-package)
```

Workflow
--------

Here's what a typical package configuration looks like:

```emacs-lisp
(use-package magit
  :ensure t
  :config (setq magit-completing-read-function 'magit-ido-completing-read)
  :bind ("C-c m" . magit-status))
```

The previous `use-package` declaration:

1. downloads magit, if it is not already available in the user emacs directory;
2. byte-compiles and activates it;
3. executes a bunch of commands to configure the package (in this example, just one `setq`);
4. assigns a keybinding.

If you carefully look at it, you'll realize this is a really simple workflow that could be replicated with any other package manager. Why bother with `straight.el` and `use-package` then? **Answer**: simplicity. The final config is very clean and organized, thanks to the high-quality  syntactic sugar of `use-package`. Plus, the final state of the directory tree in `~/.emacs.d` is also very organized, thanks to `straight.el`.

All of my packages are organized in a similar fashion. Here is another example:

```emacs-lisp
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))
```

Org-babel
---------

To make my emacs config even more readable and organized, I decided to recreate my `org-babel` setup.

What's `org-babel` in the first place? It is literate programming, written in `org-mode`. I won't further explain it, but here is a screenshot to illustrate its concept:

![]({{ "/assets/blog-images/emacs-genesis-org.png" | relative_url }})

Here's how to set it up. First, change all contents of `~/.emacs.d/init.el` to:

```emacs-lisp
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "genesis.org" (expand-file-name user-emacs-directory)))
```

Then, create a `genesis.org` file (that's an arbitrary filename I've chosen):

```emacs-lisp
#+TITLE: my emacs configuration

* TODO programming plug-ins
** DONE cmake-mode
=cmake-mode= is a mode to work with =*.cmake= files:

#+BEGIN_SRC emacs-lisp
(use-package cmake-mode
  :ensure t
  :defer-install t
  :mode "\\.cmake\\'")
#+END_SRC
** DONE dockerfile-mode...
```

The previous `org` file is organized in such a way that headings (lines beginning with an asterisk) provide a tree-like structure to lay out packages hierarchically, and everything inside `#+BEGIN_SRC` and `#+END_SRC` code blocks is evaluated.

That's it.

Conclusion
----------

This setup is very KISS. It feels so KISS in such a way this post seems to become completely unnecessary. Anyway, I hope it was a good introduction on how to bootstrap your emacs settings from scratch.

Here is my `emacs.d` repository: https://github.com/thiagowfx/.emacs.d. Try opening the `org` file present there to learn how its organization and literate programming look like.
