# Use the puppetlabs/dism, puppet/windowsfeature or puppetlabs/dsc_lite modules to install IIS
# Use the puppetlabs/iis module to create a basic website
class profile::iis {
  dism { 'IIS-WebServer':
    ensure => present,
    answer => 'C:\answer\iis.xml',
  }
}
