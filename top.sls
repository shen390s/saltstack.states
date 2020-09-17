base:
   '*':
      - shell.fish
      - utils.pstree
      - utils.the_silver_searcher
      - utils.quilt
      - utils.rsync
      - utils.sshd
      - utils.tmux
      - utils.git

   'ss5*':
      - ss5

   'gogs*':
      - gogs
   
   'postfix*':
      - postfix.postfix
      - postfix.dkimproxy
      - postfix.cyrus-sasl-saslauthd
      - postfix.cyrus-imapd

   'plexserv*':
      - media.plexserver
      
   'phabricator*':
      - utils.pygment
      - phabricator.mysql
      - phabricator.web
      - phabricator.phabricator

   'worker*':
      - lang.ruby.ruby
      - lang.openjdk.openjdk
      - editors.emacs
      - utils.cmake
      - utils.node12
      - worker
