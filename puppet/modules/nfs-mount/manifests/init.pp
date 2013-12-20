class nfs-mount {

file { "/var/www/nfs":
  path    => "/var/www/nfs",
  mode    => 0755,
#  owner   => www-data,
#  group   => www-data,
  ensure  => directory
} 

mount { "/var/www/nfs":
  device  => "192.168.10.10:/export",
  fstype  => "nfs",
  ensure  => "mounted",
  options => "defaults",
  atboot  => "true",
}

}
