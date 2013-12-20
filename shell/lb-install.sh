sed -i 's/us.archive.ubuntu.com/pl.archive.ubuntu.com/' /etc/apt/sources.list
apt-get install -y nginx nfs-kernel-server
service nginx start
