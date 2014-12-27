class desktop {
  package { 'mate':
    ensure => present
  }
  package { 'lightdm':
    ensure => latest
  }
  service { 'lightdm':
    ensure => running,
    enable => true
  }
  package { 'xorg-server':
    ensure => latest
  }
  package { 'xorg-server-utils':
    ensure => latest
  }
  package { 'xorg-xinit':
    ensure => latest
  }
}
