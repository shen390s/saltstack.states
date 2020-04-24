cyrus-sasl-saslauthd:
    service:
       - running
       - require:
         - pkg: cyrus-sasl-saslauthd

    pkg:
       - installed

