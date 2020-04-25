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

{% set directories = ['/var/imap', '/var/imap/socket', '/var/imap/sync','/var/imap/db','/var/spool/imap'] %}

{% for xdir in directories %}
{{ xdir }}:
    file.directory:
       - user: cyrus
       - group: cyrus
       - mkdirs: True
       - recurse:
         - user
         - group
{% endfor %}

# create unix user: rshen, apple, ann
# create mailbox
# cyradm -u cyrus <ip>
# cm user/rshen
# cm user/apple
# cm user/ann

