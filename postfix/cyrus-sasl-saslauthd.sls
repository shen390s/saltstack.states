saslauthd:
    service:
       - running
       - flags: '-a sasldb'
       - enable: True
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

