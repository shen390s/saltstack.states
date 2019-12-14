gogs_service:
    service.enabled:
        - name: gogs
        - require:
            - gogs_package
            - gogs_config
gogs_package:
    pkg:
       - name: gogs
       - installed

gogs_config:
    file: 
      - managed
      - replaceTrue: True
      - name: /usr/local/etc/gogs/conf/app.ini
      - source: salt://gogs/app.conf

