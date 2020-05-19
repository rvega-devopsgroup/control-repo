# Package Management
#	  - Install 7-zip using the puppet/staging archive module - depreciated module use puppet/archive instead
#   - Install 7-zip using chocolatey and the puppetlabs/chocolatey forge module
class profile::packages {
  include chocolatey

  # class { 'archive':
  #   seven_zip_name     => '7-Zip 19.00 (x64 edition)',
  #   seven_zip_source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
  #   seven_zip_provider => 'windows',
  # }
  # Using Chocolatey - Evaluation Error: Error while evaluating a Resource Statement, Duplicate declaration: Package[7zip] is already declared
  package { '7zip':
    ensure   => 19.00,
    source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
    notify   => Reboot['after_run'],
  }

  reboot { 'after_run':
    apply     => finished,
  }
}
