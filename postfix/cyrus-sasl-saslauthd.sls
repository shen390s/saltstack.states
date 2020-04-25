saslauthd:
    service:
       - running
       - enable: True
       - kwargs:
           saslauthd_flags: '-a sasldb'
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

