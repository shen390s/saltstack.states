mysql80-client:
   pkg:
      - installed

mysql80-server:
   pkg:
      - installed

   service:
      - name: mysql-server
      - running
      - enable: True
      - require:
        - init_data_base
        - fixuser

init_data_base:
    cmd.wait:
       - name: /usr/local/bin/mysqld_safe --initialize-insecure --user=mysql && service mysql-server onestart && touch /var/db/mysql/.db.init.ok
       - watch: 
           - file: /var/db/mysql/.db.init.ok


/tmp/fixuser.sql:
    file.managed:
       - source: salt://phabricator/config/fixuser.sql
       - template: jinja

fixuser:
   cmd.wait:
       - name: (cat /tmp/fixuser.sql | mysql -u root --skip-password) && touch /var/db/mysql/.fixuser.ok
       - watch:
           - file: /var/db/mysql/.fixuser.ok
