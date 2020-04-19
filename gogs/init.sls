gogs:
  pkg:
    - installed 

  service:
    - enabled
    - require:
      - pkg: gogs
    - watch:
      - file: /usr/local/etc/gogs/conf/app.ini

/usr/local/etc/gogs/conf/app.ini:
  file.managed:
     - source: /root/patches
        
  cmd.wait:
     - name: cd /usr/local/etc/gogs/conf && setenv QUILT_PATCHES /root/patches &&  (test `quilt top` = /root/patches/gogs.diff  || quilt push gogs.diff )
        
/root/patches:
  file.recurse:
     - source: salt://gogs/patches

