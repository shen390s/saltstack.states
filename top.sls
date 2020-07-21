base:
   '*':
      - shell.fish
      - utils.pstree
      - utils.the_silver_searcher
      - utils.quilt
      - utils.rsync
      - utils.sshd
      - utils.tmux

   'ss5*':
      - ss5

   'gogs*':
      - gogs
   
   'postfix*':
      - postfix.postfix
      - postfix.dkimproxy
      - postfix.cyrus-sasl-saslauthd
      - postfix.cyrus-imapd

   'phabricator*':
      - utils.pygment
      - phabricator.mysql
      - phabricator.web
      - phabricator.phabricator

   'worker*':
      - lang.ruby.ruby27
      - utils.asciidoctor
      - editors.emacs
