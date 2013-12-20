class { 
  'apache':
  mpm_module => prefork,
  default_confd_files => false,
  default_vhost => false
#      default_mods        => false,
    }

apache::vhost { 
  '192.168.10.11':
  port          => '80',
  docroot       => '/var/www/nfs',
  docroot_owner => 'www-data',
  docroot_group => 'www-data'
  }

apache::mod { 'php5': }

include nfs-mount

class { 
  '::mysql::server':
  	root_password    => 'alamakota12345678',
    	override_options => { 
		'mysqld' => { 'max_connections' => '1024' } 
		}
}
class {
'::mysql::client::install':
}
