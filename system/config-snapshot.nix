# Include a copy of the current /etc/nixos folder in the built profile, and
# symlink it to /etc to locate it more easily. Means you can conveniently
# inspect config for older profiles you reboot into.
#
# Has some potential security concerns, as there is no support for private
# files in the Nix store (yet), so it means any local user on the system can
# read your configuration options. I suggest only using on single-user
# desktop/laptop systems as a result.
{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.fragments.cfg-snapshot.enable;
  confDir = pkgs.runCommand "snapshot-nixos-config" {
    src = /etc/nixos;
    # Local-only
    allowSubstitutes = false;
    preferLocalBuild = true;
  } ''
    cp -r $src $out
  '';
in
{
  options = {
    fragments.cfg-snapshot.enable = mkEnableOption "snapshotting /etc/nixos into each system profile";
  };
  config = mkIf cfg {
    environment.etc."nixos-snapshot" = {
      source = "${confDir}/*";
      mode = "0550";
    };
  };
}
