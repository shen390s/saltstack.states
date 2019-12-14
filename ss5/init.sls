ss5:
    service:
        - enabled
        - require:
            - pkg: ss5
            - ss5_config

    pkg:
        - installed 

ss5_config:
    file.recurse: 
      - name: /usr/local/etc/ss5
      - source: salt://ss5/conf
