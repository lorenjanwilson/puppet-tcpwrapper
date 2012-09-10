define tcpwrapper::hosts::allow ( $pattern,
                                  $shell_command = undef ) {
  concat::fragment { "hosts_allow_${name}":
    ensure  => present,
    target  => $tcpwrapper::params::hosts_allow,
    content => inline_template("${name}: ${pattern}<% if shell_command != :undef %>: ${shell_command}<% end %>\n"), 
    order   => 15,
  }
}
