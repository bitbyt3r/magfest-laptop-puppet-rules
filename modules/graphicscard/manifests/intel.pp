class graphicscard::intel {
  include graphicscard
  package { 'xf86-video-intel':
    ensure => latest
  }
}

