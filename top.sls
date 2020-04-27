base:
   '*':
      - shell.fish
      - utils.pstree
      - utils.the_silver_searcher
      - utils.quilt
      - utils.rsync

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
#      - database.mysql80.mysql80-client
#      - database.mysql80.mysql80-server
      - phabricator
