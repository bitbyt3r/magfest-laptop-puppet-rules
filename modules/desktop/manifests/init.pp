class desktop {
  package { 'mate':
    ensure => latest
  }
  package { 'lightdm':
    ensure => latest
  }
  service { 'lightdm':
    ensure => running,
    enable => true
  }
}
