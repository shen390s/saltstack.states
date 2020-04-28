php-fpm:
   pkg:
       - name: php73
       - installed

   service:
       - running
       - enable: True
       - watch:
         - file: /usr/local/etc/php-fpm.d/www.conf

/usr/local/etc/php-fpm.d/www.conf:
   file.managed:
       - source: salt://phabricator/config/www.conf
       - template: jinja

nginx:
   pkg:
       - installed

   service:
       - running
       - enable: True
       - watch:
         - file: /usr/local/etc/nginx/nginx.conf
         - file: /usr/local/etc/nginx/phabricator
       - require:
         - service: php-fpm

/usr/local/etc/nginx/nginx.conf:
  file.managed:
      - source: salt://phabricator/config/nginx.conf
      - template: jinja

/usr/local/etc/nginx/phabricator:
  file.managed:
      - source: salt://phabricator/config/phabricator
      - template: jinja
