saslauthd:
    service:
       - name: saslauthd -a sasldb
       - running
       - enable: True
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

