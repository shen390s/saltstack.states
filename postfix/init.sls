postfix:
    service:
        - enabled
        - require:
            - pkg: postfix-sasl
            - /usr/local/etc/postfix/conf

    pkg:
        - name: postfix-sasl
        - installed

/usr/local/etc/postfix:
    file.recurse:
        - source: salt://postfix/postfix.conf

