class desktop::packages {
  package { ['mate', 'lightdm', 'xorg-server', 'xorg-server-utils']:
    ensure => present
  }
  package { ['xorg-xinit', 'mate-terminal', 'lightdm-gtk3-greeter']:
    ensure => present
  }
  package { ['xorg-xrandr', 'mate-extra', 'yelp', 'curl', 'dnsutils']:
    ensure => present
  }
  package { ['tcpdump', 'traceroute', 'wget', 'bzip2', 'gzip', 'accountsservice']:
    ensure => present
  }
  package { ['tar', 'zip', 'unzip', 'p7zip', 'xz', 'arj', 'unrar']:
    ensure => present
  }
  package { ['unace', 'caja', 'atril', 'pluma', 'stone-soup', 'rxvt']:
    ensure => present
  }
  package { ['python2', 'python2-pygame', 'base-devel']:
    ensure => present
  }
  package { ['networkmanager', 'network-manager-applet', 'dhclient']:
    ensure => present
  }
  package { 'xf86-input-synaptics':
    ensure => present
  }
}
