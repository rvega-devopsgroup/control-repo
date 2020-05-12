class profile::directory_permissions {
  file { 'C:/directory':
    ensure => 'directory',
    owner  => 'student1',
    group  => 'Students',
  }
}
