class profile::users {
  user { 'student1':
    ensure => present,
    groups => ['Users', 'student1'],
    password => 'student1',
    managehome => true,
  }

  group { 'student1':
    ensure => present,
    before => User['student1'],
  }
}
