cyrus-imapd:
    service:
        - name: imapd
        - running
        - enable: True
        - require:
           - pkg: cyrus-imapd
        - watch:
           - file: /usr/local/etc/imapd.conf
           - file: /usr/local/etc/cyrus.conf

    pkg:
        - name: cyrus-imapd30
        - installed

/usr/local/etc/imapd.conf:
    file.managed:
        - source: salt://postfix/imapd.conf/imapd.conf

/usr/local/etc/cyrus.conf:
    file.managed:
        - source: salt://postfix/imapd.conf/cyrus.conf
