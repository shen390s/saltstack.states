php-fpm:
   pkg:
       - name: php74
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
        - file: /usr/local/etc/nginx/nextcloud.conf

/usr/local/etc/nginx/nextcloud.conf:
   file.managed:
     - source: salt://nextcloud/files/nginx/nextcloud.conf.jinja
     - template: jinja

/usr/local/etc/nginx/nginx.conf:
   file.managed:
     - source: salt://nextcloud/conf/nginx.conf
     - template: jinja

