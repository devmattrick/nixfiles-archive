#!/bin/sh

# Simple script to build and run a VM image of the NixOS configuration

rm ./nixos.qcow2

if nix build .#nixosConfigurations.vm.config.system.build.vm ; then
    ./result/bin/run-nixos-vm
fi
