class profile::registry {
  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonOn':
    ensure => present,
    type   => REG_DWORD,
    data   => "1",
  }

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI':
    ensure => present,
    type   => REG_DWORD,
    data   => "1",
  }
}
