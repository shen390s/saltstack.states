saslauthd:
    service:
       - running
	 - kwargs:
              saslauthd_flags: '-a sasldb'
       - enable: True
       - require:
         - pkg: cyrus-sasl-saslauthd

cyrus-sasl-saslauthd:
    pkg:
       - installed

