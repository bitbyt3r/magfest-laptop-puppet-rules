class syslinux {
  file { '/boot/syslinux/syslinux.cfg':
    ensure => file,
    source => 'puppet:///modules/syslinux/syslinux.cfg'
  }
}
