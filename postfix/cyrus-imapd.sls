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

"mkdir -p /var/imap && chown -Rf cyrus:cyrus /var/imap":
    cmd.run:
        - creates:
          - /var/imap

"mkdir -p /var/imap/socket && chown -Rf cyrus:cyrus /var/imap/socket":
    cmd.run:
        - creates:
          - /var/imap/socket

"mkdir -p /var/imap/sync && chown -Rf cyrus:cyrus /var/imap/sync":
    cmd.run:
        - creates:
          - /var/imap/sync

"mkdir -p /var/imap/db && chown -Rf cyrus:cyrus /var/imap/db":
    cmd.run:
        - creates:
          - /var/imap/db
