# Package Management
#	  - Install 7-zip using the puppet/staging archive module - depreciated module use puppet/archive instead
#   - Install 7-zip using chocolatey and the puppetlabs/chocolatey forge module
class profile::packages {
  # class { 'archive':
  #   seven_zip_name     => '7-Zip 9.20 (x64 edition)',
  #   seven_zip_source   => 'C:/Windows/7z920-x64.msi',
  #   seven_zip_provider => 'windows',
  # }
}
