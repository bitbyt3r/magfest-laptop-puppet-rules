class emulators {
  exec { '/usr/bin/pacman --noconfirm -U http://192.168.5.1/bootmedia/install/challenges-13.0.0.1-1-any.pkg.tar.xz':
    creates => '/home/magfest/.fceux/fceux.cfg'
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
  exec { '/usr/bin/pacman --noconfirm -U http://192.168.5.1/bootmedia/install/evrouter-0.4-2-i686.pkg.tar.xz':
    creates => '/usr/bin/evrouter'
  }
}
