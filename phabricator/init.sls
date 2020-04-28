phabricator:
    service:
       - name: phd
       - running
       - enable: True
       - require:
         - pkg: phabricator
         - pkg: mysql80-client
         - service: mysql-server

       - watch:
         - file: /usr/local/lib/php/phabricator/conf/local/local.json

    pkg:
       - name: phabricator-php73
       - installed

/usr/local/lib/php/phabricator/conf/local/local.json:
    file.managed:
       - source: salt://phabricator/config/local.json
       - template: jinja

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
        - update_schema

#/tmp/db.sql.bz2:
#   file.managed:
#      - source: salt://phabricator/config/db.sql.bz2

init_data_base:
    cmd.wait:
       - name: /usr/local/bin/mysqld_safe --initialize-insecure --user=mysql && service mysql-server onestart
 
/tmp/fixuser.sql:
    file.managed:
       - source: salt://phabricator/config/fixuser.sql
       - template: jinja

fixuser:
   cmd.wait: 
       - name: cat /tmp/fixuser.sql | mysql -u root --skip-password
       - watch:
           - file: /tmp/fixuser.sql

update_schema:
   cmd.wait:
       - name: cd /usr/local/lib/php/phabricator/ && ./bin/storage upgrade
       - watch:
          - file: /usr/local/lib/php/phabricator/conf/local/local.json
   
