# Use the puppetlabs/dism, puppet/windowsfeature or puppetlabs/dsc_lite modules to install IIS
# Use the puppetlabs/iis module to create a basic website
class profile::iis {
  dism { 'IIS-WebServer':
    ensure => present,
    answer => 'C:\answer\iis.xml',
  }

  # Create Directories
    file { 'c:\\my-website':
    ensure  => 'directory',
    require => Dism['IIS-WebServer'],
  }

  file { 'c:\\my-website\\cats':
    ensure  => 'directory',
    require => File['c:\\my-website'],
  }

  file { 'c:\\my-website\\cats_vdir':
    ensure  => 'directory',
    require => File['c:\\my-website'],
  }

  # file { 'c:\\my-website\\cats_vdir\\index.html':
  #   ensure  => present,
  #   content => 'I love cats',
  #   require => File['c:\\my-website\\cats_vdir']
  # }

  # Set Permissions
  acl { 'c:\\my-website\\cats':
    permissions => [
      {'identity' => 'student1', 'rights' => ['read', 'execute']},
    ],
  }

  acl { 'c:\\my-website\\cats_vdir':
    permissions => [
      {'identity' => 'student1', 'rights' => ['read', 'execute']},
    ],
  }

  # Configure IIS
  iis_application_pool { 'cats_app_pool':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  }

  iis_site { 'cats':
    ensure           => 'started',
    physicalpath     => 'c:\\my-website\\cats',
    applicationpool  => 'cats_app_pool',
    enabledprotocols => 'http',
    require          => File['c:\\my-website\\cats'],
  }

  iis_virtual_directory { 'vdir':
    ensure       => 'present',
    sitename     => 'complete',
    physicalpath => 'c:\\my-website\\cats_vdir',
    require      => File['c:\\my-website\\cats'],
  }
}
