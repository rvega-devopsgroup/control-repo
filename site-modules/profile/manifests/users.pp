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
    ensure       => present,
    policy_value => 'DOMAIN\student1',
    require      => User['student1'],
  } 
}
