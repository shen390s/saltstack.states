phabricator:
    service:
       - name: phd
       - running
       - enable: True
       - require:
         - pkg: phabricator
         - pkg: mysql80-client
         - service: mysql-server
         - service: nginx

       - watch:
         - file: /usr/local/lib/php/phabricator/conf/local/local.json

    pkg:
       - name: phabricator-php73
       - installed

/usr/local/lib/php/phabricator/conf/local/local.json:
    file.managed:
       - source: salt://phabricator/config/local.json
       - template: jinja

/var/phabricator:
    file.directory:
       - user: www
       - mkdirs: True

/var/phabricator/repo:
    file.directory:
       - user: www
       - mkdirs: True

/var/phabricator/files:
    file.directory:
       - user: www
       - mkdirs: True

#/tmp/db.sql.bz2:
#   file.managed:
#      - source: salt://phabricator/config/db.sql.bz2

update_schema:
   cmd.run:
       - name: cd /usr/local/lib/php/phabricator/ && ./bin/storage upgrade --force 
       - watch:
          - file: /usr/local/lib/php/phabricator/conf/local/local.json
   
