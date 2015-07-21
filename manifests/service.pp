#
class beanstalkd::service inherits beanstalkd {

  if ($service_manage == true) {
    if ! ($service_ensure in [ 'running', 'stopped' ]) {
      fail('service_ensure parameter must be running or stopped')
    }
  }

  service { 'beanstalkd':
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
    restart    => $service_restart,
  }

}
