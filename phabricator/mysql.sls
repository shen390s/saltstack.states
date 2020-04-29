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
        - file: /usr/local/etc/mysql/my.cnf
        - file: /var/db/mysql/.db.init.ok
        - file: /var/db/mysql/.fixuser.ok

/usr/local/etc/mysql/my.cnf:
    file.managed:
        - source: salt://phabricator/config/my.cnf

/var/db/mysql/.db.init.ok:
    cmd.wait:
       - name: /usr/local/bin/mysqld_safe --initialize-insecure --user=mysql && service mysql-server onestart && touch /var/db/mysql/.db.init.ok

/tmp/fixuser.sql:
    file.managed:
       - source: salt://phabricator/config/fixuser.sql
       - template: jinja

/var/db/mysql/.fixuser.ok:
   cmd.wait:
       - name: (cat /tmp/fixuser.sql | mysql -u root --skip-password) && touch /var/db/mysql/.fixuser.ok
       - watch:
           - file: /tmp/fixuser.sql
