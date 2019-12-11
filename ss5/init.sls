ss5:
    service:
       - running
       - require:
           - ss5_package
           - ss5_config
     ss5_package:
           - name: ss5
           - installed
     ss5_config:
           - file: 
             - managed
             - name: /usr/local/etc/ss5/ss5.conf
             - source: salt://ss5/ss5.conf
           - file:
             - managed
             - name: /usr/local/etc/ss5/ss5.passwd
             - source: salt://ss5/ss5.passwd
