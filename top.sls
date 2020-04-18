base:
   '*':
      - jails.default

   'ss5*':
      - ss5

   'gogs*':
      - gogs
   
   'postfix*':
      - postfix.postfix
      - postfix.dkimproxy

   'phabricator*':
      - shell.bash
      - utils.git
      - utils.sudo
      - database.mysql80.mysql80-client
      - database.mysql80.mysql80-server
      - lang.php.php74
