saslauthd:
    service:
       - running
       - enable: True
       - kwargs:
           flags: '-a sasldb'
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

