class profile::users {
  user { 'student1':
    ensure => present,
    groups => 'student1',
  }

  group { 'student1':
    ensure => present,
    before => User['student1'],
  }
}
