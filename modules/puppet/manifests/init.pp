class puppet {
  file { '/etc/puppet/puppet.conf':
    content => template('puppet/puppet.erb'),
    notify => Service['puppet']
  }
  service { 'puppet':
    enable => true
  }
  exec { '/usr/bin/rm -f /var/lib/pacman/db.lck':
    unless => '/usr/bin/pgrep pacman'
  }
}
