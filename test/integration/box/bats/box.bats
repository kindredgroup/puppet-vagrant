#!/usr/bin/env bats

@test "puppetlabs/centos-6.6-64-puppet should be available" {
  su -l root -c 'vagrant box list |grep "^puppetlabs/centos-6.6-64-puppet"'
}