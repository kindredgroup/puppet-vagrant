# == Class: vagrant::user
#
# Creates vagrant user and group with authorized insecure key and sudo access
#
# === Parameters
#
# [*ensure*]
#   Ensurable
#
# [*user_name*]
#   Vagrant user name
#
# [*group_name*]
#   Vagrant group name
#
# [*sudo_ensure*]
#   Ensurable for sudo access. It will follow the ensure parameter if it was set to absent
#
# === Examples
#
# # Install latest version
# include vagrant::user
#
# === Copyright
#
# Copyright 2015 North Development AB
#

class vagrant::user (
  $ensure      = present,
  $user_name   = vagrant,
  $group_name  = vagrant,
  $sudo_ensure = present,
) {

  $user_home = "/home/${user_name}"

  user {$user_name:
    ensure     => $ensure,
    home       => $user_home,
    managehome => true,
    password   => vagrant,
    comment    => 'Vagrant User',
    shell      => '/bin/bash',
    groups     => [$group_name, 'wheel'],
    require    => Group[$group_name],
  }

  group {$group_name:
    ensure => $ensure
  }

  File {
    owner   => $user_name,
    group   => $group_name,
    require => [User[$user_name], Group[$group_name]],
  }

  $dir_ensure = $ensure ? {
    present => directory,
    default => absent
  }

  file {"${user_home}/.ssh":
    ensure => $dir_ensure,
  }

  file {"${user_home}/.ssh/authorized_keys":
    ensure  => $ensure,
    content => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key',
  }

  $real_sudo_ensure = $ensure ? {
    absent  => absent,
    default => $sudo_ensure
  }

  file {'/etc/sudoers.d/vagrant':
    ensure  => $real_sudo_ensure,
    owner   => 'root',
    group   => 'root',
    content => "${user_name} ALL=(ALL) NOPASSWD: ALL",
  }
}