class profile::base {
  user { 'student':
    ensure => present,
    groups => 'student',
  }

  group { 'student':
    ensure => present,
    before => User['student'],
  }
}
