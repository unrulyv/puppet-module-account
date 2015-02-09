# == Class: account
#
# Full description of class account here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { account:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class account(
  $hash_users = $::account::params::users,
  $hash_groups = $::account::params::groups,
  $hash_ssh_authorized_keys = $::account::params::ssh_authorized_keys,
) {
  if $hash_users != undef {
    validate_hash($hash_users)
    create_resources(user, $hash_users)
  }
  if $hash_groups != undef {
    validate_hash($hash_groups)
    create_resources(group, $hash_groups)
  }
  if $hash_ssh_authorized_keys != undef {
    validate_hash($hash_ssh_authorized_keys)
    create_resources(ssh_authorized_key, $hash_ssh_authorized_keys)
  }
}
