ss5_service:
    service.running:
       - name: ss5
       - require:
           - ss5_package
           - ss5_config

ss5_config:
    file:
       - managed:
           - name: /usr/local/etc/ss5/ss5.conf
           - source: salt://ss5/ss5.conf
       - managed:
           - name: /usr/local/etc/ss5/ss5.passwd
           - source: salt://ss5/ss5.passwd

ss5_package:
    pkg.installed:
       - ss5
