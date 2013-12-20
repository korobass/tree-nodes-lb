class index {
  file {
    '/export/index.php':
      owner => 'www-data',
      group => 'www-data',
      mode => '0644',
      source => 'puppet:///modules/index/index.php',
  }
}
