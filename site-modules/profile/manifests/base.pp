class profile::base {
  groups { 'student':
    ensure => present,
  }

  user { 'student':
    ensure => present,
    groups => 'student',
}
