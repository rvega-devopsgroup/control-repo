class profile::directory_permissions {
  file { 'C:/directory':
    ensure => 'directory',
    owner  => 'student1',
    group  => 'Students',
  }

  acl { 'C:/directory':
    purge       => true,
    permissions => [
      { identity => 'student1', rights => ['full'] },
      { identity => 'Students', rights => ['read'] },
    ],
  }
}
