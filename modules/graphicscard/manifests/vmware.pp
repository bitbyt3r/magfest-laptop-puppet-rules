class graphicscard::vmware {
  package { 'xf86-video-vmware':
    ensure => latest
  } ->
  package { 'xf86-input-vmmouse':
    ensure => latest
  } ->
  service { 'vmtoolsd':
    enable => true
  }
}
