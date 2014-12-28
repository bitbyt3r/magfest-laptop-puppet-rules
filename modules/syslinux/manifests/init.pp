class syslinux {
  file { '/boot/syslinux/challenge.cfg':
    source => 'puppet:///modules/syslinux/challenge.cfg'
  }
  file { '/boot/syslinux/registration.cfg':
    source => 'puppet:///modules/syslinux/registration.cfg'
  }
  file { '/boot/syslinux/kiosk.cfg':
    source => 'puppet:///modules/syslinux/kiosk.cfg'
  }
  file { '/etc/systemd/system/challenge.target':
    source => 'puppet:///modules/syslinux/challenge.target'
  }
  file { '/etc/systemd/system/setboot-challenges.service':
    source => 'puppet:///modules/syslinux/setboot-challenges.service'
  }
  file { '/etc/systemd/system/setboot-reg.service':
    source => 'puppet:///modules/syslinux/setboot-reg.service'
  }
  service { 'setboot-challenges':
    enable => true
  }
  service { 'setboot-reg':
    enable => true
  }
}
