# == Class: beanstalkd
#
# This module installs and manages the beanstalkd daemon. You can find more
# inforamtion about beanstalkd here: http://kr.github.io/beanstalkd/
#
# === Parameters
#
# [*listen_addr*]
#   Which address to bind beanstalkd to. Defaults to '127.0.0.1'.
#
# [*listen_port*]
#   Which port to bind beanstalkd to. Defaults to '11300'.
#
# [*enable_binlog*]
#   Whether to enable binlogging. Defaults to false. Other value is true.
#
# [*binlog_directory*]
#   If binlogging is enabled, specify the directory that the beanstalkd binlog
#   will log to. Defaults to '/var/lib/beanstalkd' on Debian families and 
#   '/var/lib/beanstalkd/binlog' on RedHat families.
#
# [*package_ensure*]
#   Whether the beanstalkd package is present. Defaults to 'present'. Other 
#   values are 'latest', or a specific version.
#
# [*service_ensure*]
#   Whether the beanstalkd service should be running. Defaults to 'running'.
#   Other value is 'stopped'.
#
# [*service_enable*]
#   Whether the beanstalkd service should be enabled at boot. Defaults to
#   true. Other value is false.
#
# [*user*]
#   User that the beanstalkd process runs as. Default is 'beanstalkd'.
#
# [*max_job_size*]
#   Maximum size in bytes that beanstalkd allows for a job. Defaults to
#   '65535'.
#
# [*service_start_yes*]
#   Start service at system boot. Defaults to false
#
# [*daemon_options*]
#  Pass Options (e.g. listen_addr) to service. Defaults to false
#
#
# === Examples
#
#  class { 'beanstalkd':
#    listen_addr      => '0.0.0.0',
#    listen_port      => '11300',
#    enable_binlog    => true,
#    binlog_directory => '/var/lib/beanstalkd',
#    package_ensure   => 'present',
#    service_ensure   => 'running',
#    service_enable   => true,
#  }
#
# === Authors
#
# Jeremy Bowers <cubiclelord@gmail.com>
#
# === Copyright
#
# Copyright 2015 Jeremy Bowers, unless otherwise noted.
#
class beanstalkd (
  $listen_addr        = $beanstalkd::params::listen_addr,
  $listen_port        = $beanstalkd::params::listen_port,
  $enable_binlog      = $beanstalkd::params::enable_binlog,
  $binlog_directory   = $beanstalkd::params::binlog_directory,
  $package_ensure     = $beanstalkd::params::package_ensure,
  $service_ensure     = $beanstalkd::params::service_ensure,
  $service_enable     = $beanstalkd::params::service_enable,
  $user               = $beanstalkd::params::user,
  $max_job_size       = $beanstalkd::params::max_job_size,
  $service_start_yes  = $beanstalkd::params::service_start_yes,
  $daemon_options     = $beanstalkd::params::daemon_options

) inherits beanstalkd::params {

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'beanstalkd::begin': } ->
  class { '::beanstalkd::install': } ->
  class { '::beanstalkd::config': } ~>
  class { '::beanstalkd::service': } ->
  anchor { 'beanstalkd::end': }
}
