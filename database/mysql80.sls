mysql80-client:
   pkg:
      - installed   

mysql80-server:
   pkg:
      - installed

   service:
      - running
      - enable: True
