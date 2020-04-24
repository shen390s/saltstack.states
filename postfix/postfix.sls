{% set files = ['master.cf', 'main.cf'] %}
postfix:
    service:
        - running
        - enable: True
        - require:
            - pkg: postfix-sasl
        - watch:
            - file: /usr/local/etc/postfix/master.cf
            - file: /usr/local/etc/postfix/sasl_senders
            - file: /usr/local/etc/postfix/sasl_passwd
            - file: /usr/local/etc/postfix/generic
            - file: /usr/local/etc/postfix/mail.relay.shenrs.eu.pem
            - file: /usr/local/etc/postfix/main.cf

    pkg:
        - name: postfix-sasl
        - installed

/usr/local/etc/postfix/mail.relay.shenrs.eu.pem:
    file.managed:
       - source: salt://postfix/postfix.conf/mail.relay.shenrs.eu.pem

/usr/local/etc/postfix/sasl_senders:
    file.managed:
       - source: salt://postfix/postfix.conf/sasl_senders
       - user: root
       - mode: 0600

    cmd.wait:
       - name: postmap /usr/local/etc/postfix/sasl_senders
       - user: root
       - watch:
            - file: /usr/local/etc/postfix/sasl_senders
    
/usr/local/etc/postfix/sasl_passwd:
    file.managed:
       - source: salt://postfix/postfix.conf/sasl_passwd
       - user: root
       - mode: 0600

    cmd.wait:
       - name: postmap /usr/local/etc/postfix/sasl_passwd
       - user: root
       - watch:
            - file: /usr/local/etc/postfix/sasl_passwd

{% for xfile in files %}
/usr/local/etc/postfix/{{ xfile }}:
    file.managed:
        - source: salt://postfix/postfix.conf/{{ xfile }}
        - template: jinja
{% endfor %}

/usr/local/etc/postfix/generic:
    file.managed:
        - source: salt://postfix/postfix.conf/generic
        - template: jinja

    cmd.wait:
        - name: postmap /usr/local/etc/postfix/generic
        - user: root
        - watch:
              - file: /usr/local/etc/postfix/generic

"cd /etc/mail && make":
    cmd.run:
       - creates:
         - /etc/mail/aliases.db

"touch /etc/opiekeys && chown postfix:postfix /etc/opiekeys":
    cmd.run:
       - creates:
         - /etc/opiekeys
