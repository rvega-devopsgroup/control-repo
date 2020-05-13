class profile::users {
  user { 'student1':
    ensure     => present,
    groups     => ['Users', 'Students'],
    password   => 'student1',
    managehome => true,
  }

  group { 'Students':
    ensure => present,
    before => User['student1'],
  }

/*   local_security_policy { 'Log on as a service':
    ensure       => present,
    policy_value => 'student1',
  } */
}
