PERLDOC2
--------

This is PERLDOC2 for Vim. This plugin provides colouful pod viewing experience.

FEATURES
========

The following pod items receive special highlighting treatment: verbatim text, headings and lists. The generated pod documents are kept in a cache directory, which allows browsing back and forth in your pod history.

INSTALLATION
============

1. Install the Pod::Simple::Vim module from CPAN
2. Install syntax/perldoc.vim and plugin/perldoc2.vim in the respective folders in your vim runtime path.
3. Set the g:Perldoc_path variable in your vimrc to to point to a directory where the cached pod files will be stored.

USAGE
=====

This plugin exports one command - Perldoc, which requires one argument - the name of a module, e.g. ":Perldoc Test::More".

TODO
====

Inline element handling (bold, italics, hyperlinks), ToC generation.

BUGS
====

Please report any bugs at http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Pod-Simple-Vim


Author: Peter Shangov
Email: pshangov@yahoo.com
