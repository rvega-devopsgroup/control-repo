# Package Management
#	  - Install 7-zip using the puppet/staging archive module - depreciated module use puppet/archive instead
#   - Install 7-zip using chocolatey and the puppetlabs/chocolatey forge module
class profile::packages {
  class { 'archive':
    seven_zip_name     => '7-Zip 19.00 (x64 edition)',
    seven_zip_source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
    seven_zip_provider => 'windows',
  }
  # download_file { "Download 7zip" :
  #   url                   => 'https://www.7-zip.org/a/7z1900-x64.msi',
  #   destination_directory => 'c:\Windows\Temp'
  # }
}
