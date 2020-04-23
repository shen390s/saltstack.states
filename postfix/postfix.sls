{% set files = ['mail.relay.shenrs.eu.pem', 'master.cf', 'sasl_passwd', 'sasl_senders'] %}
postfix:
    service:
        - enabled
        - require:
            - pkg: postfix-sasl
            - /usr/local/etc/postfix/master.cf
            - /usr/local/etc/postfix/sasl_senders.db
            - /usr/local/etc/postfix/sasl_passwd.db
            - /usr/local/etc/postfix/mail.relay.shenrs.eu.pem
            - /usr/local/etc/postfix/sasl_passwd
            - /usr/local/etc/postfix/main.cf
            - /usr/local/etc/postfix/sasl_senders

    pkg:
        - name: postfix-sasl
        - installed

{% for xfile in files %}
/usr/local/etc/postfix/{{ xfile }}:
    file.managed:
       - source: salt://postfix/postfix.conf/{{ xfile }}
{% endfor %}

postmap /usr/local/etc/postfix/sasl_sender:
    cmd.run:
       - creates: /usr/local/etc/postfix/sasl_sender.db

postmap /usr/local/etc/postfix/sasl_passwd:
    cmd.run:
       - creates: /usr/local/etc/postfix/sasl_passwd.db

/usr/local/etc/postfix/main.cf:
    file.managed:
        - source: salt://postfix/postfix.conf/main.cf
        - template: jinja

"cd /etc/mail && make":
    cmd.run:
       - creates:
         - /etc/mail/aliases.db
