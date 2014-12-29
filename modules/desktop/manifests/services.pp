class desktop::services {
  file { '/etc/systemd/system/challenge.target.wants':
    ensure => directory
  } ->
  file { '/etc/systemd/system/challenge.target.wants/ntpd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/ntpd.service'
  } ->
  file { '/etc/systemd/system/challenge.target.wants/puppet.service':
    ensure => link,
    target => '/usr/lib/systemd/system/puppet.service'
  } ->
  file { '/etc/systemd/system/challenge.target.wants/sshd.service':
    ensure => link,
    target => '/usr/lib/systemd/system/sshd.service'
  }
  file { '/etc/systemd/system/challenge.target.wants/NetworkManager.service':
    ensure => link,
    target => '/usr/lib/systemd/system/NetworkManager.service'
  }
  file { '/etc/systemd/system/multi-user.target.wants/display-manager.service':
    ensure => link,
    target => '/etc/systemd/system/display-manager.service'
  }
}
