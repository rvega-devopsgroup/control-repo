class profile::users {
  user { 'student1':
    ensure => present,
  }
}
