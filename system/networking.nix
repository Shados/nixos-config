{ config, pkgs, lib, ... }:
{
  # Default to OpenDNS nameservers
  networking.nameservers = lib.mkDefault [
    "208.67.220.220"
    "208.67.222.222"
  ];
}