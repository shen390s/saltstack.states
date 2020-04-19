gogs:
  pkg:
    - installed 

  service:
    - enabled
    - require:
      - pkg: gogs
      - file: /var/db/gogs/data/gogs.db

    - watch:
      - file: /usr/local/etc/gogs/conf/app.ini

/tmp/gogs-data.sql:
  file.managed:
     - source: salt://gogs/conf/gogs-data.sql

/var/db/gogs/data/gogs.db:
  cmd.wait: 
     - name: (cat /tmp/gogs-data.sql | sqlite3 gogs.db) && cp gogs.db /var/db/gogs/data/gogs.db 
     - user: git

/usr/local/etc/gogs/conf/app.ini:
  file.managed:
     - source: salt://gogs/conf/app.ini
        
