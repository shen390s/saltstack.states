phabricator:
    service:
       - name: phd
       - running
       - enable: True
       - require:
         - pkg: phabricator

    pkg:
       - name: phabricator-php73
       - installed

