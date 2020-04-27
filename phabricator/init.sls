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

/tmp/db.sql.bz2:
   file.managed:
      - source: salt://phabricator/config/db.sql.bz2

init_data_base:
   cmd.wait: 
      - name: (cat /tmp/db.sql.bz2 |bzip2 -d | mysql) && /usr/local/lib/php/phabricator/bin/storage upgrade
   
