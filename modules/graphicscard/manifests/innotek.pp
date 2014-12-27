class graphicscard::innotek {
  package { 'virtualbox-guest-utils':
    ensure => latest,
    notify => Exec['modprobe-virtualbox']
  }
  service { 'vboxservice':
    ensure => running,
    enable => true
  }
}
