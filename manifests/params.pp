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
      if $::operatingsystem == 'Ubuntu' and $::operatingsystemmajrelease == '12.04' and $service_ensure == 'running'
      {
        $service_start_yes  = true
        $daemon_options     = true
      } else {
        $service_start_yes = false
        $daemon_options    = false
      }
      $config          = '/etc/default/beanstalkd'
      $config_template = 'beanstalkd/beanstalkd.erb'
      $package_name    = 'beanstalkd'
    }
    default: {
      fail("The ${module_name} module is not supported on a ${::operatingsystem} distribution.")
    }
  }

}
