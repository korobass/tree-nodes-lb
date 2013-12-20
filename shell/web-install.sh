sed -i 's/us.archive.ubuntu.com/pl.archive.ubuntu.com/' /etc/apt/sources.list
apt-get install -y apache2 libapache2-mod-php5 php5-mysql
#mount 192.168.10.10:/export /var/www/nfs
