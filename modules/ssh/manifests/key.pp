# ssh::key provides a wrapper for including ssh_authorized_keys from
# files in the files/keys directory. The $name is used as the key
# identifier.
#
# `$directory` is the directory prefixed to the key path
# `$suffix` is the file extension given to keys
# `$type` is the key type as known by ssh_authorized_keys (read from file)
# `$user` is the username whom the key will authorize
#
# Example:
#
#     # Define some defaults. Say we're authorizing the sysadmins.
#     Ssh::Key {
#       user => 'root',
#     }
#
#     # John Smith has a simple key. It's called jsmith.pub, and was
#     # copied directly from his $HOME/.ssh/id_rsa.pub.
#     ssh::key { 'jsmith': }
#
#     # Mary Jane's is a bit harder. The key file is mj1980, but her
#     # username at the office is mjane. Also, it's a dsa key, but the key
#     # file got a bit mangled and doesn't say so, so we have to specify.
#     ssh::key { 'mjane':
#       name => 'mj1980',
#       type => 'dsa'
#     }
# }
define ssh::key ($user = 'root', $type = '',
  $directory = "/etc/puppet/environments/${environment}/modules/ssh/files/keys",
  $suffix = '.pub') {
  # First, read the file into an array. Take care to use double quotes
  # when working with variables.
  $keyarr = split(strip(file("${directory}/${name}${suffix}")), ' ')

  # If the type is not defined, determine it by the first word of the
  # file.
  if $type == '' {
    $key_type = $keyarr[0]
  } else {
    $key_type = $type
  }

  # Finally, invoke the actual provider.
  ssh_authorized_key { $name:
    ensure => present,
    user   => $user,
    type   => $key_type,
    key    => strip($keyarr[1])
  }
}
