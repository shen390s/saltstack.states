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

"cd /usr/local/etc/gogs/conf && setenv QUILT_PATCHES /root/patches &&  quilt push gogs.diff":
    cmd.run:
        - create:
          - /usr/local/etc/gogs/conf/app.ini
