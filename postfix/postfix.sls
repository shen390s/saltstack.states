{% set files = ['mail.relay.shenrs.eu.pem', 'master.cf'] %}
postfix:
    service:
        - running
        - require:
            - pkg: postfix-sasl
        - watch:
            - file: /usr/local/etc/postfix/master.cf
            - file: /usr/local/etc/postfix/sasl_senders
            - file: /usr/local/etc/postfix/sasl_passwd
            - file: /usr/local/etc/postfix/mail.relay.shenrs.eu.pem
            - file: /usr/local/etc/postfix/main.cf

    pkg:
        - name: postfix-sasl
        - installed

{% for xfile in files %}
/usr/local/etc/postfix/{{ xfile }}:
    file.managed:
       - source: salt://postfix/postfix.conf/{{ xfile }}
{% endfor %}

/usr/local/etc/postfix/sasl_senders:
    file.managed:
       - source: salt://postfix/postfix.conf/sasl_senders
       - user: root
       - group: root
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
       - group: root
       - mode: 0600

    cmd.wait:
       - name: postmap /usr/local/etc/postfix/sasl_passwd
       - user: root
       - watch:
            - file: /usr/local/etc/postfix/sasl_passwd

/usr/local/etc/postfix/main.cf:
    file.managed:
        - source: salt://postfix/postfix.conf/main.cf
        - template: jinja

"cd /etc/mail && make":
    cmd.run:
       - creates:
         - /etc/mail/aliases.db
