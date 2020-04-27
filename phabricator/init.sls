phabricator:
    service:
       - name: phd
       - running
       - enable: True
       - require:
         - pkg: phabricator
         - service: database.mysql80.mysql80-server.mysql-server

       - watch:
         - file: /usr/local/lib/php/phabricator/conf/local/local.json

    pkg:
       - name: phabricator-php73
       - installed

/usr/local/lib/php/phabricator/conf/local/local.json:
    file.managed:
       - source: salt://phabricator/config/local.json
