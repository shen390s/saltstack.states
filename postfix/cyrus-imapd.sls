cyrus-imapd:
    service:
        - running
        - enable: True
        - require:
           - pkg: cyrus-imapd
        - watch:
           - file: /usr/local/etc/imapd.conf

    pkg:
        - installed

/usr/local/etc/imapd.conf:
    file.managed:
        - source: salt://postfix/imapd.conf/imapd.conf
