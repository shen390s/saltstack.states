ss5:
    service:
        - enabled
        - require:
            - pkg: ss5
            - /usr/local/etc/ss5

    pkg:
        - installed 

/usr/local/etc/ss5:
    file.recurse: 
      - source: salt://ss5/conf
