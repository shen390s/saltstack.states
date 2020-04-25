saslauthd:
    service:
       - running
       - saslauthd_flags: '-a sasldb'
       - enable: True
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

