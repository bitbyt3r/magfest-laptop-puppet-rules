class ssh ($allowgroups = '', $allowusers = ["root"], $authkeys = ['mark']) {
  ssh::key { $authkeys:
    user => 'root'
  }
  package { 'openssh':
    ensure => latest
  } ->
  service { 'sshd':
    enable => true
  }
  class { 'ssh::config':
    allowgroups => $allowgroups,
    allowusers => $allowusers
  }
}
