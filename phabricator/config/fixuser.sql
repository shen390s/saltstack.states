alter user 'root'@'localhost' identified by 'srss97zb8';
create user 'root'@'{{ grains['ipv4'] | first() }}' identified by 'srss97zb8';
alter user 'root'@'{{ grains['ipv4'] | first() }}' identified with mysql_native_password by 'srss97zb8';
grant all on *.* to 'root'@'{{ grains['ipv4'] | first() }}'
