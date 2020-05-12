class profile::users {
  user { 'student1':
    ensure => present,
    groups => ['Users'],
    password => 'student1',
    managehome => true,
  }

  group { 'student1':
    ensure => present,
    members => ['student1'],
  }
}
