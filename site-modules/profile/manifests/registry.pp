# Use the puppetlabs/registry module to do the following:
#	  - Enable Internet Explorer enhanced security configuration (IEESC)
#   - Enable the Windows Shutdown Event Tracker
class profile::registry {
  # registry_key { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability':
  #   ensure => present,
  # }
  #
  # registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonOn':
  #   ensure => present,
  #   type   => string,
  #   data   => '1',
  # }
  #
  # registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI':
  #   ensure => present,
  #   type   => string,
  #   data   => '1',
  # }
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability\ShutdownReasonUI':
    ensure   => present,
    type     => dword,
    data     => '1',
  }

  registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => present,
    type   => string,
    data   => '1',
  }
}
