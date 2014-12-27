class graphicscard::innotek {
  package { 'virtualbox-guest-utils':
    ensure => latest,
    nofify => Exec['modprobe-virtualbox']
  }
  service { 'vboxservice':
    ensure => running,
    enable => true
  }
}
