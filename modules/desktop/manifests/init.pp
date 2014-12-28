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
  package { ['tcpdump', 'traceroute', 'wget', 'bzip2', 'gzip']:
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
    enable => true
  }
  file { '/etc/systemd/system/multi-user.target.wants/display-manager.service':
    ensure => link, 
    target => '/etc/systemd/system/display-manager.service'
  }
  user { 'magfest':
    ensure => present,
    password => '$1$ZUm6eWmc$ox8kBH436StQXy8Bv.rgK.'
  }
}
