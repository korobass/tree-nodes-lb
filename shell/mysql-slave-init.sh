FILE=`mysql -uslave -pslave123 -h 192.168.10.11 -e 'show master status' | grep mysql | awk  '{print $1}'`
POS=`mysql -uslave -pslave123 -h 192.168.10.11 -e 'show master status' | grep mysql | awk  '{print $2}'`
mysql --defaults-file=/etc/mysql/debian.cnf -e "change master to master_host='192.168.10.11',master_user='slave', master_password='slave123',master_log_file='$FILE', master_log_pos=$POS"
mysql --defaults-file=/etc/mysql/debian.cnf -e 'start slave'
