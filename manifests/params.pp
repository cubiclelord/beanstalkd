#
class beanstalkd::params {

  $listen_addr      = '127.0.0.1'
  $listen_port      = '11300'
  $enable_binlog    = false
  $package_ensure   = 'present'
  $service_ensure   = 'running'
  $service_enable   = true
  $max_job_size     = '65535'

  case $::osfamily {
    'Debian': {
      if $::operatingsystem == 'Ubuntu' and $::operatingsystemmajrelease == '12.04' and $service_ensure == 'running' {
        $service_start_yes = true
        $daemon_options    = true
      }
      elsif $::operatingsystem == 'Debian' and $::operatingsystemmajrelease == '7' and $service_ensure == 'running' {
        $service_start_yes = true
        $daemon_options    = true
      }
      else {
        $service_start_yes = false
        $daemon_options    = false
      }
      $binlog_directory = '/var/lib/beanstalkd'
      $config           = '/etc/default/beanstalkd'
      $config_template  = 'beanstalkd/beanstalkd.debian.erb'
      $package_name     = 'beanstalkd'
      $user             = 'beanstalkd'
      $group            = 'beanstalkd'
    }
    'RedHat': {
      $binlog_directory = '/var/lib/beanstalkd/binlog'
      $config           = '/etc/sysconfig/beanstalkd'
      $config_template  = 'beanstalkd/beanstalkd.redhat.erb'
      $package_name     = 'beanstalkd'
      $user             = 'beanstalkd'
      $group            = 'beanstalkd'
    }
    default: {
      fail("The ${module_name} module is not supported on a ${::operatingsystem} distribution.")
    }
  }

}
