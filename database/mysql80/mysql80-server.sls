mysql80-server:
   pkg:
      - installed

   service:
      - name: mysql_server
      - running
      - enable: True
