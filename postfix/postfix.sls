postfix:
    service:
        - enabled
        - require:
            - pkg: postfix-sasl
            - /usr/local/etc/postfix

    pkg:
        - name: postfix-sasl
        - installed

/usr/local/etc/postfix:
    file.recurse:
        - source: salt://postfix/postfix.conf

