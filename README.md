# beanstalkd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with beanstalkd](#setup)
    * [What beanstalkd affects](#what-beanstalkd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with beanstalkd](#beginning-with-beanstalkd)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This is a Puppet module to manage a Beanstalkd instance.

## Module Description

The Beanstalkd module handles installing, configuring, and running the Beanstalkd daemon.

## Setup

### What beanstalkd affects

* beanstalkd package
* beanstalkd configuration
* beanstalkd service

### Beginning with beanstalkd

`include 'beanstalkd'` is enough to get you up and running. If you'd like to
pass parameters, you can do something like this:

```puppet
class { 'beanstalkd':
  listen_addr      => '0.0.0.0',
  listen_port      => '11300',
  enable_binlog    => true,
  binlog_directory => '/var/lib/beanstalkd',
}
```
Or, you can use the same options in hiera:
```yaml
---
beanstalkd::listen_addr: '0.0.0.0'
beanstalkd::listen_port: '11300'
beanstalkd::enable_binlog: 'true'
beanstalkd::binlog_directory: '/var/lib/beanstalkd'
```

## Reference

### Classes

#### Public Classes

* beanstalkd: Main class, includes all other classes

#### Private Classes

* beanstalkd::install: Handles the package installation
* beanstalkd::config: Handles the configuration
* beanstalkd::service: Handles the service

### Parameters

The following parameters are available:

####`listen_addr`
Which address to bind beanstalkd to. Defaults to '127.0.0.1'.

####`listen_port`
Which port to bind beanstalkd to. Defaults to '11300'.

####`enable_binlog`
Whether to enable binlogging. Defaults to false. Other value is true.

####`binlog_directory`
If binlogging is enabled, specify the directory that the beanstalkd binlog
will log to. Defaults to '/var/lib/beanstalkd' on Debian families and 
'/var/lib/beanstalkd/binlog' on RedHat families.

####`package_ensure`
Whether the beanstalkd package is present. Defaults to 'present'. Other values
are 'latest', or a specific version.

####`service_ensure`
Whether the beanstalkd service should be running. Defaults to 'running'.
Other value is 'stopped'.

####`service_enable`
Whether the beanstalkd service should be enabled at boot. Defaults to
true. Other value is false.

####`user`
User that the beanstalkd process runs as. Default is 'beanstalkd'.
This option only works in RedHat families.

####`max_job_size`
Maximum size in bytes that beanstalkd allows for a job. Defaults to '65535'.
This option only works in RedHat famillies.

## Limitations

This module currently is tested using Ubuntu 14.04, 12.04 as well as CentOS 6.
The EPEL module is required for RedHat families to install beanstalkd.

## Development

Feel free to submit pull requests if you'd like to add additional platforms or features

## Contributors

This module was written by Jeremy Bowers <cubiclelord@gmail.com>
