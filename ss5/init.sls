ss5_service:
    service.enabled::
        - name: ss5
        - require:
            - ss5_package
            - ss5_config
            - ss5_passwd    
ss5_package:
    pkg:
       - name: ss5
       - installed

ss5_config:
    file: 
      - managed
      - name: /usr/local/etc/ss5/ss5.conf
      - source: salt://ss5/ss5.conf

ss5_passwd:
    file:
      - managed
      - name: /usr/local/etc/ss5/ss5.passwd
      - source: salt://ss5/ss5.passwd
