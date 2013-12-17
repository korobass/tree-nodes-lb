class system-update {

  exec { 'apt-get update':
    command => 'apt-get update',
  }

}
class lb-packages {

  $lbPackages = [ "nginx", "nfs-kernel-server" ]
  package { $lbPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
}
class { 'apt':
  always_apt_update    => true
}

Exec["apt-get update"] -> Package <| |>

include system-update
include lb-packages

#include nginx
#
#nginx::config::cluster{'test':
#  servers => [
#    '192.168.10.11:80',
#    '192.168.10.12:80',
#  ]
#}
#nginx::config::vhost{
#  'zacmini.local':
#    cluster => 'test',
#}
