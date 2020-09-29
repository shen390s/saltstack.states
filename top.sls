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
      - utils.sudo
      - utils.bind-tools

   'ss5*':
      - ss5

   'gogs*':
      - gogs
   
   'postfix*':
      - postfix.postfix
      - postfix.dkimproxy
      - postfix.cyrus-sasl-saslauthd
      - postfix.cyrus-imapd

   'mysqlserv*':
      - database.mysql80-server
      
   'plexserv*':
      - media.plexserver
      
   'embyserv*':
      - media.embyserver

   'nextcloud*':
      - nextcloud.init
      - nextcloud.nginx
      - database.redis

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
