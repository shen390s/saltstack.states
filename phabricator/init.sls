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

init_data_base:
   cmd.wait: 
      - name: /usr/local/lib/php/phabricator/bin/storage upgrade
   
