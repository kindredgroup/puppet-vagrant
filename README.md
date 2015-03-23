# puppet-vagrant

[![Build Status](https://secure.travis-ci.org/unibet/puppet-vagrant.png)](http://travis-ci.org/unibet/puppet-vagrant)

## Overview

This module ment to take care of vagrant installation and its plugins. It focuses on the latest vagrant versions
and therefore might not work properly with older releases requiring special setup, but it is still possible to
request a specific version.

It was inspiried by code from [mjanser](https://github.com/mjanser/puppet-vagrant) and [emyl](https://github.com/emyl/puppet-vagrant) modules, but forked due to their inactivity.

## Description

This module uses $::operatingsystem and $::architecture to determine what package to install.

NOTE: Versions older than 1.4.0 are not supported by this module because the download URL was complexer then.

Currently supports:
* CentOS and Redhat (i386 and x86)
* Ubuntu and Debian (i386 and x86)
* Windows (not tested)
* Darwin (not tested)

## Usage

Install latest version
```
include vagrant
```

Install 1.5.0
```
class { 'vagrant':
  version => '1.5.0'
}
```

Install plugin
```
vagrant::plugin { 'vagrant-hostmanager':
  user => 'myuser'
}
```

Install plugin in specific version
```
vagrant::plugin { 'vagrant-hostmanager':
  user    => 'myuser',
  version => 0.8.0
}
```

There are some more options which are the same as supported by the *vagrant plugin* command.
- prerelease
- source
- entry_point
