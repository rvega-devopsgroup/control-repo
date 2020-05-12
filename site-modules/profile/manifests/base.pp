class profile::base {
  user { 'student':
    ensure => present,
  }
}
