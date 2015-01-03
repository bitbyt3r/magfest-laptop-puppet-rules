class graphicscard::ati {
  include graphicscard
  package { 'xf86-video-ati':
    ensure => latest
  }
}
