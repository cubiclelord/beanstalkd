#
class beanstalkd::config inherits beanstalkd {

  file { $config:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($config_template),
  }
  
  file { $binlog_directory:
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0644',
  }
}
