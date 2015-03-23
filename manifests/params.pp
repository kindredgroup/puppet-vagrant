# == Class: vagrant::params
#
# === Copyright
#
# Copyright 2015 North Development AB
#

class vagrant::params {

  $ensure = latest
  $version = get_latest_vagrant_version()

  case $::kernel {
    windows: {
      $path = [ 'C:\Windows\System32\WindowsPowerShell\v1.0', 'C:\Windows\System32', 'C:\HashiCorp\Vagrant\bin' ]
      $vagrant = 'vagrant.exe'
      $grep    = 'findstr.exe /I'
    }
    default: {
      $path = [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ]
      $vagrant = 'vagrant'
      $grep    = 'grep -i'
    }
  }
  $install_from_source = true
  $provider = $::operatingsystem ? {
    centos => rpm,
    redhat => rpm,
    fedora => rpm,
    debian => dpkg,
    ubuntu => dpkg,
    linuxmint => dpkg,
    Darwin => pkgdmg,
    windows => windows
  }
  $source = undef
}