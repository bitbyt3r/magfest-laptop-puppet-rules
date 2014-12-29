class desktop {
  package { 'mlocate':
    ensure => present
  } ~>
  exec { '/usr/bin/updatedb':
    refreshonly => true
  }

  package { 'ruby-shadow':
    ensure => present
  } ->
  group { 'autologin':
    ensure => present
  }
  file { '/etc/sudoers':
    ensure => file,
    source => 'puppet:///modules/desktop/sudoers'
  }

  file { '/etc/lightdm':
    ensure => directory
  }
  file { '/etc/lightdm/lightdm.conf':
    ensure => file,
    source => 'puppet:///modules/desktop/lightdm.conf',
    require => File['/etc/lightdm']
  }
  file { '/etc/lightdm/lightdm-gtk-greeter.conf':
    ensure => file,
    source => 'puppet:///modules/desktop/lightdm-gtk-greeter.conf'
  }
  service { 'lightdm':
    enable => true,
    subscribe => File['/etc/lightdm/lightdm.conf']
  }

  file { '/usr/share/glib-2.0/schemas/mate-background.gschema.override':
    ensure => file,
    source => 'puppet:///modules/desktop/mate-background.gschema.override'
  } ~>
  exec { '/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/':
    refreshonly => true
  }
  file { '/usr/share/magfest':
    ensure => directory
  }
  file { '/usr/share/magfest/highreslogo.png':
    ensure => file,
    source => 'puppet:///modules/desktop/highreslogo.png'
  }

  service { 'NetworkManager':
    enable => true,
    require => Package['networkmanager']
  }
  exec { '/usr/bin/systemctl enable NetworkManager':
    creates => '/etc/systemd/system/multi-user.target.wants/NetworkManager.service'
  }

  service { 'org.cups.cupsd':
    enable => true,
    require => Package['cups']
  }
  package { 'system-config-printer':
    ensure => present
  }
  file { '/usr/share/applications/system-config-printer.desktop':
    source => 'puppet:///modules/desktop/system-config-printer.desktop',
    require => Package['system-config-printer']
  }
}
