use mysql;

update user  set host='%' where user='root' and host='localhost';

flush privileges;

{% set password = salt.pillar.get('mysql.root.passwd') %}
set password for 'root'@'%' = '{{ password }}'

flush privileges;

