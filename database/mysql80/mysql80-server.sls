mysql80-server:
   pkg:
      - installed

   service:
      - name: mysql-server
      - running
      - enable: True
