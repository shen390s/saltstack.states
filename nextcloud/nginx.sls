php-fpm:
   pkg:
       - name: php73
       - installed

   service:
       - running
       - enable: True

nginx:
  pkg:
     - installed

  service:
     - running
     - enable: True
     - require:
        - service: php-fpm
        - file: /usr/local/etc/nginx/nginx.conf

/usr/local/etc/nginx/nginx.conf:
   file.managed:
     - source: salt://nextcloud/files/nginx/nextcloud.conf.jinja
     - template: jinja
