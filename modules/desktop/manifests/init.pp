class desktop {
  package { 'mate':
    ensure => present
  } ->
  package { 'lightdm':
    ensure => latest
  } ->
  package { 'xorg-server':
    ensure => latest
  } ->
  package { 'xorg-server-utils':
    ensure => latest
  } ->
  package { 'xorg-xinit':
    ensure => latest
  } ->
  package { 'lightdm-gtk3-greeter':
    ensure => latest
  } ->
  package { 'mate-terminal':
    ensure => latest
  } ->
  package { 'firefox':
    ensure => latest
  } ->
  service { 'lightdm':
    ensure => running,
    enable => true
  }
}
