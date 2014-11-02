#
class beanstalkd::install inherits beanstalkd {

  package { $package_name:
    ensure => $package_ensure,
  }

}
