use mysql;

update user  set host='%' where user='root' and host='localhost';

flush privileges;

{% set mysql = salt.pillar.get('mysql') %}
set password for 'root'@'%' = '{{ mysql.admin_passwd }}' ;

flush privileges;

