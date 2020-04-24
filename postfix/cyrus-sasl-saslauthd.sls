saslauthd:
    service:
       - running
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

