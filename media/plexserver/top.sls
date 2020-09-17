plexmediaserver:
   pkg:
       - installed

   service:
       - name: plexmediaserver
       - running
       - enable: True
