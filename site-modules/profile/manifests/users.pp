# Local Accounts
#	  - Create a local user
#		- Create a local group
#		- Ensure the user is in the group
#   - Grant your user the "Log on as a Service" right
class profile::users (
  String $username,
) {
  user { $username:
    ensure     => present,
    groups     => ['Users', 'Students'],
    password   => '2Yz@1A!H3JkPJR9yzMcxUwpO',
    managehome => true,
  }

  group { 'Students':
    ensure => present,
    before => User[$username],
  }

  # Munging failed for value "student1" in class policy_value: incomplete "\x00" on UTF-16LE
  # local_security_policy { 'Log on as a service':
  #   ensure         => present,
  #   policy_value   => "student1",
  #   require        => User['student1'],
  # }
}
