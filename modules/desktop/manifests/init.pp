class desktop {
  package { 'mlocate':
    ensure => present
  } ~>
  exec { '/usr/bin/updatedb':
    refreshonly => true
  }
  file { '/home/magfest/.config/dconf/user':
    source => 'puppet:///modules/desktop/user',
    owner => magfest,
    group => magfest
  }
  file { '/home/magfest':
    ensure => directory,
    owner => magfest,
    group => magfest
  } ->
  exec { '/usr/bin/cp /usr/share/applications/chromium.desktop /home/magfest/Desktop/chromium.desktop':
    creates => '/home/magfest/Desktop/chromium.desktop',
    requires => Package['chromium']
  } ->
  exec { '/usr/bin/cp /usr/share/applications/firefox.desktop /home/magfest/Desktop/firefox.desktop':
    creates => '/home/magfest/Desktop/firefox.desktop',
    requires => Package['firefox']
  }
  package { ['mate', 'lightdm', 'xorg-server', 'xorg-server-utils']:
    ensure => present
  } ->
  package { ['xorg-xinit', 'mate-terminal', 'lightdm-gtk3-greeter']:
    ensure => present
  } ->
  package { ['xorg-xrandr', 'mate-extra', 'yelp', 'curl', 'dnsutils']:
    ensure => present
  } ->
  package { ['tcpdump', 'traceroute', 'wget', 'bzip2', 'gzip', 'accountsservice']:
    ensure => present
  }
  package { ['tar', 'zip', 'unzip', 'p7zip', 'xz', 'arj', 'unrar']:
    ensure => present
  }
  package { ['unace', 'caja', 'atril', 'pluma', 'stone-soup', 'rxvt']:
    ensure => present
  }
  package { ['chromium', 'firefox', 'python2', 'python2-pygame', 'base-devel']:
    ensure => present
  }
  package { ['networkmanager', 'network-manager-applet', 'dhclient']:
    ensure => present
  }
  service { 'lightdm':
    enable => true,
    subscribe => File['/etc/lightdm/lightdm.conf']
  }
  file { '/etc/systemd/system/challenge.target.wants':
    ensure => directory
  } ->
  file { '/etc/systemd/system/challenge.target.wants/display-manager.service':
    ensure => link, 
    target => '/etc/systemd/system/display-manager.service'
  } ->
  file { '/etc/systemd/system/challenge.target.wants/ntpd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/ntpd.service'
  } ->
  file { '/etc/systemd/system/challenge.target.wants/puppet.service':
    ensure => link,
    target => '/usr/lib/systemd/system/puppet.service'
  } ->
  file { '/etc/systemd/system/challenge.target.wants/sshd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/sshd.service'
  }
  file { '/etc/systemd/system/multi-user.target.wants/display-manager.service':
    ensure => link, 
    target => '/etc/systemd/system/display-manager.service'
  }
  package { 'ruby-shadow':
    ensure => present
  } ->
  group { 'autologin':
    ensure => present
  } ->
  user { 'magfest':
    ensure => present,
    password => '$1$ZUm6eWmc$ox8kBH436StQXy8Bv.rgK.',
    groups => ['autologin', 'wheel']
  }
  file { '/usr/share/magfest':
    ensure => directory
  }
  file { '/usr/share/magfest/highreslogo.png':
    ensure => file,
    source => 'puppet:///modules/desktop/highreslogo.png'
  }
  file { '/etc/lightdm/lightdm-gtk-greeter.conf':
    ensure => file,
    source => 'puppet:///modules/desktop/lightdm-gtk-greeter.conf'
  }
  file { '/etc/lightdm/lightdm.conf':
    ensure => file,
    source => 'puppet:///modules/desktop/lightdm.conf',
    require => File['/etc/lightdm']
  }
  file { '/etc/lightdm':
    ensure => directory
  }
  file { '/usr/share/glib-2.0/schemas/mate-background.gschema.override':
    ensure => file,
    source => 'puppet:///modules/desktop/mate-background.gschema.override'
  } ~>
  exec { '/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/':
    refreshonly => true
  }
  file { '/etc/sudoers':
    ensure => file,
    source => 'puppet:///modules/desktop/sudoers'
  }
  service { 'NetworkManager':
    enable => true,
    require => Package['networkmanager']
  }
  service { 'org.cups.cupsd':
    enable => true,
    require => Package['cups']
  }
  package { 'system-config-printer':
    ensure => present
  }
}
