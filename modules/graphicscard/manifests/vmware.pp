class graphicscard::vmware {
  package { 'xf86-video-vmware':
    ensure => latest
  } ->
  package { 'xf86-input-vmmouse':
    ensure => latest
  } ->
  package { 'open-vm-tools':
    ensure => present
  } ->
  service { 'vmtoolsd':
    enable => true
  }
}
