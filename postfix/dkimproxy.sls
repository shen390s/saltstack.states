dkimproxy_out:
    service:
        - running
        - enable: True
        - require:
            - pkg: dkimproxy
            - /usr/local/etc/dkimproxy_out.conf

    pkg:
        - name: dkimproxy
        - installed

/usr/local/etc/dkimproxy_out.conf:
    file.managed:
        - source: salt://postfix/dkimproxy/dkimproxy_out.conf
        - template: jinja

