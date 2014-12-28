class emulators {
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
}
