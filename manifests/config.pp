#
class beanstalkd::config inherits beanstalkd {

  file { $config:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($config_template),
  }
  
}
