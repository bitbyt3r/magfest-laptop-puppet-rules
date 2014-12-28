class desktop {
  package { ['mate', 'slim', 'xorg-server', 'xorg-server-utils']:
    ensure => latest
  } ->
  package { ['xorg-xinit', 'lightdm-gtk3-greeter', 'mate-terminal']:
    ensure => latest
  } ->
  package { ['xorg-xrandr', 'mate-extra', 'yelp', 'curl', 'dnsutils']:
    ensure => latest
  } ->
  package { ['tcpdump', 'traceroute', 'wget', 'bzip2', 'gzip']:
    ensure => latest
  }
  package { ['tar', 'zip', 'unzip', 'p7zip', 'xz', 'arj', 'unrar']:
    ensure => latest
  }
  package { ['unace', 'caja', 'atril', 'pluma', 'stone-soup', 'rxvt']:
    ensure => latest
  }
  package { ['chromium', 'firefox', 'python2', 'python2-pygame']:
    ensure => latest
  }
  service { 'slim':
    enable => true
  }
}
