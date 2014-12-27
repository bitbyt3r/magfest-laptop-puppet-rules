class graphicscard::nouveau {
  include graphicscard
  package { 'xorg-x11-drv-nouveau':
    ensure => latest
  }
}
