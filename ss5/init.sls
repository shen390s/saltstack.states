ss5:
    service:
       - running
       - require:
           - pkg: ss5
           - ss5_config

ss5_config:
    file:
       - managed:
           - name: /usr/local/etc/ss5/ss5.conf
           - source: salt://ss5/ss5.conf
       - managed:
           - name: /usr/local/etc/ss5/ss5.passwd
           - source: salt://ss5/ss5.passwd
