class proxy {

  file { 
    '/etc/profile.d/proxy.sh':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '644',
    source => 'puppet:///modules/proxy/proxy.sh'
    }

  file { 
    '/etc/sudoers':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '440',
    source => 'puppet:///modules/proxy/sudoers'
    }

}
