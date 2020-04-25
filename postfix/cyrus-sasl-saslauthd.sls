saslauthd:
    service:
       - running: ["-a sasldb"]
       - enable: True
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

