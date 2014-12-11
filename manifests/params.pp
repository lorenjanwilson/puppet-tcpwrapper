class tcpwrapper::params {
  if $::osfamily == 'RedHat' {
    $package_name = "tcp_wrappers"
  } else {
    $package_name = "tcpd"
  }

  $hosts_allow = "/etc/hosts.allow"
  $hosts_deny = "/etc/hosts.deny"
}
