mysql80-server:
    pkg:
        - installed

    service:
        - name: mysql-server
        - running
        - enable: True
        - require:
          - file: /usr/local/etc/mysql/my.cnf

/usr/local/etc/mysql/my.cnf:
    file.managed:
        - source: salt://database/conf/my.cnf
        - template: jinja

/var/db/mysql/db-setup.sql:
    file.managed:
        - source: salt://database/conf/db-setup.sql
        - template: jinja

db-setup:
    cmd.run:
        - name: (echo source /var/db/mysql/db-setup.sql | mysql -u root ) && touch /var/db/mysql/.db-setup.ok
        - watch:
             - /var/db/mysql/db-setup.sql
        - creates:
             - /var/db/mysql/.db-setup.ok
