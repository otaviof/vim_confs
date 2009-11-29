---
files:
  - /Users/otaviof/.vim/ftplugin/perl/perlomni.vim
  - /Users/otaviof/.vim/bin/find_base_classes.pl
  - /Users/otaviof/.vim/bin/perl_function_list.pl
  - /Users/otaviof/.vim/bin/parse_moose_accessor.pl
  - /Users/otaviof/.vim/ftplugin/perl/perl-completion.vim
  - /Users/otaviof/.vim/bin/moose-type-constraints
  - /Users/otaviof/.vim/perl/perl-functions
meta:
  author: Cornelius
  dependency:
    - name: libperl.vim
      required_files:
        - from: http://github.com/c9s/libperl.vim/raw/master/vimlib/autoload/libperl.vim
          target: autoload/libperl.vim
    - name: search-window.vim
      required_files:
        - from: http://github.com/c9s/search-window.vim/raw/master/vimlib/autoload/swindow.vim
          target: autoload/swindow.vim
  name: perl-completion.vim
  repository: http://github.com/c9s/perl-completion.vim
  script:
    - utils/find_base_classes.pl
    - utils/perl_function_list.pl
    - utils/parse_moose_accessor.pl
    - utils/moose-type-constraints
  script_id: 2852
  type: plugin
  version: 1.6
  version_from: vimlib/ftplugin/perl/perlomni.vim
  vim_version:
    op: '>='
    version: 7.0
