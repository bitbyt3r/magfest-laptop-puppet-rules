class graphicscard::nvidia {
  package { 'xorg-x11-drv-nvidia-319.76':
    ensure => latest
  }
  package { 'xorg-x11-drv-nvidia-libs-319.76':
    ensure => latest
  }
  package { 'akmod-nvidia-319.76':
    ensure => latest
  }
  file { '/etc/X11/xorg.conf':
    source => 'puppet:///modules/graphicscard/xorg.conf'
  }
  file { '/etc/X11/xorg.conf.d/00-keyboard.conf':
    source => 'puppet:///modules/graphicscard/00-keyboard.conf'
  }
  file { '/etc/X11/xorg.conf.d/00-nvidia.conf':
    source => 'puppet:///modules/graphicscard/00-nvidia.conf'
  }
  file { '/etc/X11/xorg.conf.d/10-libvnc.conf':
    source => 'puppet:///modules/graphicscard/10-libvnc.conf'
  }
}
