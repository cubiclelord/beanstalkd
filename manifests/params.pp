#
class beanstalkd::params {

  $listen_addr      = '127.0.0.1'
  $listen_port      = '11300'
  $enable_binlog    = false
  $binlog_directory = '/var/lib/beanstalkd'
  $package_ensure   = 'present'
  $service_ensure   = 'running'
  $service_enable   = true

  case $::osfamily {
    'Debian': {
      $config          = '/etc/default/beanstalkd'
      $config_template = 'beanstalkd/beanstalkd.erb'
      $package_name    = 'beanstalkd'
    }
    default: {
      fail("The ${module_name} module is not supported on a ${::operatingsystem} distribution.")
    }
  }

}
