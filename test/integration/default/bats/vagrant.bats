#!/usr/bin/env bats

@test "vagrant 1.6.3 should be installed" {
  vagrant --version | grep 1.6.3
}