define tcpwrapper::hosts::deny ( $pattern,
                                 $shell_command = undef ) {
  concat::fragment { "hosts_deny_${name}":
    ensure  => present,
    target  => $tcpwrapper::params::hosts_deny,
    content => inline_template("${name}: ${pattern}<% if shell_command != :undef %>: ${shell_command}<% end %>\n"),
    order   => 15,
  }
}
