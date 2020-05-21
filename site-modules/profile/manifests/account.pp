# Local Accounts
#	  - Create a local user
#		- Create a local group
#		- Ensure the user is in the group
#   - Grant your user the "Log on as a Service" right

# File and directory permissions
#	  - Create a new directory
#		  - Ensure its owner is the user you are managing
#		  - Ensure its group similarly
#		  - Inspect the directory permissions
#		- Manage the directory permissions using the puppetlabs/acl module
#		  - Grant the local user Full Control
#     - Grant the local group Read Only permissions
class profile::account (
  String $username,
  String $group,
  String $password,
  String $home_dir,
) {
  user { $username:
    ensure     => present,
    groups     => ['Users', $group],
    password   => $password,
    managehome => true,
  }

  group { $group:
    ensure => present,
    before => User[$username],
  }

  # I suspect this error might be due to a Windows incompatibility, I cannot figure it out. Munging failed for value "student1" in class policy_value: incomplete "\x00" on UTF-16LE
  # local_security_policy { 'Log on as a service':
  #   ensure         => present,
  #   policy_value   => $username,
  #   require        => User[$username],
  # }

  file { $home_dir:
    ensure => 'directory',
    owner  => $username,
    group  => $group,
  }

  acl { $home_dir:
    purge       => true,
    permissions => [
      { identity => $username, rights => ['full'] },
      { identity => $group, rights => ['read'] },
    ],
  }


}
