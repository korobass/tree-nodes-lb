service apache2 restart
mysql --defaults-file=/etc/mysql/debian.cnf dspam < /etc/mysql/mysql_objects-4.1.sql
mysql --defaults-file=/etc/mysql/debian.cnf dspam < /etc/mysql/virtual_users.sql
service mysql restart
