File { owner => 0, group => 0, mode => 0644 }

file { '/etc/exports':
      content => "/export           192.168.10.11(rw,no_subtree_check,async) 192.168.10.12(rw,no_subtree_check,async)"
}

file { "/export":
  path    => "/export",
  mode    => 0755,
  owner   => root,
  group   => root,
  ensure  => directory
} 

# put a index.php on nfs share
include index

class { 'nginx': }

nginx::resource::upstream { 'puppet_rack_app':
        ensure   => present,
        members => [
         '192.168.10.11:80', 
         '192.168.10.12:80',
          ],
}

nginx::resource::vhost { '192.168.10.10':
   ensure   => present,
   proxy  => 'http://puppet_rack_app',
   }

