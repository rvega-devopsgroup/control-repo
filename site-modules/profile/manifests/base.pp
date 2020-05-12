class profile::base {
  user { 'student':
    ensure => present,
  }

  group { 'student':
    ensure => present,
    before => User['student'],
  }
}
