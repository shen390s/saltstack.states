nginx:
   pkg:
       - installed

   service:
       - running
       - enable: True
       - watch:
         - file: /usr/local/etc/nginx/nginx.conf
         - file: /usr/local/etc/nginx/phabricator

/usr/local/etc/nginx/nginx.conf:
  file.managed:
      - source: salt://phabricator/config/nginx.conf
      - template: jinja

/usr/local/etc/nginx/phabricator:
  file.managed:
      - source: salt://phabricator/config/phabricator
      - template: jinja
