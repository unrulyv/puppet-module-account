# Manage local user account on Linux
define account::locallinuxuser(
  $ensure = present,
  $fullname = 'Full Name',
  $expiry = absent,
  $gid  = $title,
  $groups = [$title],
  $home = "/home/${title}",
  $managehome = false,
  $password = '',
  $password_max_age = 100000,
  $password_min_age = 0,
  $shell = '/bin/bash',
  $system = false,
) {
  if validate_re($title, '/^[a-z0-9_-]{3,16}$/') {
    group { $gid:
      ensure     => $ensure,
      forcelocal => true,
      system     => false,
    }
    user { $title:
      ensure           => $ensure,
      name             => $title,
      comment          => $fullname,
      expiry           => $expiry,
      gid              => $gid,
      groups           => $groups,
      home             => $home,
      managehome       => $managehome,
      password         => $password,
      password_max_age => $password_max_age,
      password_min_age => $password_min_age,
      shell            => $shell,
      system           => $system,
      require          => Group[$gid]
    }
  }
  else  {
    fail("account::locallinuxuser: ${title} is an invalid username")
  }
}
