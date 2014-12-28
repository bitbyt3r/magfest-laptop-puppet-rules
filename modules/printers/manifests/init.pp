class printers {
  package { ['cups', 'ghostscript', 'gsfonts']:
    ensure => latest
  }
  package { 'hplip':
    ensure => latest
  }
}
