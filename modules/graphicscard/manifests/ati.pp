class graphicscard::ati {
  include graphicscard
  package { 'xorg-x11-drv-ati':
    ensure => latest
  }
}
