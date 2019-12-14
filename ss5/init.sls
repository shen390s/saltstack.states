ss5:
    service:
        - enabled
        - require:
            - pkg: ss5
            - ss5_config
            - ss5_passwd    

    pkg:
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
