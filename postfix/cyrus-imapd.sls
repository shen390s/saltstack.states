cyrus-imapd:
    service:
        - name: cyrus_imapd
        - running
        - enable: True
        - require:
           - pkg: cyrus-imapd
        - watch:
           - file: /usr/local/etc/imapd.conf

    pkg:
        - name: cyrus-imapd30
        - installed

/usr/local/etc/imapd.conf:
    file.managed:
        - source: salt://postfix/imapd.conf/imapd.conf
