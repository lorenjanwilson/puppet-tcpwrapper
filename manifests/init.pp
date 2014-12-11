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

  package { $package_name: ensure => present }

  concat { $hosts_allow:
    path  => $hosts_allow,
    owner => root,
    group => root,
    mode  => 644,
  }
  concat { $hosts_deny:
    path  => $hosts_deny,
    owner => root,
    group => root,
    mode  => 644,
  }

  concat::fragment { "hosts_allow":
    target  => $hosts_allow,
    content => "# MANAGED BY PUPPET\n",
    order => 01,
  }

  concat::fragment { "hosts_deny":
    target  => $hosts_deny,
    content => "# MANAGED BY PUPPET\n",
    order => 01,
  }

}
