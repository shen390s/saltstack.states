ss5_service:
    service:
        - name: ss5
        - enabled
        - require:
            - ss5_package
            - ss5_config
            - ss5_passwd    
     service.running:
        - name: ss5

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
