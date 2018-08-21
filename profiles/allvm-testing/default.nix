{ config, lib, pkgs, ... }:
{
  nix = {
    binaryCaches = [
      "https://cache.nixos.org/"
      "https://allvm.cachix.org"
    ];
    binaryCachePublicKeys = [
      "allvm.cachix.org-1:nz7VuSMfFJDKuOc1LEwUguAqS07FOJHY6M45umrtZdk="
    ];
    trustedUsers = [
      "root"
      "shados"
    ];
  };
}
