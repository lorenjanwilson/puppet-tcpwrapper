#
# == Class tcpwrapper
#
# Manages the tcpwrapper service
#
# == Usage
#   include tcpwrapper
#   tcpwrapper::hosts::allow { "sshd": pattern => "127.0.0.1 127.0.0.2" }
#   tcpwrapper::hosts::deny { "sshd": pattern => "ALL" }
#
# == Dependencies
# https://github.com/ripienaar/puppet-concat
#
class tcpwrapper inherits tcpwrapper::params {

  include concat::setup

  package { $tcpwrapper::params::package_name: ensure => present }

  concat { $tcpwrapper::params::hosts_allow:
    path  => $tcpwrapper::params::hosts_allow,
    owner => root,
    group => root,
    mode  => 644,
  }
  concat { $tcpwrapper::params::hosts_deny:
    path  => $tcpwrapper::params::hosts_deny,
    owner => root,
    group => root,
    mode  => 644,
  }

  concat::fragment { "hosts_allow":
    target  => $tcpwrapper::params::hosts_allow,
    content => "# MANAGED BY PUPPET\n",
    order => 01,
  }

  concat::fragment { "hosts_deny":
    target  => $tcpwrapper::params::hosts_deny,
    content => "# MANAGED BY PUPPET\n",
    order => 01,
  }

}
