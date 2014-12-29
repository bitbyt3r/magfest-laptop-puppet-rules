class graphicscard::innotek {
  package { 'virtualbox-guest-utils':
    ensure => latest
  } ->
  service { 'vboxservice':
    enable => true
  }
}
