base:
   '*':
      - shell.fish
      - utils.pstree
      - utils.the_silver_searcher
      - utils.quilt

   'ss5*':
      - ss5

   'gogs*':
      - gogs
   
   'postfix*':
      - postfix.postfix
      - postfix.dkimproxy

   'phabricator*':
      - utils.git
      - utils.sudo
      - database.mysql80.mysql80-client
