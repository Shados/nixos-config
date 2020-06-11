# Baseline SN NixOS configuration
{ config, lib, pkgs, ... }:
# TODO Prettify console? Fonts, colour scheme?

with lib;
let
  cfg = config.fragments;
in

{
  imports = [
    # Self-packaged and custom/bespoke packages & services
    ./bespoke
    # Standard userspace tooling & applications
    ./apps
    # nixpkgs overlays as generic (non-NixOS) modules
    ./overlays
    # Conveniently packaged system 'functional profiles', including
    # container/VM profiles
    ./profiles
    # Security-focused configuration
    ./security
    # Service configuration
    ./services
    # System default configuration changes
    ./system
  ];


  options = {
    fragments.remote = mkOption {
      type = with types; bool;
      default = true;
      description = ''
        Whether or not this system is remote (i.e. not one I will ever access
        with a physical keyboard and mouse).
      '';
    };
  };

  config = mkMerge [
    (mkIf cfg.remote {
      i18n.consoleKeyMap = ./system/sn.map.gz;
      systemd.enableEmergencyMode = mkDefault false;
    })
    {
      boot.cleanTmpDir = true;

      # Internationalisation & localization properties.
      console.font   = mkDefault "lat9w-16";
      i18n = {
        defaultLocale = "en_US.UTF-8";
      };
      time.timeZone = "Australia/Melbourne";

      documentation.nixos = {
        enable = true;
        includeAllModules = true;
      };
    }
    # Setup my personal Nix User Repository & Cachix cache for it
    { nix = {
        binaryCaches = singleton "https://shados-nur-packages.cachix.org";
        binaryCachePublicKeys = singleton "shados-nur-packages.cachix.org-1:jGzLOsiYC+TlK8i7HZmNarRFf/LeZ0/J1BJ6NMpNAVU=";
      };
      nixpkgs.overlays = singleton (self: super: {
        nur.repos.shados = import (import ./pins).shados-nur { inherit pkgs; };
      });
    }
  ];
}
