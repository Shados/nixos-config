{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; rec {
    rxvt_unicode = callPackage ./urxvt24bit {
      perlSupport = true;
      gdkPixbufSupport = true;
      unicode3Support = true;
    };
  };
}
