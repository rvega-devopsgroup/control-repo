# Use the puppetlabs/dism, puppet/windowsfeature or puppetlabs/dsc_lite modules to install IIS
# Use the puppetlabs/iis module to create a basic website
class profile::iis {
  dism { 'IIS-WebServer':
    ensure => present,
    answer => 'C:\answer\iis.xml',
  }

  # Delete the default website to prevent a port binding conflict.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Dism['IIS-WebServer'],
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

  file { 'c:\\my-website\\cats\\index.html':
     ensure  => present,
     content => 'I love cats',
     require => File['c:\\my-website\\cats']
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
    require          => [ File['c:\\my-website\\cats'], Iis_application_pool['cats_app_pool'] ]
  }

}
