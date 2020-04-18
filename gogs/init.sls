gogs:
    service:
        - enabled
        - require:
            - pkg: gogs
            - /usr/local/etc/gogs/conf/app.ini

    pkg:
        - installed

/root/patches:
    file.recurse:
        - source: salt://gogs/patches

"cd /usr/local/etc && QUILT_PATCHES=/root/patches && export QUILT_PATCHES && quilt apply gogs.diff":
    cmd.run:
        - create:
          - /usr/local/etc/gogs/conf/app.ini
