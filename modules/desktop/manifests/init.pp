class desktop {
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
  package { ['chromium', 'firefox', 'python2', 'python2-pygame']:
    ensure => present
  }
  service { 'lightdm':
    enable => true,
    subscribe => File['/etc/lightdm/lightdm.conf']
  }
  exec { '/usr/bin/pacman --noconfirm -U http://192.168.5.1/bootmedia/install/challenges-13.0.0.0-any.pkg.tar.xz':
    creates => '/home/magfest/.fceux/fceux.cfg'
  }
  file { '/etc/systemd/system/multi-user.target.wants/display-manager.service':
    ensure => link, 
    target => '/etc/systemd/system/display-manager.service'
  }
  file { '/etc/systemd/system/challenge.target.wants/display-manager.service':
    ensure => link, 
    target => '/etc/systemd/system/display-manager.service'
  }
  file { '/etc/systemd/system/challenge.target.wants/dhcpcd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/dhcpcd.service'
  }
  file { '/etc/systemd/system/challenge.target.wants/ntpd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/ntpd.service'
  }
  file { '/etc/systemd/system/challenge.target.wants/puppet.service':
    ensure => link,
    target => '/usr/lib/systemd/system/puppet.service'
  }
  file { '/etc/systemd/system/challenge.target.wants/sshd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/sshd.service'
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
    groups => 'autologin'
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
    source => 'puppet:///modules/desktop/lightdm.conf'
  }
  file { '/usr/share/glib-2.0/schemas/mate-background.gschema.override':
    ensure => file,
    source => 'puppet:///modules/desktop/mate-background.gschema.override'
  } ~>
  exec { '/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas/':
    refreshonly => true
  }
}
