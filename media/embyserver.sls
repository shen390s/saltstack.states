emby-server:
   pkg:
       - installed

   service:
       - name: emby-server
       - running
       - enable: True
