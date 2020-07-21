rshen:
   require:
      - pkg: fish
      
   user.present:
      - fullname: Rongsong Shen
      - uid: 1116
      - shell: /usr/local/bin/fish
      - home: /usr/home/rshen
      - groups:
          - wheel

sshkeys:
   ssh_auth.present:
      - user: rshen
      - source: salt://ssh_key/id_rsa.pub

asciidoctor:
   gem.installed:
      - user: root

asciidoctor-pdf:
   gem.installed:
      - user: root

asciidoctor-diagram:
   gem.installed:
      - user: root

asciidoctor-plantuml:
   gem.installed:
      - user: root


asciidoctor-revealjs:
   gem.installed:
      - user: root

asciidoctor-pdf-cjk:
   gem.installed:
      - user: root

