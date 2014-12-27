class graphicscard::nvidia {
  package { 'xf86-video-nouveau':
    ensure => latest
  }
}
