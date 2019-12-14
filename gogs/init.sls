gogs:
    service:
        - enabled
        - require:
            - pkg: gogs
            - gogs_config

    pkg:
        - installed

gogs_config:
    file.recurse:
      - name: /usr/local/etc/gogs/conf
      - source: salt://gogs/conf

