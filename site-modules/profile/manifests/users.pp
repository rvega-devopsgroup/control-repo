class profile::users {
  user { 'student1':
    ensure => present,
    groups => ['Users', 'Students'],
    password => 'student1',
    managehome => true,
  }

   group { 'Students':
    ensure => present,
  } 
}
