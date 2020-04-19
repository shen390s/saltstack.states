gogs:
  pkg:
    - installed 

  service:
    - enabled
    - require:
      - pkg: gogs
    watch:
      - file: /usr/local/etc/gogs/conf/app.ini

/usr/local/etc/gogs/conf/app.ini:
  file.managed:
     - name: salt://gogs/conf/app.ini
        
