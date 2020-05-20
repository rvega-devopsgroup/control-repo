# Local Accounts
#	  - Create a local user
#		- Create a local group
#		- Ensure the user is in the group
#   - Grant your user the "Log on as a Service" right
class profile::users {
  user { 'student1':
    ensure     => present,
    groups     => ['Users', 'Students'],
    password   => '2Yz@1A!H3JkPJR9yzMcxUwpO',
    managehome => true,
  }

  group { 'Students':
    ensure => present,
    before => User['student1'],
  }

  local_security_policy { 'Log on as a service':
    ensure         => present,
    policy_setting => 'SeServiceLogonRight',
    policy_type    => 'Privilege Rights',
    policy_value   => "DOMAIN\\student1",
    require        => User['student1'],
  }
}
