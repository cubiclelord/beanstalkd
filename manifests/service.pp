#
class beanstalkd::service inherits beanstalkd {

  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  service { 'beanstalkd':
    ensure     => $service_ensure,
    enable     => $service_enable,
    provider   => $service_provider,
    hasstatus  => true,
    hasrestart => true,
  }

}
