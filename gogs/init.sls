gogs:
    service:
        - enabled
        - require:
            - pkg: gogs
            - /usr/local/etc/gogs/conf

    pkg:
        - installed

/usr/local/etc/gogs/conf:
    file.recurse:
        - source: salt://gogs/conf

