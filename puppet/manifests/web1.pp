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
		'mysqld' => { 
			'max_connections' => '1024',
			'bind_address' => '0.0.0.0', 
#			'restart' => 'true', 
			} 
		}
}

class {
  '::mysql::client':
        package_ensure => 'present',
	package_name => 'mysql-client',
}

mysql_user{ 
  'dspam@%':
  ensure        => present,
  password_hash => mysql_password('blah'),
  require => Class['mysql::server'],
}

mysql_database {
  'dspam': 
  ensure  => 'present',
  charset => 'utf8',
  require => Class['mysql::server'],
	}

mysql_grant{'dspam@%/dspam.*':
  user       => 'dspam@%',
  table      => 'dspam.*',
  privileges => ['ALL'],
  require => Class['mysql::server'],
}

#GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%' IDENTIFIED BY 'password';
mysql_user{ 
  'slave@%':
  ensure        => present,
  password_hash => mysql_password('slave123'),
  require => Class['mysql::server'],
}

mysql_grant{'slave@%':
  user       => 'slave@%',
  table      => '*.*',
  privileges => ['REPLICATION SLAVE'],
  require => Class['mysql::server'],
}

  file {
    '/etc/mysql/conf.d/mysql-master.cnf':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => 'puppet:///modules/mysql/mysql-master.cnf',
      require => Class['mysql::server'],
  }
  file {
    '/etc/mysql/mysql_objects-4.1.sql':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => 'puppet:///modules/mysql/mysql_objects-4.1.sql',
      require => Class['mysql::server'],
  }
  file {
    '/etc/mysql/virtual_users.sql':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => 'puppet:///modules/mysql/virtual_users.sql',
      require => Class['mysql::server'],
  }





