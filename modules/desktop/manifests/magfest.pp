class desktop::magfest {
  file { '/home/magfest':
    ensure => directory,
    owner => magfest,
    group => magfest
  }
  file { '/home/magfest/Desktop':
    ensure => directory,
    owner => magfest,
    group => magfest
  }
  user { 'magfest':
    ensure => present,
    password => '$1$ZUm6eWmc$ox8kBH436StQXy8Bv.rgK.',
    groups => ['autologin', 'wheel']
  }
}
