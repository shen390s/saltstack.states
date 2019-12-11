ss5:
    service:
       - running
       - require:
           - pkg: ss5
           - file: 
             - managed
             - name: /usr/local/etc/ss5/ss5.conf
             - source: salt://ss5/ss5.conf
           - file:
             - managed
             - name: /usr/local/etc/ss5/ss5.passwd
             - source: salt://ss5/ss5.passwd
