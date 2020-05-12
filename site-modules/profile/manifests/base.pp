class profile::base {
  user { 'student':
    ensure => present,
    groups => 'student',
  }
}
