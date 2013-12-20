class { 'apache':
   mpm_module => prefork,
  default_confd_files => false,
  default_vhost => false,
#      default_mods        => false,
    }
apache::vhost { '192.168.10.12':
      port          => '80',
      docroot       => '/var/www/nfs',
      docroot_owner => 'www-data',
      docroot_group => 'www-data',
    }
apache::mod { 'php5': }

include nfs-mount
