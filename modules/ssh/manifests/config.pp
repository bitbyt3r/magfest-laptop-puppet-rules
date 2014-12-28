class ssh::config ($allowgroups = '', $allowusers = ['root']) {
  # For most configuration values below, we want to ensure their
  # presence, so set a default.
  Sshd_config {
    require => Package['openssh'],
    ensure  => present,
    notify  => Service['sshd']
  }

  Sshd_config_subsystem {
    require => Package['openssh'],
    ensure  => present,
    notify  => Service['sshd']
  }

  # Explicitly support protocol 2, but not 1.
  sshd_config { 'Protocol':
    ensure => present,
    value  => '2'
  }

  if $allowgroups == '' {
    $allowgroupspresent = 'absent'
  } else {
    $allowgroupspresent = 'present'
  }

  sshd_config { 'AllowGroups':
    ensure => $allowgroupspresent,
    value => $allowgroups
  }

  if $allowusers == '' {
    $allowuserspresent = 'absent'
  } else {
    $allowuserspresent = 'present'
  }

  sshd_config { 'AllowUsers':
    ensure => $allowuserspresent,
    value => $allowusers
  }

  # Expliclty disallow clear text passwords.
  sshd_config { 'PasswordAuthentication':
    value => 'no'
  }

  # Enable our default banner.
  sshd_config { 'Banner':
    value => '/etc/issue'
  }
}
