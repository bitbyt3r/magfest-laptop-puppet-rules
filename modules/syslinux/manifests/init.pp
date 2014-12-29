class syslinux {
  file { '/boot/syslinux/challenges.cfg':
    source => 'puppet:///modules/syslinux/challenges.cfg'
  } ->
  file { '/boot/syslinux/registration.cfg':
    source => 'puppet:///modules/syslinux/registration.cfg'
  } ->
  file { '/boot/syslinux/kiosk.cfg':
    source => 'puppet:///modules/syslinux/kiosk.cfg'
  } ->
  file { '/etc/systemd/system/challenge.target':
    source => 'puppet:///modules/syslinux/challenge.target'
  } ->
  file { '/etc/systemd/system/setboot-challenges.service':
    source => 'puppet:///modules/syslinux/setboot-challenges.service'
  } ->
  file { '/etc/systemd/system/setboot-reg.service':
    source => 'puppet:///modules/syslinux/setboot-reg.service'
  } ->
  file { '/etc/systemd/system/setboot-kiosk.service':
    source => 'puppet:///modules/syslinux/setboot-kiosk.service'
  } ->
  file { '/etc/systemd/system/kiosk.target':
    source => 'puppet:///modules/syslinux/kiosk.target'
  } ~>
  exec { '/usr/bin/systemctl daemon-reload':
    refreshonly => true
  } ->
  service { 'setboot-challenges':
    enable => true
  } ->
  service { 'setboot-reg':
    enable => true
  } ->
  service { 'setboot-kiosk':
    enable => true
  }
}
