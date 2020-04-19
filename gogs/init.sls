gogs:
  pkg:
    - installed 

  service:
    - enabled
    - require:
      - pkg: gogs
      - file: /var/db/gogs/data/gogs.db
      - /var/db/gogs/repositories

    - watch:
      - file: /usr/local/etc/gogs/conf/app.ini

/tmp/gogs-data.sql:
  file.managed:
     - source: salt://gogs/conf/gogs-data.sql

"(cat /tmp/gogs-data.sql | sqlite3 /var/db/gogs/data/gogs.db) && chown -Rf git:git /var/db/gogs/data/gogs.db":
   cmd.run:
      - creates:
         - /var/db/gogs/data/gogs.db

"setenv RSYNC_PASSWORD srss97zb8 && rsync -av root@192.168.1.3:/tank/home/git/repositories/ /var/db/gogs/repositories/":
   cmd.run:
      - creates:
        - /var/db/gogs/repositories

/usr/local/etc/gogs/conf/app.ini:
  file.managed:
     - source: salt://gogs/conf/app.ini
        
