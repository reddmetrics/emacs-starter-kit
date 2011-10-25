# Backtype Emacs Config

This kit's based on technomancy's emacs-starter-kit, found at `http://github.com/technomancy/emacs-starter-kit/`.

## Installation

1. Get the latest emacs from [here](http://emacsformacosx.com/).
2. Move the directory containing this file to ~/.emacs.d
   (If you already have a directory at ~/.emacs.d move it out of the
   way and put this there instead.)
3. If ~/.emacs exists, delete it!
4. Launch Emacs!

## Load Failures

When you first load this config, you'll get a bunch of errors. Fix them by running

    M-x package-list-packages

and hitting `i` by each of the following lines:

-  browse-kill-ring  1.3.1       installed  Interactively insert items from kill-ring -*- coding: utf-8 -*-
-  clojure-mode      1.10.0      installed  Major mode for Clojure code
-  clojure-test-mode 1.5.6       installed  Minor mode for Clojure tests
-  ecb               2.40        installed  Emacs Code Browser
-  find-file-in-project 2.1      installed  Find files in a project quickly.
-  idle-highlight    1.0         installed  Highlight the word the point is on
-  inf-ruby          2.2.1       installed  Run a ruby process in a buffer
-  magit             1.0.0       installed  Control Git from Emacs.
-  org               20110809    installed  Outline-based notes management and organizer
-  rinari            2.1         installed  Rinari Is Not A Rails IDE
-  ruby-compilation  0.7         installed  Run a ruby process in a compilation buffer
-  ruby-mode         1.1         installed  Major mode for editing Ruby files
-  slime             20100404.1  installed  Superior Lisp Interaction Mode for Emacs
-  slime-repl        20100404    installed  Read-Eval-Print Loop written in Emacs Lisp
-  swank-clojure     1.1.0       installed  Slime adapter for clojure
-  textmate          1           installed  TextMate minor mode for Emacs
-  textmate-to-yas   0.13        installed  Import Textmate macros into yasnippet syntax
-  yasnippet-bundle  0.6.1       installed  Yet another snippet extension (Auto compiled bundle)

Once that's done, hit x to install. This may take a couple of passes.

## Structure

The init.el file is where everything begins. It's the first file to
get loaded. The starter-kit-* files provide what I consider to be
better defaults, both for different programming languages and for
built-in Emacs features like bindings or registers.

Files that are pending submission to ELPA are bundled with the starter
kit under the directory elpa-to-submit/. The understanding is that
these are bundled just because nobody's gotten around to turning them
into packages, and the bundling of them is temporary. For these
libraries, autoloads will be generated and kept in the loaddefs.el
file. This allows them to be loaded on demand rather than at startup.

There are also a few files that are meant for code that doesn't belong
in the Starter Kit. First, the user-specific-config file is the file
named after your user with the extension ".el". In addition, if a
directory named after your user exists, it will be added to the
load-path, and any elisp files in it will be loaded. Finally, the
Starter Kit will look for a file named after the current hostname
ending in ".el" which will allow host-specific configuration. This is
where you should put code that you don't think would be useful to
everyone. That will allow you to merge with newer versions of the
starter-kit without conflicts.

## Packages

Libraries from [Marmalade](http://marmalade-repo.org) installed via
package.el are preferred when available since dependencies are handled
automatically, and the burden to update them is removed from the
user.

There's no vendor/ directory in the starter kit because if an external
library is useful enough to be bundled with the starter kit, it should
be useful enough to submit to Marmalade so that everyone can use it, not
just users of the starter kit.
