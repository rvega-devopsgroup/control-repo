class profile::base {
  group { 'student':
    ensure => present,
  }

  user { 'student':
    ensure => present,
    groups => 'student',
  }
}
