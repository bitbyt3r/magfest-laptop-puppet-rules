class emulators {
  exec { '/usr/bin/pacman --noconfirm -U http://192.168.5.1/bootmedia/install/pkgs/challenges-13.0.0.0-any.pkg.tar.xz':
    creates => "/opt/challenges"
  }
  exec { '/usr/bin/pacman --noconfirm -U http://192.168.5.1/bootmedia/install/pkgs/antimicro-2.6-1-x86_64.pkg.tar.xz':
    creates => "/opt/antimicro"
  }
  file { ['/root', '/root/.config', '/root/.config/antimicro']:
    ensure => directory
  }
  file { '/root/.config/antimicro/antimicro_settings.ini':
    ensure => file,
    source => 'puppet:///modules/emulators/antimicro_settings.ini',
  }
  package { 'stella':
    ensure => latest
  }
  package { 'zsnes':
    ensure => latest
  }
  package { 'fceux':
    ensure => latest
  }
  package { 'gens-gs':
    ensure => latest
  }
  exec { '/usr/bin/pacman --noconfirm -U http://192.168.5.1/bootmedia/install/pkgs/evrouter-0.4-2-i686.pkg.tar.xz':
    creates => '/usr/bin/evrouter'
  }
  user { 'challenges':
    ensure => present,
    groups => 'autologin'
  }
  file { '/home/challenges':
    ensure => directory,
    owner => challenges,
    group => challenges
  } ->
  file { '/home/challenges/.profile':
    source => 'puppet:///modules/emulators/profile',
    owner => challenges,
    group => challenges,
    mode => 755
  }
  file { '/usr/bin/startchallenges':
    source => 'puppet:///modules/emulators/startchallenges',
    mode => 755
  } ->
  file { '/etc/systemd/system/challenge.service':
    source => 'puppet:///modules/emulators/challenge.service'
  } ->
  file { '/etc/lightdm/challenges.conf':
    source => 'puppet:///modules/emulators/challenges.conf'
  } ->
  service { 'challenge':
    enable => true,
    require => File['/etc/systemd/system/challenge.service']
  }
}
