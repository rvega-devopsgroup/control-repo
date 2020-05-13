# File and directory permissions
#	  - Create a new directory
#		  - Ensure its owner is the user you are managing
#		  - Ensure its group similarly
#		  - Inspect the directory permissions
#		- Manage the directory permissions using the puppetlabs/acl module
#		  - Grant the local user Full Control
#     - Grant the local group Read Only permissions
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
