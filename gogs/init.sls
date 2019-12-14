gogs:
    service:
        - enabled
        - require:
            - pkg: gogs
            - gogs_config

    pkg:
        - installed

gogs_config:
    file.recursive:
      - name: /usr/local/etc/gogs/conf
      - source: salt://gogs/conf

