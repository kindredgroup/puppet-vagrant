#!/usr/bin/env bats

@test "vagrant-puppet-install plugin should be installed" {
  su -l root -c 'vagrant plugin list |grep "^vagrant-puppet-install"'
}