class desktop::brower {
  package ['chromium', 'firefox']:
    ensure => present
  }
  file { ['/home/magfest/.config', '/home/magfest/.config/dconf']:
    ensure => directory,
    owner => magfest,
    group => magfest
  } ->
  file { '/home/magfest/.config/dconf/user':
    source => 'puppet:///modules/desktop/user',
    owner => magfest,
    group => magfest
  }
  file { '/home/magfest/Desktop/chromium.desktop':
    owner => magfest,
    group => magfest,
    mode => 755,
    source => 'puppet:///modules/desktop/chromium.desktop'
  } ->
  file { '/home/magfest/Desktop/firefox.desktop':
    owner => magfest,
    group => magfest,
    mode => 755,
    source => 'puppet:///modules/desktop/firefox.desktop'
  }
}
