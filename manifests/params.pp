# Params
class account::params {
  $users = hiera_hash('account::users', {})
  $groups = hiera_hash('account::groups', {})
  $ssh_authorized_keys = hiera_hash('account::ssh_authorized_keys', {})
}
