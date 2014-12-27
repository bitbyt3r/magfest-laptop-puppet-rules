class graphicscard {
  # Include the correct videocard drivers automatically.
  $driverclass = $::videocard ? {
    /.*NVIDIA.*/            => 'nvidia',
    /.*Intel Corporation.*/ => 'intel',
    /.*ATI.*/               => 'ati',
    /.InnoTek.*/            => 'innotek',
    default                 => ''
  }

  # If the driverclass didn't get set, and the videocard is non-empty,
  # fail. If the driverclass is set, try to include the correct package.
  # If neither is set, just skip it.
  if $driverclass == '' {
    if $::videocard != '' {
      err("Unknown ${::videocard}")
    }
  } else {
    class { "graphicscard::${driverclass}": }
  }
}
