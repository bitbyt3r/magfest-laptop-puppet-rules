class graphicscard::innotek {
  package { 'virtualbox-guest-utils':
    ensure => latest
  }
  service { 'vboxservice':
    ensure => running,
    enable => true
  }
}
