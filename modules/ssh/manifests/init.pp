class ssh ($authkeys = ['mark']) {
  ssh::key { $authkeys:
    user => 'root'
  }
  package { 'openssh':
    ensure => latest
  } ->
  service { 'sshd':
    enable => true
  }
  file { '/etc/ssh/sshd_config':
    source => 'puppet:///modules/ssh/sshd_config'
  }
  file { '/etc/issue':
    source => 'puppet:///modules/ssh/issue'
  }
}
