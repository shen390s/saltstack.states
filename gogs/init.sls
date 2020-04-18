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

"cd /usr/local/etc && setenv QUILT_PATCHES /root/patches &&  quilt apply gogs.diff":
    cmd.run:
        - create:
          - /usr/local/etc/gogs/conf/app.ini
