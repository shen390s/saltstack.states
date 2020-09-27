mysql80-server:
    pkg:
        - installed

    service:
        - name: mysql-server
        - running
        - enable: True
        - require:
          - file: /usr/local/etc/mysql/my.cnf
          - db-setup

/usr/local/etc/mysql/my.cnf:
    file.managed:
        - source: salt://database/conf/my.cnf
        - template: jinja

/var/db/mysql/db-setup.mysql:
    file.managed:
        - source: salt://database/conf/db-setup.sql
        - template: jinja

db-setup:
    cmd.run:
        - name: (echo source /var/db/mysql/db-setup.sql | mysql -u root --skip-password) && touch /var/db/mysql/.db-setup.ok
        - watch:
             - /tmp/db-setup.sql
        - creates:
             - /var/db/mysql/.db-setup.ok
	     
