class desktop {
  package { ['mate', 'lightdm', 'xorg-server', 'xorg-server-utils']:
    ensure => latest
  } ->
  package { ['xorg-xinit', 'mate-terminal', 'lightdm-gtk3-greeter']:
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
  service { 'lightdm':
    enable => true
  }
  user { 'magfest':
    ensure => present,
    password => '$6$bW0fbxJi$6M7.d/QmjjtStNmWZH4eWycKgz40wAGwVggjWZ9wWFNj2gGNqbd3uSuiiblmq/yZoHa2CvgdUVrpO7bwnRrj7/'
  }
}
